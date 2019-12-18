package com.funi.controller;


import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.support.SQLErrorCodes;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.funi.dao.MemberDAO;
import com.funi.dao.PaymentDAO;
import com.funi.domain.MemberDTO;
import com.funi.domain.PaymentDTO;
import com.funi.domain.PaymentpaySum_payType;

import lombok.extern.log4j.Log4j;

@Controller
public class PaymentController {
	
	private static final Logger logger = (Logger) LoggerFactory.getLogger(PaymentController.class);

	@Autowired
	@Qualifier("memberdao")
	MemberDAO memberdao;
	
	
	@Autowired
	@Qualifier("paymentdao")
	PaymentDAO paymentdao;
	

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
			if(cartlist.get(index).split(":").length >= 8) {
				//아무것도 실행하면 안됨 
			}else {	
				cartlist.set(index,cartlist.get(index)+":"+qty_TotalItem[index]);
			}
			index++;
		}	
		paymav.addObject("cartlist",cartlist);	
		System.out.println("cartlist.get(0) : "+cartlist.get(0));
		return paymav;
	}

	@RequestMapping(value="/payment_input.fu",method= RequestMethod.POST)
	public ModelAndView payment_Input(HttpServletRequest request,HttpSession session,
									@RequestParam("paytype")String paymentType,@RequestParam("email") String email) {										
		ModelAndView mav = new ModelAndView();
		
		List<String> cartlist = (List<String>)session.getAttribute("cartlist");
		int paysum=0;
		//System.out.println("paymentType : "+paymentType);
		PaymentDTO paydto = null;	
		System.out.println("paymentType :"+paymentType);
		System.out.println("email : "+email);
	
		try {
			
			for(int i=0;i<cartlist.size();i++) {
				
				System.out.println("cartlist get ("+i+") : "+cartlist.get(i));
				String[] cartdata = cartlist.get(i).split(":");
				paydto = new PaymentDTO();
				paydto.setEmail(email);
				paydto.setPaytype(paymentType);
				paydto.setImagePath(cartdata[3]);
				paydto.setProductInfo(cartdata[1]+cartdata[4]);
				paydto.setProductEa(Integer.parseInt(cartdata[6]));
				int price = (Integer.parseInt(cartdata[7].replace("원","")));
				paydto.setProductPrice(price);
				paydto.setDeliveryMessage(request.getParameter("message"));
				paysum += price;
				paymentdao.setitem(paydto);
			}		
			session.removeAttribute("cartlist");
			mav.setViewName("redirect:/orderlist.fu");			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return mav;
	}
	
	@RequestMapping(value="/orderlist.fu",method= {RequestMethod.GET})
	public ModelAndView orderlist(HttpServletRequest request,HttpSession session) {		
		ModelAndView mav = new ModelAndView();
		String email = (String)session.getAttribute("email");
		PaymentpaySum_payType paymenpaySum_payType = null;
		try {
			List<PaymentDTO> paylist = paymentdao.getList(email);
			paymenpaySum_payType = paymentdao.search_paySum_paytype(email);
			mav.addObject("paylist",paylist);
			mav.addObject("paySumAndpayType",paymenpaySum_payType);
			mav.setViewName("order_result");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return mav;
	}	
}
