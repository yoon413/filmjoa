package org.movie.controller;

import org.movie.domain.Criteria;
import org.movie.domain.ReviewPageDTO;
import org.movie.domain.UserVO;
import org.movie.service.ReviewService;
import org.movie.service.UserService;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/member/*")
@Controller
@AllArgsConstructor
@Log4j
public class MemberController {

	private UserService userService;
	private ReviewService reviewService;
	private PasswordEncoder pwencoder;
		

	// 마이페이지 페이지
	@GetMapping("/myPage")
	@PreAuthorize("isAuthenticated() and (( #user_id == principal.username ) or hasRole('ROLE_ADMIN'))")
	public void mypagePage(Model model, @RequestParam("user_id") String user_id) {
		log.info("User id: " + user_id);
		model.addAttribute("reply", reviewService.readReviewByUser(user_id));
	}

	// 유저가 작성한 리뷰 목록
	@GetMapping(value = "/mypage/{user}/{page}", produces = { MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<ReviewPageDTO> getReviewList(@PathVariable("page") int page, @PathVariable("user") String user_id) {
		log.info(user_id);
		Criteria cri = new Criteria(page, 10);
		return new ResponseEntity<>(reviewService.getListPageByUser(cri, user_id), HttpStatus.OK);
	}

	// 회원 정보 페이지
	@GetMapping("/userInfo")
	public void userInfoPage(Model model, @RequestParam("user_id") String user_id) {
		log.info("유저 아이디: " + user_id);
		model.addAttribute("userInfo", userService.getUserInfo(user_id));
	}

	// 회원 정보 수정
	@PostMapping("/updateUserInfo")
	public String updateUser(UserVO user, RedirectAttributes rttr) {
		log.info("User Info: " + user);
		user.setUser_pw(pwencoder.encode(user.getUser_pw()));
		userService.modifyUserInfo(user);
		rttr.addFlashAttribute("result", "success");
		return "redirect:/member/myPage?user_id=" + user.getUser_id() + "";
	}

	// 회원 탈퇴 페이지
	@GetMapping("/withdrawal")
	public void withdrawalUserPage(@RequestParam("user_id") String user_id) {
		log.info("유저 아이디: " + user_id);
	}
}
