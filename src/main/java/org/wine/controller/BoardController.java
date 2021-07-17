package org.wine.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.wine.domain.BoardAttachVO;
import org.wine.domain.BoardLikeVO;
import org.wine.domain.BoardVO;
import org.wine.domain.Criteria;
import org.wine.domain.pageDTO;
import org.wine.service.BoardService;
import org.wine.service.EventService;
import org.springframework.beans.factory.annotation.Autowired;
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
	private EventService eventService;
	

    
	@PostMapping("/like")
	public String like(BoardLikeVO likeVO) {
		log.info("like : " + likeVO);
		int totallike = service.like(likeVO);
		log.info("totallike"+totallike);
		
		 return "redirect:/board/get?boardNum="+likeVO.getBoardNum(); 
	}
	@PostMapping("/dislike")
	public String dislike(BoardLikeVO likeVO) {
		log.info("like : " + likeVO);
		int totallike = service.disLike(likeVO);
		log.info("totallike"+totallike);
		
		 return "redirect:/board/get?boardNum="+likeVO.getBoardNum();
	}
	
	@GetMapping("/boardList")
	public void boardList(Criteria cri, Model model) {
		log.info("list" + cri);
		model.addAttribute("boardlist", service.getBList(cri));
		model.addAttribute("likelist", service.likelist(service.getBList(cri)));
		int total = service.getBTotal(cri);
		log.info("total:" + total);
		model.addAttribute("pageMaker", new pageDTO(cri, total));
	}
	
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		log.info("list" + cri);
		model.addAttribute("boardlist", service.getQList(cri));
		model.addAttribute("likelist", service.likelist(service.getQList(cri)));
		int total = service.getTotal(cri);
		log.info("total:" + total);
		model.addAttribute("pageMaker", new pageDTO(cri, total));
	}
	

	/* @PreAuthorize("isAuthenticated()")  나중에 시큐리티 기능 넣을때*/
	@PostMapping("/register") 
	public String register(BoardVO board, RedirectAttributes rttr) {
		log.info("register : " + board);
		if(board.getAttachList()!=null) {
			board.getAttachList().forEach(attach->log.info(attach));
		}
		service.register(board);
		rttr.addFlashAttribute("boardResult", board.getBoardNum());
		
		return "redirect:/board/list"; 
	}
	
	@PostMapping("/boardRegister") 
	public String boardRegister(BoardVO board, RedirectAttributes rttr) {
		log.info("register : " + board);
		if(board.getAttachList()!=null) {
			board.getAttachList().forEach(attach->log.info(attach));
		}
		service.register(board);
		rttr.addFlashAttribute("boardResult", board.getBoardNum());
		return "redirect:/board/boardList"; 
	}


	/* @PreAuthorize("principal.username == #board.writer") 나중에 시큐리티 기능 넣을때*/
	@PostMapping("/modify")
	public String get(BoardVO board, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("modify : " + board);
		if (service.modify(board)) {
			rttr.addFlashAttribute("resultMessege", "success");
		}
		if(board.getBoardType().equals("자유게시판")) {
		return "redirect:/board/boardList" + cri.getListLink();
		}else {
		return "redirect:/board/list" + cri.getListLink();	
		}
	}

	@GetMapping({"/get", "/modify", "/boardGet"})
	public void get(@RequestParam("boardNum") Long boardNum, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("/get or modify");
		model.addAttribute("board", service.get(boardNum));
		model.addAttribute("like", service.totalLike(boardNum));
	}

	//@PreAuthorize("principal.username == #writer")  나중에 시큐리티 기능 넣을때
	@PostMapping("/remove")
	   public String remove(@RequestParam("boardNum")Long boardNum,@ModelAttribute("cri")Criteria cri,RedirectAttributes rttr,String writer) {
	      log.info("remove....."+ boardNum);
	      List<BoardAttachVO> attachList = service.getAttachList(boardNum);
	      if(service.remove(boardNum)) {
	          deleteFiles(attachList);
	    	  rttr.addFlashAttribute("resultMessege","success");
	      }

	      return "redirect:/board/list" + cri.getListLink();
	   }

	//@PreAuthorize("isAuthenticated()")  나중에 시큐리티 기능 넣을때
	@GetMapping("/register")
	public void register() {

	}
	
	@GetMapping("/boardRegister")
	public void boardRegister() {

	}
	
	@GetMapping(value="/getBoardAttachList", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<List<BoardAttachVO>> getAttachList(Long boardNum){
		log.info("getBoardAttachList" + boardNum);
		return new ResponseEntity<>(service.getAttachList(boardNum), HttpStatus.OK);
	}//첨부파일들 확인
	
	private void deleteFiles(List<BoardAttachVO> attachList) {
		if(attachList == null || attachList.size() == 0) {return;}
		log.info("delete attah files........."); log.info(attachList);
		attachList.forEach(attach->{
			try {
				Path file = Paths.get("c:/temp/upload/"+attach.getUploadPath()+"/"+attach.getUuid()+"_"+attach.getFileName());
				Files.deleteIfExists(file);
				if(Files.probeContentType(file).startsWith("image")) {
					Path thumbNail = Paths.get("c:/temp/upload/"+attach.getUploadPath()+"/s_"+attach.getUuid()+"_"+attach.getFileName());
					Files.delete(thumbNail);
				}
			} catch (Exception e) { log.error("delete file error : " + e.getMessage()); }
			
		});//deleteFiles forEach
		
	}
	
	@GetMapping("/event")
	public void event(Criteria cri, Model model) {
		log.info("event" + cri);
		model.addAttribute("list", eventService.getList(cri));
		log.info("event" + eventService.getList(cri));
		int total = eventService.getTotal();
		log.info("total:" + total);
		model.addAttribute("pageMaker", new pageDTO(cri, total));
	}
	
	@GetMapping("/eventAll")
	public void eventAll(Criteria cri, Model model) {
		log.info("event" + cri);
		model.addAttribute("listAll", eventService.getListAll(cri));
		int total = eventService.getTotal();
		log.info("total:" + total);
		model.addAttribute("pageMaker", new pageDTO(cri, total));
	}

}
