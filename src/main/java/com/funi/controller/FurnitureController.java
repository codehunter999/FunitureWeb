package com.funi.controller;


import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.funi.dao.BedDAO;
import com.funi.dao.CartDAO;
import com.funi.dao.DecoDAO;
import com.funi.dao.DiningDAO;
import com.funi.dao.LivingDAO;
import com.funi.dao.MemberDAO;
import com.funi.dao.QnADAO;
import com.funi.dao.ReviewDAO;
import com.funi.domain.FurnitureDTO;
import com.funi.domain.MemberDTO;
import com.funi.domain.QnADTO;


import com.funi.service.Email;
import com.funi.service.EmailSender;
import com.funi.service.KakaoAPI;


@Controller
public class FurnitureController {

	@Autowired
	@Qualifier("memberdao")
	MemberDAO memberdao;

	@Autowired
	@Qualifier("BedDAO")
	BedDAO bedDao;

	@Autowired
	@Qualifier("LivingDAO")
	LivingDAO livingDao;

	@Autowired
	@Qualifier("diningdao")
	DiningDAO diningdao;

	@Autowired
	@Qualifier("decodao")
	DecoDAO decodao;

	@Autowired
	@Qualifier("cartdao")
	CartDAO cartdao;



	@Autowired
	@Qualifier("qnadao")
	QnADAO qnadao;


	@Autowired
	@Qualifier("kakao")
	KakaoAPI kakao;

	@Autowired
	@Qualifier("emailSender")
	EmailSender emailSender;

	@Autowired
	@Qualifier("email")
	Email email;

	// Countdown
	@RequestMapping(value = "/time.fu", method = { RequestMethod.GET, RequestMethod.POST })
	public String timer(Locale locale, Model model) {
		return "countdown";
	}

	// HOME PART
	@RequestMapping(value = "/home.fu", method = RequestMethod.GET)
	public ModelAndView home1(Locale locale, Model model) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("index");
		return mav;
	}

	@RequestMapping(value = "/home2.fu", method = RequestMethod.GET)
	public String home2(Locale locale, Model model) {
		return "index-02";
	}


	// COMPANY
	@RequestMapping(value = "/company.fu", method = RequestMethod.GET)
	public String company(Locale locale, Model model) {
		return "company/company";
	}



	// 지점안내
	@RequestMapping(value = "/blog.fu", method = { RequestMethod.GET, RequestMethod.POST })
	public String blog(Locale locale, Model model, HttpServletRequest request) {
		String location = request.getParameter("location");
		System.out.println("location : " + location);
		if (location.equals("Gangnam")) {
			return "location/blog_GangNam";
		}
		if (location.equals("Hongdae")) {
			return "location/blog_Hongdae";
		}
		if (location.equals("MogDong")) {
			return "location/blog_MogDong";
		}
		if (location.equals("Hanam")) {
			return "location/blog_Hanam";
		}
		if (location.equals("BunDang")) {
			return "location/blog_BunDang";
		}
		if (location.equals("Dongtan")) {
			return "location/blog_Dongtan";
		}
		if (location.equals("Anyang")) {
			return "location/blog_Anyang";
		}
		if (location.equals("Pyeongtaek")) {
			return "location/blog_Pyeongtaek";
		}
		return "location/blog_GanNam";
	}


	// 카트 장바구니 
	@RequestMapping(value = "/cartlist.fu", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView cartList(Locale locale, Model model,HttpServletRequest request,HttpSession session) {			
		
		List cartlist = null;
		ModelAndView cartlistmav = new ModelAndView();
		cartlistmav.setViewName("cart/cart");
		
		if(session.getAttribute("cartlist") == null || session.getAttribute("cartlist").equals("")) {
			return cartlistmav;
		}else {
			cartlist = (List<String>)session.getAttribute("cartlist");
		}
		//cartlistmav.addObject("cartlistsize",cartlist.size());
		cartlistmav.addObject("cartlist",cartlist);
		return cartlistmav;
	}
	
	// 카트 장바구니
	@RequestMapping(value = "/cartlist_input.fu", method = {RequestMethod.GET,RequestMethod.POST})
	public String cartList_Input(Locale locale, Model model,HttpServletRequest request,HttpSession session) {			
		//session.invalidate();
		List<String> cartlist;			
		String data = request.getParameter("data").trim();		
		if(data==null || data.equals("")) {
			
		}else {							
			
			if(session.getAttribute("cartlist") == null) {
				cartlist=new ArrayList<String>();
			}else {
				cartlist=(List<String>)session.getAttribute("cartlist");
			}						
			boolean flag=true;										
			Iterator iterator=cartlist.iterator();  							
			int i=0;  				
			while(iterator.hasNext()){			
				String result=(String)iterator.next();			
				if(result.contains(request.getParameter("data"))) {
					System.out.println("�씠誘� 異붽��맂 �긽�뭹�엯�땲�떎. ");			
					flag=false;
				}		
			}
			
			if(flag) {		
				cartlist.add(data);				
				session.setAttribute("cartlist", cartlist);
			}
		}
		
		cartlist = (List<String>)session.getAttribute("cartlist");
		Iterator it = cartlist.iterator();
		while(it.hasNext()) {
			System.out.println((String)it.next());
		}
		request.setAttribute("cartlist", cartlist);
		return "redirect:/cartlist.fu";
	}		
	
	@RequestMapping(value = "/deletecart.fu", method = {RequestMethod.GET,RequestMethod.POST})
	public String deletecart(Locale locale, Model model,HttpServletRequest request,HttpSession session) {
		
		List cartlist;
		cartlist=(ArrayList<String>)session.getAttribute("cartlist");
		int id = Integer.parseInt(request.getParameter("id"));	
		cartlist.remove(id);
		session.setAttribute("cartlist",cartlist);
		return "redirect:/cartlist.fu";
	}
	
	@RequestMapping(value = "/removeAllcart.fu", method = {RequestMethod.GET,RequestMethod.POST})
	public String RemoveAllCart(Locale locale, Model model,HttpServletRequest request,HttpSession session) {		
		List cartlist;
		cartlist=(ArrayList<String>)session.getAttribute("cartlist");
		cartlist.clear();
		session.setAttribute("cartlist",cartlist);
		return "redirect:/cartlist.fu"; 		
	}
}





