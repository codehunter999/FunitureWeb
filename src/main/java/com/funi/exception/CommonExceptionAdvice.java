package com.funi.exception;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;


@Controller
public class CommonExceptionAdvice {

	public String except(Exception ex,Model model) {
		
		model.addAttribute("exception",ex);

		return "error_page";
	}
	
}
