package com.funi.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.funi.dao.MemberDAO;
import com.funi.dao.PaymentDAO;
import com.funi.domain.MemberDTO;
import com.funi.domain.PaymentDTO;
import com.funi.domain.PaymentDTOList;


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
			if(cartlist.get(index).split(":").length >= 5) {
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
	public ModelAndView payment_Input(HttpServletRequest request,HttpSession session,
										Model model,@RequestParam("paylist")PaymentDTOList paylist) {
		
		System.out.println("테스트 입니다. ");
		System.out.println(paylist.getPaylist().get(0));
		ModelAndView mav = new ModelAndView();
		PaymentDTO paydto = new PaymentDTO();
		//paydto.setPayId(paymentdao.getId()+1);
		mav.setViewName("redirect:/orderlist.fu");
		return mav;
	}
	
	
	@RequestMapping(value="/orderlist.fu",method= {RequestMethod.GET})
	public ModelAndView orderlist(HttpServletRequest request,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		List<String> cartlist = (List)session.getAttribute("cartlist");
		int paysum=0;
		for(int i=0;i<cartlist.size();i++) {
			String cart=cartlist.get(i);
			String[]cartdata= cart.split(":");
			PaymentDTO dto=new PaymentDTO();
			dto.setEmail((String) session.getAttribute("email"));
			dto.setPaytype(cartdata[0]);
			dto.setImagePath(cartdata[3]);
			dto.setProductInfo(cartdata[1]);
			dto.setProductEa(Integer.parseInt(cartdata[4]));
			int price=(Integer.parseInt(cartdata[5].replace("원", "")));
			dto.setProductPrice(price);
			dto.setDeliveryMessage(request.getParameter("message"));
			paysum+=price;
			paymentdao.setitem(dto);
		}
		List<PaymentDTO> listdto = paymentdao.getList((String)session.getAttribute("email"));
		mav.addObject("price", paysum);
		mav.addObject("cartlist", cartlist);
		mav.addObject("listdto",listdto);
		mav.addObject("paytype",request.getParameter("paytype"));
		mav.setViewName("order_result");
		session.removeAttribute("cartlist");
		return mav;
	}	
}
