package com.funi.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.funi.dao.BedDAO;
import com.funi.dao.CartDAO;
import com.funi.dao.DecoDAO;
import com.funi.dao.DiningDAO;
import com.funi.dao.LivingDAO;
import com.funi.dao.MemberDAO;
import com.funi.dao.ReviewDAO;
import com.funi.dao.QnADAO;

import com.funi.domain.MemberDTO;

import com.funi.domain.FurnitureDTO;
import com.funi.util.MyUtil;
import com.funi.util.MyUtil1;

import com.funi.service.Email;
import com.funi.service.EmailSender;
import com.funi.service.KakaoAPI;
import com.funi.util.SHA256Util;

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
	@Qualifier("myUtil")
	MyUtil myUtil;

	@Autowired
	@Qualifier("qnadao")
	QnADAO qnadao;

	@Autowired
	@Qualifier("reviewdao")
	ReviewDAO reviewdao;

	@Autowired
	@Qualifier("myUtil1")
	MyUtil1 myUtil1;

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

		List<FurnitureDTO> lists = livingDao.livingImageList();
		mav.setViewName("index");
		mav.addObject("lists", lists);

		return mav;
	}

	@RequestMapping(value = "/home2.fu", method = RequestMethod.GET)
	public String home2(Locale locale, Model model) {
		return "index-02";
	}

	// login-register
	@RequestMapping(value = "/login.fu", method = RequestMethod.GET)
	public ModelAndView login(Locale locale, Model model, String message) {

		ModelAndView loginmav = new ModelAndView();
		loginmav.setViewName("member/login");

		if (message != null) {
			loginmav.addObject("message", message);
		}

		return loginmav;
	}

	@RequestMapping(value = "/login_ok.fu", method = RequestMethod.POST)
	public ModelAndView login_ok(HttpServletRequest request, Model model, MemberDTO paramdto) {

		ModelAndView loginmav = new ModelAndView();
		MemberDTO memberdto = null;
		try {

			boolean flag = memberdao.searchID(paramdto.getEmail());
			System.out.println("flag : " + paramdto.getEmail());
			String message = null;
			if (!flag) {
				message = "회원 정보를 찾을수 없습니다.";
				loginmav.addObject("message", message);
				loginmav.setViewName("member/login");
				return loginmav;
			}

			memberdto = memberdao.searchMember(paramdto.getEmail());

			String paramPassword = SHA256Util.getEncrypt(paramdto.getPwd(), memberdto.getSalt());
			System.out.println("paramPassword : " + paramPassword);
			System.out.println("memberdto.getPwd() : " + memberdto.getPwd());

			if (!memberdto.getPwd().equals(paramPassword)) {
				message = "계정 패스워드를 확인해주세요.";
				loginmav.addObject("message", message);
				loginmav.setViewName("member/login");
				return loginmav;
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		HttpSession session = request.getSession();
		session.setAttribute("email", memberdto.getEmail());
		loginmav.setViewName("redirect:/home.fu");
		return loginmav;
	}

	@RequestMapping(value = "/kakaologin")
	public String login(@RequestParam("code") String code) {
		String access_Token = kakao.getAccessToken(code);
		System.out.println("controller access_token : " + access_Token);

		return "index";
	}

	@RequestMapping(value = "/logout.fu", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws IOException {
		ModelAndView logoutmav = new ModelAndView();
		session.removeAttribute("email");
		logoutmav.setViewName("redirect:/login.fu");
		return logoutmav;
	}

	@RequestMapping(value = "/searchPassword.fu", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView searchPwd() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/searchPwd");
		return mav;
	}

	@RequestMapping(value = "/changPwd.fu", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView changePwd() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/changePwd");
		return mav;
	}

	@RequestMapping(value = "/changePwd_ok.fu", method = { RequestMethod.POST })
	public ModelAndView changePwd_ok(MemberDTO paramdto) {
		ModelAndView changePwdmav = new ModelAndView();

		try {
			MemberDTO memberdto = memberdao.searchMember(paramdto.getEmail());
			memberdto.setPwd(SHA256Util.getEncrypt(paramdto.getPwd(), memberdto.getSalt()));
			memberdao.update_pw(memberdto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		changePwdmav.setViewName("redirect:/login.fu");
		return changePwdmav;
	}

	@RequestMapping(value = "/sendpw.fu", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView sendEmailAction(ModelMap model, MemberDTO memberdto) throws Exception {

		ModelAndView mav = new ModelAndView();
		String useremail = memberdto.getEmail();
		boolean flag = memberdao.searchID(memberdto.getEmail());
		System.out.println(flag);
		if (!flag) {
			mav = new ModelAndView("member/searchPwd");
			mav.addObject("message", "send no search Email");
			return mav;
		}
		if (useremail != null) {
			email.setReceiver(useremail);
			email.setContent("비밀번호는 " + useremail + " 입니다.");
			email.setSubject(useremail + "님 비밀번호 찾기 메일입니다.");
			emailSender.SendEmail(email);
			mav = new ModelAndView("member/searchPwd");
			mav.addObject("message", "send email");
		}
		;
		return mav;
	}

	@RequestMapping(value = "/myinfo.fu", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView myinfo(ModelMap model, HttpSession session) throws Exception {
		ModelAndView myinfomav = new ModelAndView();
		myinfomav.setViewName("member/myinfo");
		String email = (String) session.getAttribute("email");
		MemberDTO memberdto = memberdao.searchMember(email);
		System.out.println("myinfo email " + email);
		System.out.println("myinfo addr1 " + email);
		System.out.println("myinfo addr2 " + email);
		System.out.println("myinfo addr3 " + email);
		myinfomav.addObject("memberdto", memberdto);
		return myinfomav;
	}

	// ȸ�� ���� ����
	@RequestMapping(value = "/myinfo_ok.fu", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView myinfo_ok(ModelMap model, HttpSession session, MemberDTO memberdto) throws Exception {

		ModelAndView myinfomav = new ModelAndView();
		myinfomav.setViewName("redirect:/home.fu");
		return myinfomav;
	}

	// ȸ�� Ż�� ������
	@RequestMapping(value = "/deleteMember.fu", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView deleteMeber_ok(ModelMap model, HttpSession session) throws Exception {
		ModelAndView deletemav = new ModelAndView();
		deletemav.setViewName("member/deleteMember");
		return deletemav;
	}

	// ȸ�� Ż��
	@RequestMapping(value = "/deleteMember_ok.fu", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView deleteMeber(ModelMap model, HttpSession session) throws Exception {
		ModelAndView deletemav = new ModelAndView();
		String email = (String) session.getAttribute("email");
		memberdao.delete_member(email);
		session.removeAttribute("email");
		deletemav.setViewName("redirect:/login.fu");
		deletemav.addObject("message", "ȸ���� Ż��Ǿ����ϴ�.");
		return deletemav;
	}

	// 회원가입
	@RequestMapping(value = "/register.fu", method = RequestMethod.GET)
	public String register(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response)
			throws IOException {

		if (request.getParameter("mode") != null) {

			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('Email이 중복되었습니다.'); history.go(-1); </script>");
			writer.flush();
		}
		return "member/register";
	}

	@RequestMapping(value = "/register_ok.fu", method = { RequestMethod.GET, RequestMethod.POST })
	public String register_ok(MemberDTO memberdto, HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		request.setCharacterEncoding("utf-8");

		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		String phone = phone1 + phone2;
		// salt SHA256 암호화 저장
		memberdto.setPhone(phone);
		String salt = SHA256Util.generateSalt();
		memberdto.setSalt(salt);
		String password = memberdto.getPwd();
		password = SHA256Util.getEncrypt(password, salt);
		memberdto.setPwd(password);

		try {
			memberdao.insertData(memberdto);
		} catch (Exception e) {

			System.out.println(e.toString());
			System.out.println("Email이 중복");
			return "redirect:/register.fu?emailcheck=no";
		}
		return "redirect:/login.fu";
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
		return "location/blog_GangNam";
	}

	// 카트 장바구니 
	@RequestMapping(value = "/cartlist.fu", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView cartList(Locale locale, Model model,HttpServletRequest request,HttpSession session) {			
			List cartlist = (List<String>)session.getAttribute("cartlist");
			ModelAndView cartlistmav = new ModelAndView();
			cartlistmav.addObject("catlist",cartlist);
			cartlistmav.setViewName("cart/cart");
			return cartlistmav;
	}
	// 카트 장바구니 
		@RequestMapping(value = "/cartlist_input.fu", method = {RequestMethod.GET,RequestMethod.POST})
		public String cartList_Input(Locale locale, Model model,HttpServletRequest request,HttpSession session) {			
			
			List<String> cartlist;	
			
			if(request.getParameter("data")==null||request.getParameter("data").equals("")) {
			
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
	        			if(result.equals(request.getParameter("data"))) {
	        				System.out.println("이미 추가된 상품입니다. ");
	        				flag=false;
	        			}
	        		}		
					if(flag) {
						cartlist.add(request.getParameter("data"));
						session.setAttribute("cartlist", cartlist);
					}
			}
				cartlist = (List<String>)session.getAttribute("cartlist");
				request.setAttribute("cartlist", cartlist);
				return "redirect:/wishlist.fu";
		}		
	
	@RequestMapping(value = "/deletecart.fu", method = RequestMethod.GET)
	public String deletecart(Locale locale, Model model,HttpServletRequest request,HttpSession session) {
		//Use List
		List cartlist;
		cartlist=(ArrayList<String>)session.getAttribute("cartlist");
		int id = Integer.parseInt(request.getParameter("id"));
		
		System.out.println("cartlist.get(id) :" + cartlist.get(id));
		
		cartlist.remove(id);
		
		session.setAttribute("cartlist", cartlist);
		
		return "redirect:/cartlist.fu";
	}
	
	@RequestMapping(value = "/removeAllcart.fu", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView RemoveAllCart(Locale locale, Model model,HttpServletRequest request,HttpSession session) {
		
		ModelAndView removemav = new ModelAndView();
		removemav.setViewName("redirect:/cartlist.fu");
		session.removeAttribute("cartlist");
		return removemav; 
	}
	
	// wishList part
	@RequestMapping(value = "/wishlist.fu", method = RequestMethod.GET)
	public String wishlist(Locale locale, Model model, HttpServletRequest request, HttpSession session) {
	
		List<String> wishitem;
		
		if(request.getParameter("cate")==null||request.getParameter("cate").equals("")) {
		
		}else {	
				if(session.getAttribute("wishitem")==null) {
					wishitem=new ArrayList<String>();
				}else {
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
					wishitem.add(request.getParameter("cate")+":"+request.getParameter("itemname")+":"+request.getParameter("price").trim()+":"+request.getParameter("imagepath"));
					
					session.setAttribute("wishitem", wishitem);
				}
		}
		wishitem=(List<String>)session.getAttribute("wishitem");
		request.setAttribute("wishitem", wishitem);
		return "wishlist";
	}

	@RequestMapping(value = "/deletewishlist.fu", method = RequestMethod.GET)
	public String deletewishlist(Locale locale, Model model, HttpServletRequest request, HttpSession session) {
		//Use List
		List wishitem;
		wishitem= (ArrayList<String>)session.getAttribute("wishitem");
		int id = Integer.parseInt(request.getParameter("id"));
		System.out.println("wishitem.get(id) :" + wishitem.get(id));
		wishitem.remove(id);		
		session.setAttribute("wishitem", wishitem);	
		return "redirect:/wishlist.fu";
	}

}
