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

import com.funi.dao.BedDAO;
import com.funi.dao.DecoDAO;
import com.funi.dao.DiningDAO;
import com.funi.dao.LivingDAO;
import com.funi.domain.FurnitureDTO;

@Controller
public class WishListController {
	
	@Autowired
	@Qualifier("diningdao")
	DiningDAO diningdao;

	@RequestMapping(value = "/wishlist.fu", method = RequestMethod.GET)
	public String wishlist(Locale locale, Model model,HttpServletRequest request,HttpSession session) {
		
		//Use List
		List wishitem;
		
		if(request.getParameter("cateEn")==null||request.getParameter("cateEn").equals("")) {}
		
		else {
			
			System.out.println(request.getParameter("cateEn")+":"+request.getParameter("itemname"));			
			if(session.getAttribute("wishitem")==null) {
				wishitem=new ArrayList<String>();
			}
			else {
				wishitem=(List<String>)session.getAttribute("wishitem");
			}
			
			boolean flag=true;
			Iterator iterator=wishitem.iterator();
			int i=0;
			
			while(iterator.hasNext()){
				String result=(String)iterator.next();
				if(result.equals(request.getParameter("cateEn")+":"+ request.getParameter("itemname")+":"+request.getParameter("price").trim()+":"+request.getParameter("imagepath")+":"+request.getParameter("imageIndex"))) {
					flag=false;
				}
			}

			if(flag) {
				wishitem.add(request.getParameter("cateEn")+":"+ request.getParameter("itemname")+":"+request.getParameter("price").trim()+":"+request.getParameter("imagepath")+":"+request.getParameter("imageIndex"));
				session.setAttribute("wishitem", wishitem);
			}
		}
		
		wishitem=(List<String>)session.getAttribute("wishitem");
		request.setAttribute("wishitem", wishitem);
		
		return "wishlist";
	}
	
	
	@RequestMapping(value = "/deletewishlist.fu", method = RequestMethod.GET)
	public String deletewishlist(Locale locale, Model model,HttpServletRequest request,HttpSession session) {

		//Use List
		List wishitem;
		wishitem=(ArrayList<String>)session.getAttribute("wishitem");
		
		System.out.println(wishitem.remove(Integer.parseInt(request.getParameter("id"))));
		session.setAttribute("wishitem", wishitem);

		return "redirect:/wishlist.fu";
	}
}
