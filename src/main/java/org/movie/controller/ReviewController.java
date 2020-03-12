package org.movie.controller;

import org.movie.domain.Criteria;
import org.movie.domain.ReviewPageDTO;
import org.movie.domain.ReviewVO;
import org.movie.service.ReviewService;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/review/*")
@Controller
@AllArgsConstructor
@Log4j
public class ReviewController {

	private ReviewService reviewService;

	// 리뷰 생성
	@PostMapping(value = "/new", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	@Transactional
	public ResponseEntity<String> registerReview(@RequestBody ReviewVO review) {
		log.info("Review Info: " + review);
		int insertCount = reviewService.RegisterReview(review);
		if (insertCount == 1) {
			reviewService.avgReivewScore(review.getMno());
			return new ResponseEntity<>("success", HttpStatus.OK);
		} else {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

	}

	// 리뷰 제거
	@PostMapping(value = "{mno}/{user_id}", produces = { MediaType.TEXT_PLAIN_VALUE })
	@Transactional
	public ResponseEntity<String> removeReview(@PathVariable("mno") Long mno, @PathVariable("user_id") String user_id) {
		log.info("영화 번호: " + mno);
		log.info("회원Id: " + user_id);
		if (reviewService.deleteReview(user_id, mno) == 1) {
			reviewService.avgReivewScore(mno);
			return new ResponseEntity<>("success", HttpStatus.OK);
		} else {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

	}

	// 리뷰 목록 가져오기
	@GetMapping(value = "/pages/{mno}/{page}", produces = { MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<ReviewPageDTO> getReviewList(@PathVariable("page") int page, @PathVariable("mno") Long mno) {
		log.info("영화 번호: " + mno);
		Criteria cri = new Criteria(page, 10);

		return new ResponseEntity<>(reviewService.getListPage(cri, mno), HttpStatus.OK);

	}

	// 리뷰 수정
	@PostMapping(value = "/modify/{mno}/{user_id}", consumes = "application/json", produces = {
			MediaType.TEXT_PLAIN_VALUE })
	@Transactional
	public ResponseEntity<String> modifyReview(@RequestBody ReviewVO review, @PathVariable("mno") Long mno,
			@PathVariable("user_id") String user_id) {

		log.info("Review Info: " + review);
		log.info("영화 번호: " + mno);
		review.setMno(mno);
		review.setUser_id(user_id);
		if (reviewService.updateReview(review) == 1) {
			reviewService.avgReivewScore(mno);
			return new ResponseEntity<>("success", HttpStatus.OK);
		} else {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

	}

	// 마이페이지에서 리뷰 제거
	@PostMapping("/removeReview")
	@Transactional
	public String removeReview(RedirectAttributes rttr, @RequestParam("user_id") String user_id,
			@RequestParam("mno") Long mno) {
		log.info("유저 아이디: " + user_id);
		log.info("유저 mno: " + mno);
		if (reviewService.deleteReview(user_id, mno) == 1) {
			reviewService.avgReivewScore(mno);
		}
		rttr.addFlashAttribute("result", "remove");
		return "redirect:/member/myPage?user_id=" + user_id + "";
	}
}
