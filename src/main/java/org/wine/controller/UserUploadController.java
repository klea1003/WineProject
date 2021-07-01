package org.wine.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.wine.domain.AttachFileDTO;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@RequestMapping("/userupload/*")
@Controller
@Log4j
public class UserUploadController {

	@GetMapping("/uploadForm")
	public void uploadForm() {
		log.info("upload form");
	}

	@PostMapping("/uploadFormAction")
	public void uploadFormPost(MultipartFile[] uploadFile, Model model) {
		String uploadFolder = "c:/upload";
		for (MultipartFile multipartFile : uploadFile) {
			log.info("=================================");
			log.info("Upload File Name : " + multipartFile.getOriginalFilename());
			log.info("Upload File Size : " + multipartFile.getSize());
			File saveFile = new File(uploadFolder, multipartFile.getOriginalFilename());
			try {
				multipartFile.transferTo(saveFile);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				log.error(e.getMessage());
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
	}

	@GetMapping("/uploadAjax")
	public void uploadAjax() {
		log.info("upload ajax");
	}
	
	 private String getFolder() {
	      
		  SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd");
	     
	      Date date=new Date();
	     
	      String str = sdf.format(date);
	      
	      return str.replace("-", File.separator);
	   }
	
	   private boolean checkImageType(File file) {
		      try {
		         String contentType=Files.probeContentType(file.toPath());
		         return contentType.startsWith("image");
		      } catch (IOException e) {
		         // TODO Auto-generated catch block
		         e.printStackTrace();
		      }
		      return false;
	   	}
	 
	@PostMapping(value="/uploadAjaxAction", produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<List<AttachFileDTO>> uploadAjaxPost(MultipartFile[] uploadFile) {
			
				List<AttachFileDTO> list= new ArrayList<>();
		
				String uploadFolder = "c:/upload";
				
				String uploadFolderPath = getFolder();
				
				File uploadPath=new File(uploadFolder, getFolder());
				// 폴더 생성
										
				if(uploadPath.exists()==false) {
					
			         uploadPath.mkdirs();
			    }

			  for(MultipartFile multipartFile : uploadFile) {
				  
				  
			   AttachFileDTO attachDTO=new AttachFileDTO();
				  
		      		           
		      String uploadFileName = multipartFile.getOriginalFilename();
		      
		      uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("/")+1);
		      
		      attachDTO.setFileName(uploadFileName);
		      
		      UUID uuid=UUID.randomUUID();
		      
		      uploadFileName = uuid.toString()+"_" + uploadFileName;
		      
		      try {
		    	File saveFile=new File(uploadPath, uploadFileName);
		    	//uploadPath에 파일 저장
	            multipartFile.transferTo(saveFile);
	            
	            attachDTO.setUuid(uuid.toString());
	            attachDTO.setUploadPath(uploadFolderPath);
	            
	               if(checkImageType(saveFile)) {
	            	   
	            	   attachDTO.setImage(true);
	            	   
	               FileOutputStream thumbnail= new FileOutputStream(new File(uploadPath, "s_"+uploadFileName));
	               
	               Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100,100);
	               
	               thumbnail.close();
	            }
	            
	               list.add(attachDTO);
		      }catch (Exception e) {
				// TODO: handle exception
		    	  log.error(e.getMessage());
		      }
		   }
			return new ResponseEntity<>(list, HttpStatus.OK);
		}
	
	@GetMapping("/display")
	@ResponseBody
	   public ResponseEntity<byte[]> getFile(String fileName){
	      log.info("fileName : "+fileName);
	      File file=new File("c:/upload/"+fileName);
	      log.info("file : "+ file);
	      ResponseEntity<byte[]> result=null;
	      try {
	         HttpHeaders header = new HttpHeaders();
	         header.add("Content-Type", Files.probeContentType(file.toPath()));
	         result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
	      } catch (IOException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }
	      return result;
	   }
	   
	   @GetMapping(value="/download", produces=MediaType.APPLICATION_OCTET_STREAM_VALUE)
	   @ResponseBody
	   public ResponseEntity<Resource> downloadFile(String fileName){
	      log.info("download file : "+fileName);
	      Resource resource=new FileSystemResource("c:/upload/"+fileName);
	      if(resource.exists()==false) {return new ResponseEntity<>(HttpStatus.NOT_FOUND);}
	      String resourceName= resource.getFilename();
	      String resourceOriginalName= resourceName.substring(resourceName.indexOf("_")+1);
	      log.info("reousrceOriginalName : " + resourceOriginalName);
	      HttpHeaders headers = new HttpHeaders();
	      try {
	         headers.add("Content-Disposition", "attachment; fileName=" + new String(resourceOriginalName.getBytes("UTF-8"), "ISO-8859-1"));
	      } catch (UnsupportedEncodingException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }      
	      log.info("resource : " + resource);
	      return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
	   } //531 참고
	   
	   @PostMapping("/deleteFile")
	   @ResponseBody
	   public ResponseEntity<String> deleteFile(String fileName, String type){
	      log.info("deleteFile : "+ fileName);
	      File file;
	      try {
	         file= new File("c:/upload/"+URLDecoder.decode(fileName, "UTF-8"));
	         file.delete();
	         if(type.equals("image")) {
	            String largeFileName=file.getAbsolutePath().replace("s_", "");
	            log.info("largeFileName : "+largeFileName);
	            file=new File(largeFileName);
	            file.delete();
	         }
	      }catch (UnsupportedEncodingException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	         return new ResponseEntity<>(HttpStatus.NOT_FOUND);
	      }
	      return new ResponseEntity<String>("deleted", HttpStatus.OK);
	   }//548
	  
}
	
	
