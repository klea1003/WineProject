package org.wine.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.wine.domain.BoardAttachVO;
import org.wine.domain.BoardVO;
import org.wine.domain.Criteria;
import org.wine.domain.pageDTO;
import org.wine.service.BoardService;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
/*import org.springframework.security.access.prepost.PreAuthorize;*/
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor

public class BoardController {
	private BoardService service;

//	@GetMapping("/list")
//	public void list(Criteria cri, Model model) {
//		log.info("list : " + cri);
//		model.addAttribute("list", service.getList(cri));
//	}

	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		log.info("list" + cri);
		model.addAttribute("list", service.getList(cri));
		int total = service.getTotal(cri);
		log.info("total:" + total);
		model.addAttribute("pageMaker", new pageDTO(cri, total));
	}

	/* @PreAuthorize("isAuthenticated()") */
	@PostMapping("/register") // �Խñ� ����
	public String register(BoardVO board, RedirectAttributes rttr) {
		log.info("register : " + board);
		if(board.getAttachList()!=null) {
			board.getAttachList().forEach(attach->log.info(attach));
		}
		service.register(board);
		rttr.addFlashAttribute("result", board.getBoardNum());
		return "redirect:/board/list"; // redirect�� �������� ���, ���� ��ħ�� ����
	}

//	@GetMapping("/get")
//	public void get(@RequestParam("boardNum") long boardNum, Model model) {
//		log.info("/get");
//		model.addAttribute("board", service.get(boardNum));
//	}

//	@GetMapping("/modify")
//	   public void modify(@RequestParam("boardNum")Long boardNum, Model model) {
//	      log.info("modify-----------");
//	      model.addAttribute("board", service.get(boardNum));
//	   }

	/* @PreAuthorize("principal.username == #board.writer") */
	@PostMapping("/modify")
	public String get(BoardVO board, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("modify : " + board);
		if (service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}
//		rttr.addAttribute("pageNum", cri.getPageNum());
//		rttr.addAttribute("amount", cri.getAmount());
//		rttr.addAttribute("type", cri.getType());
//		rttr.addAttribute("keyword", cri.getKeyword());
		return "redirect:/board/list" + cri.getListLink();
	}

	@GetMapping
	public void get(@RequestParam("boardNum") Long boardNum, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("/get or modify");
		model.addAttribute("board", service.get(boardNum));
	}

	//@PreAuthorize("principal.username == #writer")
	@PostMapping("/remove")
	   public String remove(@RequestParam("boardNum")Long boardNum,@ModelAttribute("cri")Criteria cri,RedirectAttributes rttr,String writer) {
	      log.info("remove....."+ boardNum);
	      List<BoardAttachVO> attachList = service.getAttachList(boardNum);
	      if(service.remove(boardNum)) {
	          deleteFiles(attachList);
	    	  rttr.addFlashAttribute("result","success");
	      }
//	      rttr.addAttribute("pageNum", cri.getPageNum());
//	      rttr.addAttribute("amount", cri.getAmount());
//	      rttr.addAttribute("type", cri.getType());
//	      rttr.addAttribute("keyword", cri.getKeyword());
	      return "redirect:/board/list" + cri.getListLink();
	   }

	//@PreAuthorize("isAuthenticated()")
	@GetMapping("/register")
	public void register() {

	}
	
	@GetMapping(value="/getAttachList", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<List<BoardAttachVO>> getAttachList(Long boardNum){
		log.info("getAttachList" + boardNum);
		return new ResponseEntity<>(service.getAttachList(boardNum), HttpStatus.OK);
	}
	
	private void deleteFiles(List<BoardAttachVO> attachList) {
		if(attachList == null || attachList.size() == 0) {return;}
		log.info("delete attah files........."); log.info(attachList);
		attachList.forEach(attach->{
			try {
				Path file = Paths.get("c:/upload/"+attach.getUploadPath()+"/"+attach.getUuid()+"_"+attach.getFileName());
				Files.deleteIfExists(file);
				if(Files.probeContentType(file).startsWith("image")) {
					Path thumbNail = Paths.get("c:/upload/"+attach.getUploadPath()+"/s_"+attach.getUuid()+"_"+attach.getFileName());
					Files.delete(thumbNail);
				}
			} catch (Exception e) { log.error("delete file error : " + e.getMessage()); }
			
		});//deleteFiles forEach
		
	}

}
