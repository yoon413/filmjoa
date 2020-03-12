package org.movie.controller;

import org.movie.service.MovieService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@AllArgsConstructor
@Log4j
public class MainController {

	private MovieService service;
	
	//메인 페이지
	@RequestMapping("/")
	public String homePage(Model model) {
		log.info("main page....");
		model.addAttribute("latestMovie", service.getLatestMovie());	
		model.addAttribute("randomMovie", service.getRandomMovie());
		model.addAttribute("korMovie", service.getKorMovie());
		model.addAttribute("foreignMovie", service.getForeignMovie());
		model.addAttribute("yearMovie", service.getYearMovie());
		
		return "main/index";
	}
	
	
}
