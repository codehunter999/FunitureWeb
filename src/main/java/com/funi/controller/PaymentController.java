package com.funi.controller;


import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.funi.dao.MemberDAO;
import com.funi.domain.MemberDTO;
import com.funi.domain.PaymentDTO;

@Controller
public class PaymentController {

	@Autowired
	@Qualifier("memberdao")
	MemberDAO memberdao;
	
	@RequestMapping(value="/payment.fu",method= {RequestMethod.GET})
	public ModelAndView payment(HttpServletRequest request,HttpSession session) {
		//session.invalidate();
		ModelAndView paymav = new ModelAndView();
		if(session.getAttribute("email") == null || session.getAttribute("email").equals("")) {
			paymav.setViewName("member/login");
			return paymav;
		}	
		String[] qty_TotalItem = null;
		if(request.getParameter("data")==null) {
			
		}else {
			
			qty_TotalItem = request.getParameter("data").split(",");	
			for (int i = 0; i < qty_TotalItem.length; i++) {
				System.out.println(qty_TotalItem[i]); 
			}
			
		}
		MemberDTO memberdto = memberdao.searchMember((String)session.getAttribute("email"));
		paymav.addObject("memberdto",memberdto);
		List<String> cartlist = (List)session.getAttribute("cartlist");
		boolean flag = false;
		int index = 0;
		//session.removeAttribute("cartlist");
		for (int i = 0; i < qty_TotalItem.length; i++) {		
		
			if(cartlist.get(index).split(":").length >= 5) {
				System.out.println("여기를 지나가요?");
				cartlist.set(index,cartlist.get(index)+":"+qty_TotalItem[index]);
			}else {
				
				cartlist.set(index,cartlist.get(index)+":"+qty_TotalItem[index]);
			}
			index++;
		}
		
		
		paymav.addObject("cartlist",cartlist);
		
		return paymav;
	}
	@RequestMapping(value="/payment_input.fu",method= {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView payment_Input(HttpServletRequest request,HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		/*
			for (int i = 0; i < paylist.size(); i++) {
				System.out.println(paylist.get(i).getProductInfo());
			}
		*/
		mav.setViewName("redirect:/orderlist.fu");
		return mav;
	}
	@RequestMapping(value="/orderlist.fu",method= {RequestMethod.GET})
	public ModelAndView orderlist(HttpServletRequest request,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("order_result");
		return mav;
	}
	
}
