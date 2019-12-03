package com.funi.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
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
import com.funi.domain.QnADTO;
import com.funi.domain.Re_QnADTO;
import com.funi.domain.Re_ReviewDTO;
import com.funi.domain.ReviewDTO;
import com.funi.domain.FurnitureDTO;
import com.funi.util.MyUtil;
import com.funi.util.MyUtil1;

import com.funi.service.Email;
import com.funi.service.EmailSender;
import com.funi.service.KakaoAPI;
import com.funi.domain.FurnitureDTO;
import com.funi.util.MyUtil;
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

	/*
	 * @RequestMapping(value = "/upload.fu", method = { RequestMethod.GET,
	 * RequestMethod.POST }) public ModelAndView upload() { ModelAndView mav = new
	 * ModelAndView(); mav.setViewName("upload"); return mav; }
	 * 
	 * @RequestMapping(value = "/upload_ok.fu", method = { RequestMethod.GET,
	 * RequestMethod.POST }) public String upload_ok(MultipartHttpServletRequest
	 * request, HttpServletResponse response, String str) {
	 * 
	 * FurnitureDTO dto = new FurnitureDTO();
	 * 
	 * MultipartFile file = request.getFile("bedupload");
	 * dto.setImageIndex(Integer.parseInt(request.getParameter("imageIndex")));
	 * dto.setCateEn(request.getParameter("cateE"));
	 * dto.setCate(request.getParameter("cateK"));
	 * dto.setProductName(request.getParameter("productName"));
	 * dto.setPrice(Integer.parseInt(request.getParameter("price")));
	 * dto.setSaveFileName(file.getOriginalFilename()); bedDao.insertBedData(dto);
	 * // 실제경로: //
	 * D:\sts-bundle\work\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\
	 * wtpwebapps\HotelWebService\event Path path1 = Paths.get(
	 * "D:\\sts-bundle\\work\\FurnitureWeb\\src\\main\\webapp\\resources\\images\\bedroom"
	 * ); String path =
	 * request.getSession().getServletContext().getRealPath("/image/bed");
	 * System.out.println("패스" + path); if (file != null && file.getSize() > 0) { //
	 * 파일이 있으면 try { FileOutputStream fos = new FileOutputStream(path + "/" +
	 * file.getOriginalFilename()); InputStream is = file.getInputStream(); byte[]
	 * buffer = new byte[512]; while (true) { int data = is.read(buffer, 0,
	 * buffer.length); if (data == -1) { break; } fos.write(buffer, 0, data); }
	 * is.close(); fos.close();
	 * 
	 * } catch (Exception e) { System.out.println(e.toString()); } }
	 * System.out.println("dto:" + dto); return "redirect:/upload.fu"; }
	 * 
	 * 
	 * @RequestMapping(value = "/dining_deco_details.fu", method =
	 * {RequestMethod.GET,RequestMethod.POST}) public ModelAndView
	 * dining_deco_details(HttpServletRequest request) {
	 * 
	 * ModelAndView mav = new ModelAndView();
	 * 
	 * int imageIndex = Integer.parseInt(request.getParameter("imageIndex")); String
	 * cate = request.getParameter("cate");
	 * 
	 * List<FurnitureDTO> catelists = diningdao.getCateLists(cate);
	 * 
	 * FurnitureDTO dto = diningdao.getReadData(imageIndex,cate);
	 * 
	 * mav.setViewName("dining_deco_details"); mav.addObject("dto", dto);
	 * mav.addObject("catelists", catelists);
	 * 
	 * return mav; }
	 * 
	 * @RequestMapping(value = "/dining_desk.fu", method =
	 * {RequestMethod.GET,RequestMethod.POST}) public ModelAndView
	 * dining_desk(HttpServletRequest request) {
	 * 
	 * ModelAndView mav = new ModelAndView();
	 * 
	 * String cate = request.getParameter("cate");
	 * 
	 * List<FurnitureDTO> catelists = diningdao.getCateLists(cate);
	 * 
	 * mav.setViewName("dining_desk"); mav.addObject("catelists", catelists);
	 * 
	 * return mav;
	 * 
	 * }
	 * 
	 * @RequestMapping(value = "/dining_desk_details.fu", method =
	 * {RequestMethod.GET,RequestMethod.POST}) public ModelAndView
	 * dining_desk_details(HttpServletRequest request) {
	 * 
	 * ModelAndView mav = new ModelAndView();
	 * 
	 * int imageIndex = Integer.parseInt(request.getParameter("imageIndex")); String
	 * cate = request.getParameter("cate");
	 * 
	 * List<FurnitureDTO> catelists = diningdao.getCateLists(cate);
	 * 
	 * FurnitureDTO dto = diningdao.getReadData(imageIndex,cate);
	 * 
	 * mav.setViewName("dining_desk_details"); mav.addObject("dto", dto);
	 * mav.addObject("catelists", catelists);
	 * 
	 * return mav; }
	 * 
	 * //Ȩ���� ������ ��Ʈ�ѷ�
	 * 
	 * @RequestMapping(value = "/decofull.fu", method =
	 * {RequestMethod.GET,RequestMethod.POST}) public ModelAndView
	 * decofull(HttpServletRequest request) throws Exception {
	 * 
	 * //����¡ó�� String cp = request.getContextPath();
	 * 
	 * String pageNum = request.getParameter("pageNum"); int currentPage = 1;
	 * 
	 * if(pageNum != null) { currentPage = Integer.parseInt(pageNum); }
	 * 
	 * String searchValue = request.getParameter("searchValue");
	 * 
	 * if(searchValue==null) {
	 * 
	 * searchValue = "";
	 * 
	 * }else{
	 * 
	 * if(request.getMethod().equalsIgnoreCase("GET")) searchValue =
	 * URLDecoder.decode(searchValue, "UTF-8");
	 * 
	 * }
	 * 
	 * 
	 * System.out.println("test searchValue: " + searchValue);
	 * 
	 * //��ü�����Ͱ��� int dataCount = decodao.getDataCount(searchValue);
	 * 
	 * System.out.println("��ü������ ����: " + decodao.getDataCount(searchValue));
	 * //72
	 * 
	 * //��ü�������� int numPerPage = 12; int totalPage =
	 * myUtil.getPageCount(numPerPage, dataCount);
	 * 
	 * if(currentPage > totalPage) currentPage = totalPage;
	 * 
	 * int start = (currentPage-1)*numPerPage+1; int end = currentPage*numPerPage;
	 * 
	 * List<FurnitureDTO> lists = decodao.getLists(start,end,searchValue);
	 * 
	 * //����¡ ó�� String param = ""; if(!searchValue.equals("")){ param=
	 * "searchValue=" + URLEncoder.encode(searchValue, "UTF-8"); }
	 * 
	 * String listUrl = cp + "/decofull.fu"; if(!param.equals("")){ listUrl =
	 * listUrl + "?" + param; }
	 * 
	 * String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);
	 * /////////////////////////////////////////////////////////////////
	 * System.out.println("test2");
	 * 
	 * 
	 * //�ۺ��� �ּ� ���� String DiningUrl = cp + "/dining_" + dto.getCateEn()
	 * +"_details?pageNum=" + currentPage;
	 * 
	 * if(!param.equals("")) articleUrl = articleUrl + "&" + param;
	 * 
	 * 
	 * 
	 * ModelAndView mav = new ModelAndView();
	 * 
	 * //System.out.println("lists"+lists.size()); mav.setViewName("decofull");
	 * mav.addObject("lists", lists); mav.addObject("dataCount", dataCount);
	 * mav.addObject("pageIndexList", pageIndexList); mav.addObject("pageNum",
	 * pageNum);
	 * 
	 * return mav;
	 * 
	 * }
	 * 
	 * @RequestMapping(value = "/deco_monthly.fu", method =
	 * {RequestMethod.GET,RequestMethod.POST}) public ModelAndView
	 * deco_monthlly(HttpServletRequest request) {
	 * 
	 * ModelAndView mav = new ModelAndView();
	 * 
	 * String cate = request.getParameter("cate");
	 * 
	 * List<FurnitureDTO> catelists = decodao.getCateLists(cate);
	 * 
	 * mav.setViewName("deco_monthly"); mav.addObject("catelists", catelists);
	 * 
	 * return mav; }
	 * 
	 * @RequestMapping(value = "/deco_monthly_details.fu", method =
	 * {RequestMethod.GET,RequestMethod.POST}) public ModelAndView
	 * deco_monthly_details(HttpServletRequest request) {
	 * 
	 * ModelAndView mav = new ModelAndView();
	 * 
	 * int imageIndex = Integer.parseInt(request.getParameter("imageIndex")); String
	 * cate = request.getParameter("cate");
	 * 
	 * List<FurnitureDTO> catelists = decodao.getCateLists(cate);
	 * 
	 * FurnitureDTO dto = decodao.getReadData(imageIndex,cate);
	 * 
	 * mav.setViewName("deco_monthly_details"); mav.addObject("dto", dto);
	 * mav.addObject("catelists", catelists);
	 * 
	 * return mav; }
	 * 
	 * @RequestMapping(value = "/deco_light.fu", method =
	 * {RequestMethod.GET,RequestMethod.POST}) public ModelAndView
	 * deco_light(HttpServletRequest request) {
	 * 
	 * ModelAndView mav = new ModelAndView();
	 * 
	 * String cate = request.getParameter("cate");
	 * 
	 * List<FurnitureDTO> catelists = decodao.getCateLists(cate);
	 * 
	 * mav.setViewName("deco_light"); mav.addObject("catelists", catelists);
	 * 
	 * return mav;
	 * 
	 * }
	 * 
	 * @RequestMapping(value = "/deco_light_details.fu", method =
	 * {RequestMethod.GET,RequestMethod.POST}) public ModelAndView
	 * deco_light_details(HttpServletRequest request) {
	 * 
	 * ModelAndView mav = new ModelAndView();
	 * 
	 * int imageIndex = Integer.parseInt(request.getParameter("imageIndex")); String
	 * cate = request.getParameter("cate");
	 * 
	 * List<FurnitureDTO> catelists = decodao.getCateLists(cate);
	 * 
	 * FurnitureDTO dto = decodao.getReadData(imageIndex,cate);
	 * 
	 * mav.setViewName("deco_light_details"); mav.addObject("dto", dto);
	 * mav.addObject("catelists", catelists);
	 * 
	 * return mav; }
	 * 
	 * @RequestMapping(value = "/deco_plasticch.fu", method =
	 * {RequestMethod.GET,RequestMethod.POST}) public ModelAndView
	 * deco_plasticch(HttpServletRequest request) {
	 * 
	 * ModelAndView mav = new ModelAndView();
	 * 
	 * String cate = request.getParameter("cate");
	 * 
	 * List<FurnitureDTO> catelists = decodao.getCateLists(cate);
	 * 
	 * mav.setViewName("deco_plasticch"); mav.addObject("catelists", catelists);
	 * 
	 * return mav;
	 * 
	 * }
	 * 
	 * @RequestMapping(value = "/deco_plasticch_details.fu", method =
	 * {RequestMethod.GET,RequestMethod.POST}) public ModelAndView
	 * deco_plasticch_details(HttpServletRequest request) {
	 * 
	 * ModelAndView mav = new ModelAndView();
	 * 
	 * int imageIndex = Integer.parseInt(request.getParameter("imageIndex")); String
	 * cate = request.getParameter("cate");
	 * 
	 * List<FurnitureDTO> catelists = decodao.getCateLists(cate);
	 * 
	 * FurnitureDTO dto = decodao.getReadData(imageIndex,cate);
	 * 
	 * mav.setViewName("deco_plasticch_details"); mav.addObject("dto", dto);
	 * mav.addObject("catelists", catelists);
	 * 
	 * return mav;
	 * 
	 * }
	 */

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

	/*
	 * // REVIEW PART
	 * 
	 * @RequestMapping(value = "/qnamain.fu", method = { RequestMethod.GET,
	 * RequestMethod.POST }) public String qnamain(HttpServletRequest request,
	 * Locale locale, Model model) { String cp = request.getContextPath(); String
	 * pageNum = request.getParameter("pageNum"); int currentPage = 1;
	 * 
	 * if (pageNum != null) currentPage = Integer.parseInt(pageNum);
	 * 
	 * // �뜝�룞�삕泥닷뜝�룞�삕�뜝�룞�삕�뜝�떢怨ㅼ삕�뜝�룞�삕 int dataCount = qnadao.getDataCount();
	 * 
	 * // �뜝�룞�삕泥닷뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 int numPerPage = 5; int totalPage =
	 * myUtil.getPageCount(numPerPage, dataCount);
	 * 
	 * if (currentPage > totalPage) currentPage = totalPage;
	 * 
	 * int start = (currentPage - 1) * numPerPage + 1; int end = currentPage *
	 * numPerPage; List<QnADTO> lists = qnadao.getList(start, end);
	 * 
	 * String listUrl = cp + "/qnamain.fu";
	 * 
	 * String pageIndexList = myUtil1.pageIndexList(currentPage, totalPage,
	 * listUrl);
	 * 
	 * // �뜝�뙗釉앹삕�뜝�룞�삕 �뜝�뙇�눦�삕 �뜝�룞�삕�뜝�룞�삕 String articleUrl = cp +
	 * "/qnamain.fu?pageNum=" + currentPage;
	 * 
	 * // �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕�뜝�떢紐뚯삕 //
	 * �뜝�떬源띿삕�뜝占� request.setAttribute("lists", lists);
	 * request.setAttribute("pageIndexList", pageIndexList);
	 * request.setAttribute("dataCount", dataCount);
	 * request.setAttribute("articleUrl", articleUrl);
	 * 
	 * return "qna/qnamain"; }
	 * 
	 * @RequestMapping(value = "/qnawrite.fu", method = { RequestMethod.GET,
	 * RequestMethod.POST }) public String qnawrite(QnADTO dto, HttpServletRequest
	 * request, Locale locale, Model model, HttpSession session) {
	 * 
	 * dto.setId(qnadao.getMAXID() + 1); dto.setIpaddr(request.getRemoteAddr());
	 * dto.setName("�솉�뜝�뜽�룞");
	 * 
	 * qnadao.insertData(dto);
	 * 
	 * return "redirect:/qnamain.fu"; }
	 * 
	 * @RequestMapping(value = "/qnaarticle.fu", method = { RequestMethod.GET,
	 * RequestMethod.POST }) public String qnaview(HttpServletRequest request,
	 * Locale locale, Model model) { QnADTO dto =
	 * qnadao.getReadData(Integer.valueOf(request.getParameter("id")));
	 * request.setAttribute("dto", dto); List<Re_QnADTO> lists =
	 * qnadao.Re_getList(dto.getId()); request.setAttribute("lists", lists); return
	 * "qna/qnaarticle"; }
	 * 
	 * @RequestMapping(value = "/qnaarticlewrite.fu", method = { RequestMethod.GET,
	 * RequestMethod.POST }) public String qnaview_write(Re_QnADTO dto,
	 * HttpServletRequest request, Locale locale, Model model) {
	 * dto.setId(qnadao.getRe_MAXID() + 1); dto.setIpaddr(request.getRemoteAddr());
	 * dto.setName("�솉�뜝�뜽�룞");
	 * dto.setQaboard_id(Integer.valueOf(request.getParameter("qaboard_id")));
	 * qnadao.Re_insertData(dto); QnADTO reviewdto =
	 * qnadao.getReadData(Integer.valueOf(request.getParameter("qaboard_id")));
	 * request.setAttribute("dto", reviewdto); List<Re_QnADTO> lists =
	 * qnadao.Re_getList(Integer.valueOf(request.getParameter("qaboard_id")));
	 * request.setAttribute("lists", lists); return "qna/qnaarticle"; }
	 * 
	 * @RequestMapping(value = "/qnadelete.fu", method = { RequestMethod.GET,
	 * RequestMethod.POST }) public String qnadelete(HttpServletRequest request,
	 * Locale locale, Model model) {
	 * qnadao.deleteData(Integer.valueOf(request.getParameter("id"))); return
	 * "redirect:/qnamain.fu"; }
	 * 
	 * @RequestMapping(value = "/qnarewrite.fu", method = { RequestMethod.GET,
	 * RequestMethod.POST }) public String qnawirte(HttpServletRequest request,
	 * Locale locale, Model model) { QnADTO dto =
	 * qnadao.getReadData(Integer.valueOf(request.getParameter("id")));
	 * request.setAttribute("dto", dto); List<Re_QnADTO> lists =
	 * qnadao.Re_getList(dto.getId()); request.setAttribute("lists", lists); return
	 * "qna/qnaarticle"; }
	 * 
	 * @RequestMapping(value = "/qnarewrite_ok.fu", method = { RequestMethod.GET,
	 * RequestMethod.POST }) public String qnawirte_ok(QnADTO redto,
	 * HttpServletRequest request, Locale locale, Model model) {
	 * redto.setId(Integer.valueOf(request.getParameter("id")));
	 * qnadao.updateData(redto); QnADTO dto =
	 * qnadao.getReadData(Integer.valueOf(request.getParameter("id")));
	 * request.setAttribute("dto", dto); List<Re_QnADTO> lists =
	 * qnadao.Re_getList(dto.getId()); request.setAttribute("lists", lists); return
	 * "qna/qnaarticle"; }
	 * 
	 * @RequestMapping(value = "/reviewmain.fu", method = { RequestMethod.GET,
	 * RequestMethod.POST }) public String reviewmain(HttpServletRequest request,
	 * Locale locale, Model model) { String cp = request.getContextPath(); String
	 * pageNum = request.getParameter("pageNum"); int currentPage = 1;
	 * 
	 * if (pageNum != null) currentPage = Integer.parseInt(pageNum);
	 * 
	 * // �뜝�룞�삕泥닷뜝�룞�삕�뜝�룞�삕�뜝�떢怨ㅼ삕�뜝�룞�삕 int dataCount = reviewdao.getDataCount();
	 * 
	 * // �뜝�룞�삕泥닷뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 int numPerPage = 5; int totalPage =
	 * myUtil.getPageCount(numPerPage, dataCount);
	 * 
	 * if (currentPage > totalPage) currentPage = totalPage;
	 * 
	 * int start = (currentPage - 1) * numPerPage + 1; int end = currentPage *
	 * numPerPage; List<ReviewDTO> lists = reviewdao.getList(start, end);
	 * 
	 * String listUrl = cp + "/reviewmain.fu";
	 * 
	 * String pageIndexList = myUtil1.pageIndexList(currentPage, totalPage,
	 * listUrl);
	 * 
	 * // �뜝�뙗釉앹삕�뜝�룞�삕 �뜝�뙇�눦�삕 �뜝�룞�삕�뜝�룞�삕 String articleUrl = cp +
	 * "/reviewmain.fu?pageNum=" + currentPage;
	 * 
	 * // �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕�뜝�떢紐뚯삕 //
	 * �뜝�떬源띿삕�뜝占� request.setAttribute("lists", lists);
	 * request.setAttribute("pageIndexList", pageIndexList);
	 * request.setAttribute("dataCount", dataCount);
	 * request.setAttribute("articleUrl", articleUrl);
	 * 
	 * return "review/reviewmain"; }
	 * 
	 * @RequestMapping(value = "/reviewwrite.fu", method = { RequestMethod.GET,
	 * RequestMethod.POST }) public String reviewwrite(ReviewDTO dto,
	 * MultipartHttpServletRequest request, Locale locale, Model model, HttpSession
	 * session) { System.out.println("�뜝�룞�삕�듃�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕" +
	 * reviewdao.getMAXID());
	 * 
	 * dto.setId(reviewdao.getMAXID() + 1); dto.setIpaddr(request.getRemoteAddr());
	 * dto.setName("�솉�뜝�뜽�룞"); // String // path=
	 * "D:/sts-bundle/work/FurnitureWeb/src/main/webapp/resources/assets/img/save";
	 * String path = "d:/file"; // String // path=
	 * "D:/sts-bundle/work/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/FurnitureWeb/files";
	 * MultipartFile file = request.getFile("upload"); if (file != null &&
	 * file.getSize() > 0) { try { FileOutputStream fos = new FileOutputStream(path
	 * + "/" + file.getOriginalFilename()); InputStream is = file.getInputStream();
	 * byte[] buffer = new byte[512]; while (true) { int data = is.read(buffer, 0,
	 * buffer.length); if (data == -1) { break; } fos.write(buffer, 0, data); }
	 * is.close(); fos.close(); } catch (Exception e) { // TODO: handle exception
	 * System.out.println(e.toString()); } } else {
	 * System.out.println("�뜝�룞�삕�뜝�룞�삕�뜝�떢怨ㅼ삕 �뜝�룞�삕�뜝�룞�삕�뜝�떦�뙋�삕."); }
	 * dto.setPhoto(file.getOriginalFilename()); reviewdao.insertData(dto);
	 * 
	 * return "redirect:/reviewmain.fu"; }
	 * 
	 * @RequestMapping(value = "/reviewarticle.fu", method = { RequestMethod.GET,
	 * RequestMethod.POST }) public String reviewview(HttpServletRequest request,
	 * Locale locale, Model model) { ReviewDTO dto =
	 * reviewdao.getReadData(Integer.valueOf(request.getParameter("id")));
	 * request.setAttribute("dto", dto); List<Re_ReviewDTO> lists =
	 * reviewdao.Re_getList(dto.getId()); request.setAttribute("lists", lists);
	 * return "review/reviewarticle"; }
	 * 
	 * @RequestMapping(value = "/reviewarticlewrite.fu", method = {
	 * RequestMethod.GET, RequestMethod.POST }) public String
	 * reviewview_write(Re_ReviewDTO dto, HttpServletRequest request, Locale locale,
	 * Model model) { dto.setId(reviewdao.getRe_MAXID() + 1);
	 * dto.setIpaddr(request.getRemoteAddr()); dto.setName("�솉�뜝�뜽�룞");
	 * dto.setQaboard_id(Integer.valueOf(request.getParameter("qaboard_id")));
	 * reviewdao.Re_insertData(dto); ReviewDTO reviewdto =
	 * reviewdao.getReadData(Integer.valueOf(request.getParameter("qaboard_id")));
	 * request.setAttribute("dto", reviewdto); List<Re_ReviewDTO> lists =
	 * reviewdao.Re_getList(Integer.valueOf(request.getParameter("qaboard_id")));
	 * request.setAttribute("lists", lists); return "review/reviewarticle"; }
	 * 
	 * @RequestMapping(value = "/reviewdelete.fu", method = { RequestMethod.GET,
	 * RequestMethod.POST }) public String reviewdelete(HttpServletRequest request,
	 * Locale locale, Model model) {
	 * reviewdao.deleteData(Integer.valueOf(request.getParameter("id"))); return
	 * "redirect:/reviewmain.fu"; }
	 * 
	 * @RequestMapping(value = "/reviewrewrite.fu", method = { RequestMethod.GET,
	 * RequestMethod.POST }) public String reviewrewirte(HttpServletRequest request,
	 * Locale locale, Model model) { ReviewDTO dto =
	 * reviewdao.getReadData(Integer.valueOf(request.getParameter("id")));
	 * request.setAttribute("dto", dto); List<Re_ReviewDTO> lists =
	 * reviewdao.Re_getList(dto.getId()); request.setAttribute("lists", lists);
	 * return "review/reviewarticle"; }
	 * 
	 * @RequestMapping(value = "/reviewrewrite_ok.fu", method = { RequestMethod.GET,
	 * RequestMethod.POST }) public String reviewrewirte_ok(ReviewDTO redto,
	 * HttpServletRequest request, Locale locale, Model model) {
	 * redto.setId(Integer.valueOf(request.getParameter("id")));
	 * reviewdao.updateData(redto); ReviewDTO dto =
	 * reviewdao.getReadData(Integer.valueOf(request.getParameter("id")));
	 * request.setAttribute("dto", dto); List<Re_ReviewDTO> lists =
	 * reviewdao.Re_getList(dto.getId()); request.setAttribute("lists", lists);
	 * return "review/reviewarticle"; }
	 * 
	 * // <거실파트> // 거실 total
	 * 
	 * @RequestMapping(value = "/living_total.fu", method = { RequestMethod.GET,
	 * RequestMethod.POST }) public ModelAndView living_total(Locale locale, Model
	 * model) { ModelAndView mav = new ModelAndView();
	 * 
	 * List<FurnitureDTO> lists = livingDao.livingImageList(); //
	 * System.out.println("lists"+lists.size()); mav.setViewName("living_total");
	 * mav.addObject("lists", lists);
	 * 
	 * return mav; }
	 * 
	 * // --------------------------------------------------------------------- //
	 * 선브렐라 // cateEn이 null
	 * 
	 * @RequestMapping(value = "/living_sunb.fu", method = { RequestMethod.GET,
	 * RequestMethod.POST }) public ModelAndView living_sunb(HttpServletRequest
	 * request, HttpServletResponse response, String cateEn) {
	 * 
	 * ModelAndView mav = new ModelAndView(); System.out.println(cateEn);
	 * HashMap<String, Object> livingMap = new HashMap<String, Object>();
	 * livingMap.put("cateEn", cateEn); System.out.println(cateEn);
	 * 
	 * List<FurnitureDTO> lists = livingDao.cateEImageList(livingMap);
	 * mav.setViewName("living_sunb"); mav.addObject("lists", lists);
	 * 
	 * return mav;
	 * 
	 * }
	 * 
	 * @RequestMapping(value = "/living_sunb_details.fu", method = {
	 * RequestMethod.GET, RequestMethod.POST }) public ModelAndView
	 * living_sunb_details(HttpServletRequest request, int imageIndex, String
	 * cateEn) {
	 * 
	 * ModelAndView mav = new ModelAndView();
	 * 
	 * 
	 * int imageIndex = Integer.parseInt(request.getParameter("imageIndex")); String
	 * cateE = request.getParameter("cateE");
	 * 
	 * 
	 * HashMap<String, Object> params = new HashMap<String, Object>();
	 * params.put("cateEn", cateEn); params.put("imageIndex", imageIndex);
	 * List<FurnitureDTO> Lists = livingDao.cateEImageList(params);
	 * 
	 * FurnitureDTO dto = livingDao.getReadData(imageIndex, cateEn);
	 * System.out.println("test 입니다 " + dto.getSaveFileName());
	 * mav.setViewName("living_sunb_details"); mav.addObject("dto", dto);
	 * mav.addObject("lists", Lists);
	 * 
	 * return mav; }
	 * 
	 * // ---------------------------------------------------------------------
	 * 
	 * // 패브릭
	 * 
	 * @RequestMapping(value = "/living_fabric.fu", method = { RequestMethod.GET,
	 * RequestMethod.POST }) public ModelAndView living_fabric(HttpServletRequest
	 * request, HttpServletResponse response, String cateEn) {
	 * 
	 * ModelAndView mav = new ModelAndView(); System.out.println(cateEn);
	 * HashMap<String, Object> livingMap = new HashMap<String, Object>();
	 * livingMap.put("cateEn", cateEn); System.out.println(cateEn);
	 * 
	 * List<FurnitureDTO> lists = livingDao.cateEImageList(livingMap);
	 * mav.setViewName("living_fabric"); mav.addObject("lists", lists);
	 * 
	 * return mav; }
	 * 
	 * @RequestMapping(value = "/living_fabric_details.fu", method = {
	 * RequestMethod.GET, RequestMethod.POST }) public ModelAndView
	 * living_fabric_details(HttpServletRequest request, int imageIndex, String
	 * cateEn) {
	 * 
	 * ModelAndView mav = new ModelAndView();
	 * 
	 * 
	 * int imageIndex = Integer.parseInt(request.getParameter("imageIndex")); String
	 * cateE = request.getParameter("cateE");
	 * 
	 * 
	 * HashMap<String, Object> params = new HashMap<String, Object>();
	 * params.put("cateEn", cateEn); params.put("imageIndex", imageIndex);
	 * List<FurnitureDTO> Lists = livingDao.cateEImageList(params);
	 * 
	 * FurnitureDTO dto = livingDao.getReadData(imageIndex, cateEn);
	 * System.out.println("test 입니다 " + dto.getSaveFileName());
	 * mav.setViewName("living_fabric_details"); mav.addObject("dto", dto);
	 * mav.addObject("lists", Lists);
	 * 
	 * return mav; }
	 * 
	 * // --------------------------------------------------------------------- //
	 * 가죽
	 * 
	 * @RequestMapping(value = "/living_leather.fu", method = { RequestMethod.GET,
	 * RequestMethod.POST }) public ModelAndView living_leather(HttpServletRequest
	 * request, HttpServletResponse response, String cateEn) {
	 * 
	 * ModelAndView mav = new ModelAndView(); System.out.println(cateEn);
	 * HashMap<String, Object> livingMap = new HashMap<String, Object>();
	 * livingMap.put("cateEn", cateEn); System.out.println(cateEn);
	 * 
	 * List<FurnitureDTO> lists = livingDao.cateEImageList(livingMap);
	 * mav.setViewName("living_leather"); mav.addObject("lists", lists);
	 * 
	 * return mav; }
	 * 
	 * @RequestMapping(value = "/living_leather_details.fu", method = {
	 * RequestMethod.GET, RequestMethod.POST }) public ModelAndView
	 * living_leather_details(HttpServletRequest request, int imageIndex, String
	 * cateEn) {
	 * 
	 * ModelAndView mav = new ModelAndView();
	 * 
	 * 
	 * int imageIndex = Integer.parseInt(request.getParameter("imageIndex")); String
	 * cateE = request.getParameter("cateE");
	 * 
	 * 
	 * HashMap<String, Object> params = new HashMap<String, Object>();
	 * params.put("cateEn", cateEn); params.put("imageIndex", imageIndex);
	 * List<FurnitureDTO> Lists = livingDao.cateEImageList(params);
	 * 
	 * FurnitureDTO dto = livingDao.getReadData(imageIndex, cateEn);
	 * System.out.println("test 입니다 " + dto.getSaveFileName());
	 * mav.setViewName("living_leather_details"); mav.addObject("dto", dto);
	 * mav.addObject("lists", Lists);
	 * 
	 * return mav; }
	 * 
	 * // --------------------------------------------------------------------- //
	 * 데우스
	 * 
	 * @RequestMapping(value = "/living_deus.fu", method = { RequestMethod.GET,
	 * RequestMethod.POST }) public ModelAndView living_deus(HttpServletRequest
	 * request, HttpServletResponse response, String cateEn) {
	 * 
	 * ModelAndView mav = new ModelAndView(); System.out.println(cateEn);
	 * HashMap<String, Object> livingMap = new HashMap<String, Object>();
	 * livingMap.put("cateEn", cateEn); System.out.println(cateEn);
	 * 
	 * List<FurnitureDTO> lists = livingDao.cateEImageList(livingMap);
	 * mav.setViewName("living_deus"); mav.addObject("lists", lists);
	 * 
	 * return mav; }
	 * 
	 * @RequestMapping(value = "/living_deus_details.fu", method = {
	 * RequestMethod.GET, RequestMethod.POST }) public ModelAndView
	 * living_deus_details(HttpServletRequest request, int imageIndex, String
	 * cateEn) {
	 * 
	 * ModelAndView mav = new ModelAndView();
	 * 
	 * 
	 * int imageIndex = Integer.parseInt(request.getParameter("imageIndex")); String
	 * cateE = request.getParameter("cateE");
	 * 
	 * 
	 * HashMap<String, Object> params = new HashMap<String, Object>();
	 * params.put("cateEn", cateEn); params.put("imageIndex", imageIndex);
	 * List<FurnitureDTO> Lists = livingDao.cateEImageList(params);
	 * 
	 * FurnitureDTO dto = livingDao.getReadData(imageIndex, cateEn);
	 * System.out.println("test 입니다 " + dto.getSaveFileName());
	 * mav.setViewName("living_deus_details"); mav.addObject("dto", dto);
	 * mav.addObject("lists", Lists);
	 * 
	 * return mav; }
	 * 
	 * // --------------------------------------------------------------------- //
	 * 사이드 테이블
	 * 
	 * @RequestMapping(value = "/living_sideTable.fu", method = { RequestMethod.GET,
	 * RequestMethod.POST }) public ModelAndView living_sideTable(HttpServletRequest
	 * request, HttpServletResponse response, String cateEn) {
	 * 
	 * ModelAndView mav = new ModelAndView(); System.out.println(cateEn);
	 * HashMap<String, Object> livingMap = new HashMap<String, Object>();
	 * livingMap.put("cateEn", cateEn); System.out.println(cateEn);
	 * 
	 * List<FurnitureDTO> lists = livingDao.cateEImageList(livingMap);
	 * mav.setViewName("living_sideTable"); mav.addObject("lists", lists);
	 * 
	 * return mav; }
	 * 
	 * @RequestMapping(value = "/living_sideTable_details.fu", method = {
	 * RequestMethod.GET, RequestMethod.POST }) public ModelAndView
	 * living_sideTable_details(HttpServletRequest request, int imageIndex, String
	 * cateEn) {
	 * 
	 * ModelAndView mav = new ModelAndView();
	 * 
	 * 
	 * int imageIndex = Integer.parseInt(request.getParameter("imageIndex")); String
	 * cateE = request.getParameter("cateE");
	 * 
	 * 
	 * HashMap<String, Object> params = new HashMap<String, Object>();
	 * params.put("cateEn", cateEn); params.put("imageIndex", imageIndex);
	 * List<FurnitureDTO> Lists = livingDao.cateEImageList(params);
	 * 
	 * FurnitureDTO dto = livingDao.getReadData(imageIndex, cateEn);
	 * System.out.println("test 입니다 " + dto.getSaveFileName());
	 * mav.setViewName("living_sideTable_details"); mav.addObject("dto", dto);
	 * mav.addObject("lists", Lists);
	 * 
	 * return mav; }
	 * 
	 * // --------------------------------------------------------------------- //
	 * 티비 장
	 * 
	 * @RequestMapping(value = "/living_TV.fu", method = { RequestMethod.GET,
	 * RequestMethod.POST }) public ModelAndView living_TV(HttpServletRequest
	 * request, HttpServletResponse response, String cateEn) {
	 * 
	 * ModelAndView mav = new ModelAndView(); System.out.println(cateEn);
	 * HashMap<String, Object> livingMap = new HashMap<String, Object>();
	 * livingMap.put("cateEn", cateEn); System.out.println(cateEn);
	 * 
	 * List<FurnitureDTO> lists = livingDao.cateEImageList(livingMap);
	 * mav.setViewName("living_TV"); mav.addObject("lists", lists);
	 * 
	 * return mav; }
	 * 
	 * @RequestMapping(value = "/living_TV_details.fu", method = {
	 * RequestMethod.GET, RequestMethod.POST }) public ModelAndView
	 * living_TV_details(HttpServletRequest request, int imageIndex, String cateEn)
	 * {
	 * 
	 * ModelAndView mav = new ModelAndView();
	 * 
	 * 
	 * int imageIndex = Integer.parseInt(request.getParameter("imageIndex")); String
	 * cateE = request.getParameter("cateE");
	 * 
	 * 
	 * HashMap<String, Object> params = new HashMap<String, Object>();
	 * params.put("cateEn", cateEn); params.put("imageIndex", imageIndex);
	 * List<FurnitureDTO> Lists = livingDao.cateEImageList(params);
	 * 
	 * FurnitureDTO dto = livingDao.getReadData(imageIndex, cateEn);
	 * System.out.println("test 입니다 " + dto.getSaveFileName());
	 * mav.setViewName("living_TV_details"); mav.addObject("dto", dto);
	 * mav.addObject("lists", Lists);
	 * 
	 * return mav; }
	 * 
	 * // --------------------------------------------------------------------- //
	 * 선반
	 * 
	 * @RequestMapping(value = "/living_shelf.fu", method = { RequestMethod.GET,
	 * RequestMethod.POST }) public ModelAndView living_shelf(HttpServletRequest
	 * request, HttpServletResponse response, String cateEn) {
	 * 
	 * ModelAndView mav = new ModelAndView(); System.out.println(cateEn);
	 * HashMap<String, Object> livingMap = new HashMap<String, Object>();
	 * livingMap.put("cateEn", cateEn); System.out.println(cateEn);
	 * 
	 * List<FurnitureDTO> lists = livingDao.cateEImageList(livingMap);
	 * mav.setViewName("living_shelf"); mav.addObject("lists", lists);
	 * 
	 * return mav; }
	 * 
	 * @RequestMapping(value = "/living_shelf_details.fu", method = {
	 * RequestMethod.GET, RequestMethod.POST }) public ModelAndView
	 * living_shelf_details(HttpServletRequest request, int imageIndex, String
	 * cateEn) {
	 * 
	 * ModelAndView mav = new ModelAndView();
	 * 
	 * 
	 * int imageIndex = Integer.parseInt(request.getParameter("imageIndex")); String
	 * cateE = request.getParameter("cateE");
	 * 
	 * 
	 * HashMap<String, Object> params = new HashMap<String, Object>();
	 * params.put("cateEn", cateEn); params.put("imageIndex", imageIndex);
	 * List<FurnitureDTO> Lists = livingDao.cateEImageList(params);
	 * 
	 * FurnitureDTO dto = livingDao.getReadData(imageIndex, cateEn);
	 * System.out.println("test 입니다 " + dto.getSaveFileName());
	 * mav.setViewName("living_shelf_details"); mav.addObject("dto", dto);
	 * mav.addObject("lists", Lists);
	 * 
	 * return mav; }
	 * 
	 * // --------------------------------------------------------------------- //
	 * 북케이스
	 * 
	 * @RequestMapping(value = "/living_bookcase.fu", method = { RequestMethod.GET,
	 * RequestMethod.POST }) public ModelAndView living_bookcase(HttpServletRequest
	 * request, HttpServletResponse response, String cateEn) {
	 * 
	 * ModelAndView mav = new ModelAndView(); System.out.println(cateEn);
	 * HashMap<String, Object> livingMap = new HashMap<String, Object>();
	 * livingMap.put("cateEn", cateEn); System.out.println(cateEn);
	 * 
	 * List<FurnitureDTO> lists = livingDao.cateEImageList(livingMap);
	 * mav.setViewName("living_bookcase"); mav.addObject("lists", lists);
	 * 
	 * return mav; }
	 * 
	 * @RequestMapping(value = "/living_bookcase_details.fu", method = {
	 * RequestMethod.GET, RequestMethod.POST }) public ModelAndView
	 * living_bookcase_details(HttpServletRequest request, int imageIndex, String
	 * cateEn) {
	 * 
	 * ModelAndView mav = new ModelAndView();
	 * 
	 * 
	 * int imageIndex = Integer.parseInt(request.getParameter("imageIndex")); String
	 * cateE = request.getParameter("cateE");
	 * 
	 * 
	 * HashMap<String, Object> params = new HashMap<String, Object>();
	 * params.put("cateEn", cateEn); params.put("imageIndex", imageIndex);
	 * List<FurnitureDTO> Lists = livingDao.cateEImageList(params);
	 * 
	 * FurnitureDTO dto = livingDao.getReadData(imageIndex, cateEn);
	 * System.out.println("test 입니다 " + dto.getSaveFileName());
	 * mav.setViewName("living_bookcase_details"); mav.addObject("dto", dto);
	 * mav.addObject("lists", Lists);
	 * 
	 * return mav; }
	 * 
	 * // -------------------------------------- // <침실파트> // 침실 total
	 * 
	 * @RequestMapping(value = "/bed_total.fu", method = { RequestMethod.GET,
	 * RequestMethod.POST }) public ModelAndView bed_total(HttpServletRequest
	 * request) throws Exception {
	 * 
	 * ModelAndView mav = new ModelAndView();
	 * 
	 * List<FurnitureDTO> lists = bedDao.bedImageList(); //
	 * System.out.println("lists"+lists.size()); mav.setViewName("bed_total");
	 * mav.addObject("lists", lists);
	 * 
	 * return mav; }
	 * 
	 * @RequestMapping(value = "/bed_bed.fu", method = { RequestMethod.GET,
	 * RequestMethod.POST }) public ModelAndView bed_bed(HttpServletRequest request,
	 * HttpServletResponse response, String cateEn) {
	 * 
	 * ModelAndView mav = new ModelAndView(); System.out.println(cateEn);
	 * HashMap<String, Object> bedMap = new HashMap<String, Object>();
	 * bedMap.put("cateEn", cateEn); List<FurnitureDTO> bedlists =
	 * bedDao.cateEImageList(bedMap); mav.setViewName("bed_bed");
	 * mav.addObject("Blists", bedlists);
	 * 
	 * return mav;
	 * 
	 * }
	 * 
	 * @RequestMapping(value = "/bed_BED_details.fu", method = { RequestMethod.GET,
	 * RequestMethod.POST }) public ModelAndView bed_BED_details(HttpServletRequest
	 * request, int imageIndex, String cateEn) {
	 * 
	 * ModelAndView mav = new ModelAndView();
	 * 
	 * 
	 * int imageIndex = Integer.parseInt(request.getParameter("imageIndex")); String
	 * cateE = request.getParameter("cateE");
	 * 
	 * 
	 * HashMap<String, Object> params = new HashMap<String, Object>();
	 * params.put("cateEn", cateEn); params.put("imageIndex", imageIndex);
	 * System.out.println(""); List<FurnitureDTO> Lists =
	 * bedDao.cateEImageList(params);
	 * 
	 * FurnitureDTO dto = bedDao.getReadData(imageIndex, cateEn);
	 * System.out.println("test 입니다 " + dto.getSaveFileName());
	 * mav.setViewName("bed_BED_details"); mav.addObject("dto", dto);
	 * mav.addObject("Blists", Lists);
	 * 
	 * return mav; }
	 * 
	 * // ----------------------------------------------------------
	 * 
	 * @RequestMapping(value = "/bed_ht.fu", method = { RequestMethod.GET,
	 * RequestMethod.POST }) public ModelAndView bed_ht(Locale locale, Model model,
	 * String cateEn) {
	 * 
	 * ModelAndView mav = new ModelAndView(); System.out.println(cateEn);
	 * HashMap<String, Object> bedMap = new HashMap<String, Object>();
	 * bedMap.put("cateEn", cateEn); List<FurnitureDTO> bedlists =
	 * bedDao.cateEImageList(bedMap); mav.setViewName("bed_ht");
	 * mav.addObject("Blists", bedlists);
	 * 
	 * return mav; }
	 * 
	 * @RequestMapping(value = "/bed_ht_details.fu", method = { RequestMethod.GET,
	 * RequestMethod.POST }) public ModelAndView bed_ht_details(HttpServletRequest
	 * request, int imageIndex, String cateEn) {
	 * 
	 * ModelAndView mav = new ModelAndView();
	 * 
	 * HashMap<String, Object> params = new HashMap<String, Object>();
	 * params.put("cateEn", cateEn); params.put("imageIndex", imageIndex);
	 * 
	 * List<FurnitureDTO> bLists = bedDao.cateEImageList(params); FurnitureDTO dto =
	 * bedDao.getReadData(imageIndex, cateEn); System.out.println("test 입니다 " +
	 * dto.getSaveFileName()); mav.setViewName("bed_ht_details");
	 * mav.addObject("dto", dto); mav.addObject("Blists", bLists);
	 * 
	 * return mav; }
	 * 
	 * // ----------------------------------------------------------
	 * 
	 * @RequestMapping(value = "/bed_dressingTable.fu", method = {
	 * RequestMethod.GET, RequestMethod.POST }) public ModelAndView
	 * bed_dressingTable(Locale locale, Model model, String cateEn) {
	 * 
	 * ModelAndView mav = new ModelAndView(); System.out.println(cateEn);
	 * HashMap<String, Object> bedMap = new HashMap<String, Object>();
	 * bedMap.put("cateEn", cateEn); List<FurnitureDTO> bedlists =
	 * bedDao.cateEImageList(bedMap); mav.setViewName("bed_dressingTable");
	 * mav.addObject("Blists", bedlists);
	 * 
	 * return mav;
	 * 
	 * }
	 * 
	 * @RequestMapping(value = "/bed_dressingTable_details.fu", method = {
	 * RequestMethod.GET, RequestMethod.POST }) public ModelAndView
	 * bed_dressingTable_details(HttpServletRequest request, int imageIndex, String
	 * cateEn) {
	 * 
	 * ModelAndView mav = new ModelAndView();
	 * 
	 * HashMap<String, Object> params = new HashMap<String, Object>();
	 * params.put("cateEn", cateEn); params.put("imageIndex", imageIndex);
	 * 
	 * List<FurnitureDTO> bedlists = bedDao.cateEImageList(params);
	 * 
	 * FurnitureDTO dto = bedDao.getReadData(imageIndex, cateEn);
	 * System.out.println("test 입니다 " + dto.getSaveFileName());
	 * mav.setViewName("bed_dressingTable_details"); mav.addObject("dto", dto);
	 * mav.addObject("Blists", bedlists);
	 * 
	 * return mav; }
	 * 
	 * // ----------------------------------------------------------
	 * 
	 * @RequestMapping(value = "/bed_chiff.fu", method = { RequestMethod.GET,
	 * RequestMethod.POST }) public ModelAndView bed_chiff(Locale locale, Model
	 * model, String cateEn) {
	 * 
	 * ModelAndView mav = new ModelAndView(); System.out.println(cateEn);
	 * HashMap<String, Object> bedMap = new HashMap<String, Object>();
	 * bedMap.put("cateEn", cateEn); List<FurnitureDTO> bedlists =
	 * bedDao.cateEImageList(bedMap); mav.setViewName("bed_chiff");
	 * mav.addObject("Blists", bedlists);
	 * 
	 * return mav; }
	 * 
	 * @RequestMapping(value = "/bed_chiff_details.fu", method = {
	 * RequestMethod.GET, RequestMethod.POST }) public ModelAndView
	 * bed_chiff_details(HttpServletRequest request, int imageIndex, String cateEn)
	 * {
	 * 
	 * ModelAndView mav = new ModelAndView();
	 * 
	 * HashMap<String, Object> params = new HashMap<String, Object>();
	 * params.put("cateEn", cateEn); params.put("imageIndex", imageIndex);
	 * System.out.println(""); List<FurnitureDTO> Lists =
	 * bedDao.cateEImageList(params);
	 * 
	 * FurnitureDTO dto = bedDao.getReadData(imageIndex, cateEn);
	 * System.out.println("test 입니다 " + dto.getSaveFileName());
	 * mav.setViewName("bed_chiff_details"); mav.addObject("dto", dto);
	 * mav.addObject("Blists", Lists);
	 * 
	 * return mav; }
	 */

	@RequestMapping(value = "/event_list.fu", method = RequestMethod.GET)
	public String event_list(Locale locale, Model model) {
		return "event/event_list";
	}

//	@RequestMapping(value = "/event_2.fu", method = RequestMethod.GET)
//	public String event_2(Locale locale, Model model) {
//		return "event/event_2";
//	}
//
//	@RequestMapping(value = "/event_3.fu", method = RequestMethod.GET)
//	public String event_3(Locale locale, Model model) {
//		return "event/event_3";
//	}
//
//	@RequestMapping(value = "/event_4.fu", method = RequestMethod.GET)
//	public String event_4(Locale locale, Model model) {
//		return "event/event_4";
//	}

	@RequestMapping(value = "/event_5.fu", method = RequestMethod.GET)
	public String event_5(Locale locale, Model model) {
		return "event/event_5";
	}

	// payment part
	@RequestMapping(value = "/payment.fu", method = RequestMethod.GET)
	public String payment(Locale locale, Model model) {
		return "payment";
	}

	// 장바구니
	@RequestMapping(value = "/cart.fu", method = RequestMethod.GET)
	public String cart(Locale locale, Model model) {

		return "cart/cart";
	}

	// wishList part
	@RequestMapping(value = "/wishlist.fu", method = RequestMethod.GET)
	public String wishlist(Locale locale, Model model, HttpServletRequest request, HttpSession session) {

		Map<String, String> wishitem;

		if (request.getParameter("cate") == null || request.getParameter("cate").equals("")) {
		} else {

			System.out.println(request.getParameter("cate") + ":" + request.getParameter("imageIndex"));

			if (session.getAttribute("wishitem") == null) {
				wishitem = new HashMap<String, String>();
			} else {
				wishitem = (HashMap<String, String>) session.getAttribute("wishitem");
			}

			wishitem.put(request.getParameter("cate") + "," + request.getParameter("imageIndex"),
					request.getParameter("price") + "," + request.getParameter("imagetype"));
			session.setAttribute("wishitem", wishitem);

		}

		wishitem = (HashMap<String, String>) session.getAttribute("wishitem");
		request.setAttribute("wishitem", wishitem);

		return "wishlist";
	}

	@RequestMapping(value = "/deletewishlist.fu", method = RequestMethod.GET)
	public String deletewishlist(Locale locale, Model model, HttpServletRequest request, HttpSession session) {

		System.out.println(request.getParameter("id"));

		Map<String, String> wishitem;

		if (session.getAttribute("wishitem") == null) {
			wishitem = new HashMap<String, String>();
		} else {
			wishitem = (HashMap<String, String>) session.getAttribute("wishitem");
		}

		wishitem.remove(request.getParameter("id"));
		session.setAttribute("wishitem", wishitem);

		return "redirect:/wishlist.fu";
	}

}
