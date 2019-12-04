package com.funi.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

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
import com.funi.service.Email;
import com.funi.service.EmailSender;
import com.funi.service.KakaoAPI;
import com.funi.util.MyUtil;
import com.funi.util.MyUtil1;
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

	
	// HOME PART
	@RequestMapping(value = "/home.fu", method = RequestMethod.GET)
	public String home1(Locale locale, Model model) {
		return "index";
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

	@RequestMapping("/searchPassword.fu")
	public ModelAndView searchPwd() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/searchPwd");
		return mav;
	}

	@RequestMapping("/sendpw.fu")
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

	@RequestMapping(value = "/upload.fu", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView upload() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("upload");
		return mav;
	}

	@RequestMapping(value = "/upload_ok.fu", method = { RequestMethod.GET, RequestMethod.POST })
	public String upload_ok(MultipartHttpServletRequest request, HttpServletResponse response, String str) {

		FurnitureDTO dto = new FurnitureDTO();

		MultipartFile file = request.getFile("bedupload");
		dto.setImageIndex(Integer.parseInt(request.getParameter("imageIndex")));
		dto.setCateEn(request.getParameter("cateE"));
		dto.setCate(request.getParameter("cateK"));
		dto.setProductName(request.getParameter("productName"));
		dto.setPrice(Integer.parseInt(request.getParameter("price")));
		dto.setSaveFileName(file.getOriginalFilename());
		bedDao.insertBedData(dto);
		// 실제경로:
		// D:\sts-bundle\work\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\HotelWebService\event
		Path path1 = Paths.get("D:\\sts-bundle\\work\\FurnitureWeb\\src\\main\\webapp\\resources\\images\\bedroom");
		String path = request.getSession().getServletContext().getRealPath("/image/bed");
		System.out.println("패스" + path);
		if (file != null && file.getSize() > 0) { // 파일이 있으면
			try {
				FileOutputStream fos = new FileOutputStream(path + "/" + file.getOriginalFilename());
				InputStream is = file.getInputStream();
				byte[] buffer = new byte[512];
				while (true) {
					int data = is.read(buffer, 0, buffer.length);
					if (data == -1) {
						break;
					}
					fos.write(buffer, 0, data);
				}
				is.close();
				fos.close();

			} catch (Exception e) {
				System.out.println(e.toString());
			}
		}
		System.out.println("dto:" + dto);
		return "redirect:/upload.fu";
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
		// EVENT PART
		@RequestMapping(value = "/event_list.fu", method = RequestMethod.GET)
		public String event_list(Locale locale, Model model) {
			return "event/event_list";
		}

		@RequestMapping(value = "/event_2.fu", method = RequestMethod.GET)
		public String event_2(Locale locale, Model model) {
			return "event/event_2";
		}

		@RequestMapping(value = "/event_3.fu", method = RequestMethod.GET)
		public String event_3(Locale locale, Model model) {
			return "event/event_3";
		}

		@RequestMapping(value = "/event_4.fu", method = RequestMethod.GET)
		public String event_4(Locale locale, Model model) {
			return "event/event_4";
		}

		@RequestMapping(value = "/event_5.fu", method = RequestMethod.GET)
		public String event_5(Locale locale, Model model) {
			return "event/event_5";
		}

		// payment part
		@RequestMapping(value = "/payment.fu", method = RequestMethod.GET)
		public String payment(Locale locale, Model model) {
			return "payment";
		}

		// 카트 장바구니 
		@RequestMapping(value = "/cart.fu", method = RequestMethod.GET)
		public String cartList(Locale locale, Model model,HttpServletRequest request,HttpSession session) {
			
			Map<String, String> cartlist;
			
			if(request.getParameter("cate")==null || request.getParameter("cate").equals("")) {
			}else {
				if(session.getAttribute("cartlist")==null) {
					cartlist=new HashMap<String, String>();
				}else {
					cartlist=(HashMap<String, String>)session.getAttribute("cartlist");
				}
				cartlist.put(request.getParameter("cate")+","+ request.getParameter("imageIndex"),request.getParameter("price")+","+request.getParameter("imagetype"));
				session.setAttribute("cartlist", cartlist);
			}
			cartlist=(HashMap<String, String>)session.getAttribute("cartlist");
			request.setAttribute("cartlist", cartlist);
			return "cart/cart";
		}
		
		@RequestMapping(value = "/deletecart.fu", method = RequestMethod.GET)
		public String deletec(Locale locale, Model model,HttpServletRequest request,HttpSession session) {
			
			System.out.println(request.getParameter("id"));
			Map<String, String> wishitem;
			if(session.getAttribute("wishitem")==null) {
				wishitem=new HashMap<String, String>();
			}else {
				wishitem=(HashMap<String, String>)session.getAttribute("wishitem");
			}
			wishitem.remove(request.getParameter("id"));
			session.setAttribute("wishitem", wishitem);
			return "redirect:/wishlist.fu";
		}
		
		@RequestMapping(value = "/wishlist.fu", method = RequestMethod.GET)
		public String wishlist(Locale locale, Model model,HttpServletRequest request,HttpSession session) {
			
			Map<String, String> wishitem;
			
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
			request.setAttribute("wishitem", wishitem);
			return "wishlist";
		}
		@RequestMapping(value = "/deletewishlist.fu", method = RequestMethod.GET)
		public String deletewishlist(Locale locale, Model model,HttpServletRequest request,HttpSession session) {
			
			System.out.println(request.getParameter("id"));
			Map<String, String> wishitem;
			if(session.getAttribute("wishitem")==null) {
				wishitem=new HashMap<String, String>();
			}else {
				wishitem=(HashMap<String, String>)session.getAttribute("wishitem");
			}
			wishitem.remove(request.getParameter("id"));
			session.setAttribute("wishitem", wishitem);
			return "redirect:/wishlist.fu";
		}

	}


