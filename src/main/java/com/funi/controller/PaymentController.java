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

@Controller
public class PaymentController {

	@Autowired
	@Qualifier("memberdao")
	MemberDAO memberdao;
	
	@RequestMapping(value="/payment.fu",method= {RequestMethod.GET})
	public ModelAndView payment(HttpServletRequest request,HttpSession session) {
		
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
		for (int i = 0; i < qty_TotalItem.length; i++) {
			cartlist.set(i,cartlist.get(i)+":"+qty_TotalItem[i]);
		}
		Iterator it = cartlist.iterator();
		while(it.hasNext()) {
			System.out.println(it.next());
		}	
		paymav.addObject("cartlist",cartlist);
		
		paymav.addObject("qty_TotalItem",qty_TotalItem);
		
		return paymav;
	}
	
	
}
