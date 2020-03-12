package org.movie.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import org.movie.domain.Criteria;
import org.movie.domain.ImageDTO;
import org.movie.domain.ImageVO;
import org.movie.domain.MovieVO;
import org.movie.domain.PageDTO;
import org.movie.service.MovieService;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/admin/*")
public class AdminController {

	private MovieService service;
	
	//영화 설정 화면
	@GetMapping("/movieSetting")
	public void movieSettingPage(Criteria cri, Model model) {
		model.addAttribute("movie", service.getList(cri));
		model.addAttribute("movieCnt", service.movieCnt());
		model.addAttribute("pageMaker", new PageDTO(cri,service.movieCnt()));	
	}

	//영화 업로드
	@PostMapping("/uploadMovie")
	public String registerMovie(MovieVO movie, RedirectAttributes rttr) {
		log.info(movie.getTitleImage());
		
		service.register(movie);
		rttr.addFlashAttribute("result", movie.getMno());
		return "redirect:/admin/movieSetting";
	}
	//영화 수정
	@PostMapping("/modifyMovie")
	public String modifyMovie(MovieVO movie, RedirectAttributes rttr) {
		log.info(movie.getTitleImage());
		
		service.updateMovie(movie);
		rttr.addFlashAttribute("result", movie.getMno());
		return "redirect:/admin/movieSetting";
	}
	
	//영화 제거
	@PostMapping("/removeMovie")
	public String removeMovie(@RequestParam("mno") Long mno, RedirectAttributes rttr) {
		
		ImageVO image = service.getImage(mno);

		if (service.deleteMovie(mno)) {
			
			deleteImage(image);

			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/admin/movieSetting";
	}
	
	//영화 이미지 첨부 미리보기
	@GetMapping("/showImage")
	@ResponseBody
	public ResponseEntity<byte[]> showImage(String img_name) {
		log.info("fileName: " + img_name);
		File file = new File("/home/ubuntu/upload/movie/" + img_name);
		
		ResponseEntity<byte[]> result = null;
		
		try {
			HttpHeaders header = new HttpHeaders();
			
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//영화 이미지 불러오기
	@GetMapping("/img")
	public ResponseEntity<byte[]> loadImage(@RequestParam("img_path") String img_path, @RequestParam("img_name") String img_name) throws IOException {
		log.info("fileName: " + img_path);
		File file = new File("/home/ubuntu/upload/movie/" + img_path + "/" + img_name);
		
		ResponseEntity<byte[]> result = null;
		
		try {
			HttpHeaders header = new HttpHeaders();
			
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
		
	}
	
	//영화이미지 삭제
	@PostMapping(value= "/deleteImage", produces= MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<String> deleteImage(String img_name) {
		
		log.info("deleteFile: " + img_name);

		File folder;

		try {
			folder = new File("/home/ubuntu/upload/movie/" + (URLDecoder.decode(img_name, "UTF-8")).substring(0,URLDecoder.decode(img_name, "UTF-8").lastIndexOf("s_")));
			//폴더 안에 파일이 있으면 폴더 삭제가 안되기 때문에 파일먼저 삭제 후 폴더 삭제
			while(folder.exists()) {
				File[] folderList = folder.listFiles();
				for(int i =0; i<folderList.length; i++) {
					folderList[i].delete();
				}
				if (folderList.length == 0 && folder.isDirectory()) {
					folder.delete();
				}
			}
				
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}

		return new ResponseEntity<String>("삭제 완료", HttpStatus.OK);

	}
	
	//영화 이미지 저장, 폴더 생성
	@PostMapping(value= "/uploadMovieImage", produces = MediaType.APPLICATION_JSON_UTF8_VALUE )
	@ResponseBody
	public ResponseEntity<List<ImageDTO>> uploadMovieImage(MultipartFile[] uploadFile) {
		
		List<ImageDTO> list = new ArrayList<>();
		
		log.info("update image....");

		String uploadFolder = "/home/ubuntu/upload/movie/";

		for (MultipartFile multipartFile : uploadFile) {

			ImageDTO imageDTO = new ImageDTO();
			
			String uploadFileName = multipartFile.getOriginalFilename();

			// IE has file path
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("/") + 1);
			log.info("only file name: " + uploadFileName);
			imageDTO.setImg_name(uploadFileName);
			
			// 폴더 생성(영화 이름)
			File uploadPath = new File (uploadFolder, uploadFileName.substring(0,uploadFileName.lastIndexOf(".")));
			if ( uploadPath.exists() == false) {
				log.info(uploadPath);
				uploadPath.mkdir();
			}
			try {
				File saveFile = new File(uploadPath, uploadFileName);
				multipartFile.transferTo(saveFile);
				
				imageDTO.setImg_path(uploadFileName.substring(0,uploadFileName.lastIndexOf(".")));
				if(checkImageType(saveFile)) {
					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));
					Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 360, 360);
					thumbnail.close();
				}
				list.add(imageDTO);
			} catch (Exception e) {
				log.error(e.getMessage());
			} // end catch

		} // end for
		return new ResponseEntity<>(list,HttpStatus.OK);
	}

	//이미지 체크 메서드
	private boolean checkImageType(File file) {
		try {
			String contentType = Files.probeContentType(file.toPath());
			return contentType.startsWith("image");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	//첨부 이미지,폴더 삭제 메서드
	private void deleteImage(ImageVO image) {
	    
	    if(image == null) {
	      return;
	    }
	    
	    log.info("delete attach image");
	    	    
	    
	      try {        
	        Path file  = Paths.get("/home/ubuntu/upload/movie/" + image.getImg_path() + "/" + image.getImg_path());
	        
	        Files.deleteIfExists(file);
	        
	        if(Files.probeContentType(file).startsWith("image")) {
	        
	          Path thumbNail = Paths.get("/home/ubuntu/upload/"+image.getImg_path()+"/s_" + image.getImg_name());
	          
	          Files.delete(thumbNail);
	        }
	
	      }catch(Exception e) {
	        log.error("delete file error" + e.getMessage());
	      }//end catch
	   
	  }

}
