package com.funi.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class WishListController {

	@RequestMapping(value = "/wishlist.fu", method = RequestMethod.GET)
	public String wishlist(Locale locale, Model model,HttpServletRequest request,HttpSession session) {
		//Use Map
		/*Map<String, String> wishitem;
		if(request.getParameter("cate")==null||request.getParameter("cate").equals("")) {
		}else {
			System.out.println(request.getParameter("cate")+":"+request.getParameter("imageIndex"));
			if(session.getAttribute("wishitem")==null) {
				wishitem=new HashMap<String, String>();
			}else {
				wishitem=(HashMap<String, String>)session.getAttribute("wishitem");
			}
			wishitem.put(request.getParameter("cate")+","+ request.getParameter("imageIndex"),request.getParameter("price")+","+request.getParameter("imagetype"));
			session.setAttribute("wishitem", wishitem);
		}
		wishitem=(HashMap<String, String>)session.getAttribute("wishitem");
		request.setAttribute("wishitem", wishitem);*/
		
		//Use List
		List wishitem;
		
		if(request.getParameter("cate")==null||request.getParameter("cate").equals("")) {}
		else {
			System.out.println(request.getParameter("cate")+":"+request.getParameter("itemname"));
			
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
				
				if(result.equals(request.getParameter("cate")+":"+ request.getParameter("itemname")+":"+request.getParameter("price").trim()+":"+request.getParameter("imagepath"))) {
					flag=false;
				}
			}

			if(flag) {
				wishitem.add(request.getParameter("cate")+":"+ request.getParameter("itemname")+":"+request.getParameter("price").trim()+":"+request.getParameter("imagepath"));
				session.setAttribute("wishitem", wishitem);
			}
		}
		
		wishitem=(List<String>)session.getAttribute("wishitem");
		request.setAttribute("wishitem", wishitem);
		
		return "wishlist";
	}
	
	
	@RequestMapping(value = "/deletewishlist.fu", method = RequestMethod.GET)
	public String deletewishlist(Locale locale, Model model,HttpServletRequest request,HttpSession session) {
		//Use Map
		/*Map<String, String> wishitem;
		if(session.getAttribute("wishitem")==null) {
			wishitem=new HashMap<String, String>();
		}else {
			wishitem=(HashMap<String, String>)session.getAttribute("wishitem");
		}
		wishitem.remove(request.getParameter("id"));
		session.setAttribute("wishitem", wishitem);*/

		//Use List
		List wishitem;
		wishitem=(ArrayList<String>)session.getAttribute("wishitem");
		
		System.out.println(wishitem.remove(Integer.parseInt(request.getParameter("id"))));
		session.setAttribute("wishitem", wishitem);

		return "redirect:/wishlist.fu";
	}
}
