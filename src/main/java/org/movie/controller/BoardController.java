package org.movie.controller;

import org.movie.domain.BoardVO;
import org.movie.domain.Criteria;
import org.movie.domain.PageDTO;
import org.movie.service.BoardService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/board/*")
@Controller
@AllArgsConstructor
@Log4j
public class BoardController {

	private BoardService boardService;

	// 공지사항 페이지
	@GetMapping("/notice")
	public void boardNoticeList(Model model, Criteria cri) {
		log.info("Notice page");
		cri.setTableType("notice");
		model.addAttribute("pageMaker", new PageDTO(cri, boardService.getTotalCount(cri)));
		model.addAttribute("boardList", boardService.getList(cri));
	}

	// 자유게시판 페이지
	@GetMapping("/article")
	public void boardArticleList(Model model, Criteria cri) {
		log.info("Article page");
		cri.setTableType("article");
		model.addAttribute("pageMaker", new PageDTO(cri, boardService.getTotalCount(cri)));
		model.addAttribute("boardList", boardService.getList(cri));
	}

	// 글 확인 및 수정
	@GetMapping({ "/get", "/modify" })
	public void getBoard(Model model, @RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri) {

		log.info("get or modify");

		model.addAttribute("board", boardService.getBoardByBno(bno));
	}

	// 글 수정
	@PostMapping("/modify")
	public String modifyBoard(BoardVO board, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("modify:" + board);

		if (boardService.modifyBoard(board)) {
			rttr.addFlashAttribute("result", "success");
		}

		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());

		return "redirect:/board/"+ board.getBrd_table();
	}

	// 글 등록 페이지
	@GetMapping("/register")
	public void registerBoardPage(@RequestParam("brd_table") String brd_table, Model model) {
		log.info("Notice Register Page");
		log.info("게시판 종류: " + brd_table);
		
		model.addAttribute("brd_table",brd_table);
		
	}

	// 글 등록
	@PostMapping("/register")
	public String registerBoard(BoardVO board, RedirectAttributes rttr) {
		log.info(board);
		boardService.register(board);
		rttr.addFlashAttribute("result", "success");
		return "redirect:/board/"+ board.getBrd_table();
	}

	// 답변 등록 페이지
	@GetMapping("/reply")
	public void registerReplyPage(@RequestParam("bno") Long bno,  Model model) {
		log.info("Notice Register Page");
		log.info("게시글 번호: " + boardService.getBoardByBno(bno).getBno());
		log.info("그룹 번호: " + boardService.getBoardByBno(bno).getBrd_groupOrd());
		
		model.addAttribute("reply", boardService.getBoardByBno(bno));
				
	}

	// 답변 등록
	@PostMapping("/reply")
	public String registerReply(BoardVO board, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info(board);
		
		boardService.registerReply(board);
		
		rttr.addFlashAttribute("result", "success");

		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());

		return "redirect:/board/"+ board.getBrd_table();
	}

	// 글 제거
	@PostMapping("/remove")
	public String removeBoard(BoardVO board, @RequestParam("brd_table") String brd_table, 
			Criteria cri, RedirectAttributes rttr) {
		
		log.info("글 번호: " + board.getBno());
		log.info("그룹 번호: " + board.getBrd_groupOrd());
		if (boardService.removeBoard(board)) {
			rttr.addFlashAttribute("result", "success");
		}

		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());

		return "redirect:/board/" + brd_table;
	}
}
