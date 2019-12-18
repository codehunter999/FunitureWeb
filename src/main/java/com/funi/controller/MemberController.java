package com.funi.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Locale;

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

import com.funi.dao.MemberDAO;
import com.funi.dao.PaymentDAO;
import com.funi.domain.MemberDTO;
import com.funi.domain.PaymentDTO;
import com.funi.service.Email;
import com.funi.service.EmailSender;
import com.funi.service.KakaoAPI;
import com.funi.util.MyUtil;
import com.funi.util.SHA256Util;

@Controller
public class MemberController {
	
	@Autowired
	@Qualifier("memberdao")
	MemberDAO memberdao;
	
	@Autowired
	@Qualifier("kakao")
	KakaoAPI kakao;

	@Autowired
	@Qualifier("emailSender")
	EmailSender emailSender;

	@Autowired
	@Qualifier("email")
	Email email;
	
	@Autowired
	@Qualifier("paymentdao")
	PaymentDAO paymentdao;

	// login-register

	@RequestMapping(value = "/login.fu", method = RequestMethod.GET) public
	ModelAndView login(Locale locale, Model model, String message) {
		
		ModelAndView loginmav = new ModelAndView();
		loginmav.setViewName("member/login");

		if (message != null) { 
			loginmav.addObject("message", message); 
		}
		return loginmav; 
	}

	@RequestMapping(value = "/login_ok.fu", method = RequestMethod.POST) public
	ModelAndView login_ok(HttpServletRequest request, Model model, MemberDTO paramdto) {

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

			String paramPassword = SHA256Util.getEncrypt(paramdto.getPwd(),	memberdto.getSalt()); 
			
			System.out.println("paramPassword : " + paramPassword);
			System.out.println("memberdto.getPwd() : " + memberdto.getPwd());
			
			if (!memberdto.getPwd().equals(paramPassword)) { 
				message = "계정 패스워드를 확인해주세요."; 
				
				loginmav.addObject("message", message);
				loginmav.setViewName("member/login"); 
				
				return loginmav; 
			} 
		} 
		catch (Exception e) { 
			System.out.println(e.toString()); 
		} 
		
		HttpSession session = request.getSession(); 
		session.setAttribute("email", memberdto.getEmail());
		session.setAttribute("name", memberdto.getName());
		loginmav.setViewName("redirect:/home.fu"); return loginmav; 
	}

	@RequestMapping(value = "/kakaologin") 
	public String login(@RequestParam("code") String code) { 
		
		String access_Token = kakao.getAccessToken(code); 
		System.out.println("controller access_token : " + access_Token);
		
		return "index"; 
	}

	@RequestMapping(value = "/logout.fu", method = RequestMethod.GET) 
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException { 
		
		ModelAndView logoutmav = new ModelAndView(); 
		session.removeAttribute("email");
	
		logoutmav.setViewName("redirect:/login.fu"); return logoutmav; 
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
			
			memberdto.setPwd(SHA256Util.getEncrypt(paramdto.getPwd(), memberdto.getSalt())); memberdao.update_pw(memberdto); 
		} 
		catch (Exception e)	{ 
			System.out.println(e.toString()); 
		}
		
		changePwdmav.setViewName("redirect:/login.fu"); 
	
		return changePwdmav; 
	}

	@RequestMapping(value = "/sendpw.fu", method = { RequestMethod.GET,	RequestMethod.POST }) 
	public ModelAndView sendEmailAction(ModelMap model,	MemberDTO memberdto) throws Exception {
		
		ModelAndView mav = new ModelAndView(); 
		
		String useremail = memberdto.getEmail(); 
		boolean flag = memberdao.searchID(memberdto.getEmail()); 
		System.out.println(flag); 
		
		if(!flag) { 
			mav = new ModelAndView("member/searchPwd");
			mav.addObject("message", "send no search Email"); 
			
			return mav; 
		} 
		if (useremail!= null) { 
			email.setReceiver(useremail); 
			email.setContent("비밀번호는 " + useremail + " 입니다."); 
			email.setSubject(useremail + "님 비밀번호 찾기 메일입니다.");
			emailSender.SendEmail(email); 
			
			mav = new ModelAndView("member/searchPwd");
			mav.addObject("message", "send email"); } ; 
			
			return mav; 
		}
	
	@RequestMapping(value = "/myinfo.fu", method = {RequestMethod.GET,RequestMethod.POST}) 
	public ModelAndView myinfo(ModelMap model, HttpSession session) throws Exception { 
		
		ModelAndView myinfomav = new ModelAndView();
		String email = (String)session.getAttribute("email"); 
		MemberDTO memberdto = memberdao.searchMember(email); 
		List<PaymentDTO> paylist =  paymentdao.getTotalList(email);
		
		myinfomav.addObject("paylist",paylist);
		myinfomav.addObject("memberdto", memberdto); 
		myinfomav.setViewName("mypage"); 
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
	@RequestMapping(value = "/deleteMember_ok.fu", method = { RequestMethod.GET,
			RequestMethod.POST }) public ModelAndView deleteMeber(ModelMap model,
					HttpSession session) throws Exception { ModelAndView deletemav = new
					ModelAndView(); String email = (String) session.getAttribute("email");
					memberdao.delete_member(email); session.removeAttribute("email");
					deletemav.setViewName("redirect:/login.fu"); deletemav.addObject("message",
							"ȸ���� Ż��Ǿ����ϴ�."); return deletemav; }

	// 회원가입

	@RequestMapping(value = "/register.fu", method = RequestMethod.GET)
	public String register(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {

		if (request.getParameter("mode") != null) {

			response.setContentType("text/html; charset=UTF-8"); 
			PrintWriter writer = response.getWriter();
			
			writer.println("<script>alert('Email이 중복되었습니다.'); history.go(-1); </script>"); 
			writer.flush(); 
		} 
		
		return "member/register"; 
	}

	@RequestMapping(value = "/register_ok.fu", method = { RequestMethod.GET, RequestMethod.POST }) 
	public String register_ok(MemberDTO memberdto, HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("utf-8");

		String phone1 = request.getParameter("phone1"); 
		String phone2 =	request.getParameter("phone2"); 
		String phone = phone1 + phone2; // salt
		
		//SHA256 암호화 저장 
		memberdto.setPhone(phone); 
		String salt = SHA256Util.generateSalt(); 
		memberdto.setSalt(salt); 
		String password = memberdto.getPwd(); 
		password = SHA256Util.getEncrypt(password, salt);
		memberdto.setPwd(password);

		try { 
			memberdao.insertData(memberdto); 
		} 
		catch (Exception e) {
			System.out.println(e.toString()); 
			System.out.println("Email이 중복");
			
			return "redirect:/register.fu?emailcheck=no"; 
		} 
		return "redirect:/login.fu"; 

	}
}
