package org.movie.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;

import javax.servlet.http.HttpSession;

import org.movie.domain.Criteria;
import org.movie.domain.PageDTO;
import org.movie.domain.UserVO;
import org.movie.service.MovieService;
import org.movie.service.UserService;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/main/*")
@Controller
@AllArgsConstructor
@Log4j
public class CommonController {

	private MovieService service;
	private UserService userService;

	private PasswordEncoder pwencoder;

	// 영화 정보 페이지 이동
	@GetMapping("/get")
	public void movieInfoPage(Model model, @RequestParam("mno") Long mno) {
		log.info("영화 번호: " + mno);
		model.addAttribute("getMovieInfo", service.getMovieInfo(mno));
	}

	// 영화 리스트 페이지 이동
	@GetMapping("/movieList")
	public void movieListPage(Criteria cri, Model model) {
		log.info("movie List Page ...");
		model.addAttribute("movie", service.getList(cri));
		model.addAttribute("movieCnt", service.movieCnt());
		model.addAttribute("pageMaker", new PageDTO(cri, service.getTotal(cri)));
	}

	// 영화 검색
	@GetMapping("/searchMovie")
	public String searchMovie(@RequestParam("title") String title) {
		log.info("영화 타이틀: " + title);
		return "redirect:/main/movieList";
	}

	// 영화 이미지 불러오기
	@GetMapping("/img")
	public ResponseEntity<byte[]> loadImage(@RequestParam("img_path") String img_path,
			@RequestParam("img_name") String img_name) throws IOException {

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

	// 접근 금지 에러
	@GetMapping("/accessError")
	public void accessDenied(Authentication auth, Model model) {

		log.info("access Denied : " + auth);

	}

	// 로그인 페이지
	@GetMapping("/Login")
	public void loginInput(Model model) {
		log.info("로그인 페이지");
	}

	// 일반 로그 아웃
	@GetMapping("/Logout")
	public void logoutGET() {

		log.info("로그아웃 처리");

	}

	// 로그인 실패시 처리
	@GetMapping("/loginFailure")
	public String loginFailure(Model model, RedirectAttributes rttr) {
		log.info("Login Failure");
		rttr.addFlashAttribute("result", "failure");
		return "redirect:/main/Login";
	}

	// 회원 등록 페이지
	@GetMapping("/register")
	public void registerUserPage() {
		log.info("Register Page");
	}

	// 회원 등록
	@PostMapping("/register")
	public String registerUser(UserVO user, RedirectAttributes rttr) {
		log.info("User Info: " + user);
		user.setUser_pw(pwencoder.encode(user.getUser_pw()));
		userService.register(user);

		rttr.addFlashAttribute("result", "success");
		return "redirect:/";
	}

	// 회원 아이디 중복체크
	@GetMapping(value = "/idCheck", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public int idCheck(@RequestParam("user_id") String user_id) {
		log.info("User id: " + user_id);
		return userService.userIdCheck(user_id);
	}

	// 회원탈퇴 & 로그아웃
	@PostMapping("/Logout2")
	public String withDrawalUser(String user_id, RedirectAttributes rttr, HttpSession session) {

		log.info("post custom logout");
		userService.withdrawalUserInfo(user_id);
		session.invalidate();
		rttr.addFlashAttribute("result", "success");
		return "redirect:/";
	}

}
