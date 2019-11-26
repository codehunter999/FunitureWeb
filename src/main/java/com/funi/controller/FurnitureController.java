package com.funi.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.funi.dao.BedDAO;
import com.funi.dao.DiningDAO;
import com.funi.dao.MemberDAO;
import com.funi.dao.QnADAO;
import com.funi.dao.ReviewDAO;
import com.funi.domain.MemberDTO;
import com.funi.dto.QnADTO;
import com.funi.dto.Re_QnADTO;
import com.funi.dto.Re_ReviewDTO;
import com.funi.dto.ReviewDTO;
import com.funi.domain.FurnitureDTO;
import com.funi.util.MyUtil;
import com.funi.util.MyUtil1;


@Controller
public class FurnitureController {

	@Autowired
	@Qualifier("memberdao")
	MemberDAO memberdao;

	@Autowired
	@Qualifier("BedDAO")
	BedDAO bedDao;

	@Autowired
	@Qualifier("diningdao")
	DiningDAO diningdao;

	

	@Autowired
	@Qualifier("myUtil")
	MyUtil myUtil;

	@Autowired
	@Qualifier("myUtil1")
	MyUtil1 myUtil1;
	
	@Autowired
	@Qualifier("ReviewDAO")
	ReviewDAO reviewdao;
	
	@Autowired
	@Qualifier("QnADAO")
	QnADAO qnadao;


	//HOME PART
	@RequestMapping(value = "/home.fu", method = RequestMethod.GET)
	public String home1(Locale locale, Model model) {

		return "index";
	}

	@RequestMapping(value = "/home2.fu", method = RequestMethod.GET)
	public String home2(Locale locale, Model model) {
		return "index-02";
	}

	//login-register
	@RequestMapping(value = "/login.fu", method = RequestMethod.GET)
	public ModelAndView login(Locale locale, Model model,String message) {
		
		ModelAndView loginmav = new ModelAndView();
		loginmav.setViewName("member/login");
		
		if(message != null) {
			loginmav.addObject("message",message);
		}
		
		return loginmav;
	}

	@RequestMapping(value = "/login_ok.fu", method = RequestMethod.POST)
	public ModelAndView login_ok(HttpServletRequest request, Model model,MemberDTO paramdto) {
		
		ModelAndView loginmav = new ModelAndView();
		MemberDTO memberdto = null;
		try {
			boolean flag = memberdao.searchID(paramdto.getEmail());
			String message = null;
			if(!flag) {
				message = "회원 정보를 찾을수 없습니다.";
				loginmav.addObject("message",message);
				loginmav.setViewName("member/login");
				return loginmav;
			}
			
			memberdto = memberdao.searchMember(paramdto.getEmail());
			
			System.out.println("memberdto getPwd () : "+memberdto.getPwd());
			System.out.println("paramdto  getPwd () : "+paramdto.getPwd());
			System.out.println("if 첫번째 조건 : "+ !memberdto.getPwd().equals(paramdto.getPwd()));
		
			if(!memberdto.getPwd().equals(paramdto.getPwd())) {
				message = "계정 패스워드를 확인해주세요.";
				loginmav.addObject("message",message);
				loginmav.setViewName("member/login");
				System.out.println("여기 통과하면 안됨 ");
				System.out.println("여기 통과하면 안됨 ");
				return loginmav;
			}	
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		HttpSession session = request.getSession();
		session.setAttribute("email",memberdto.getEmail());
		loginmav.setViewName("redirect:/home.fu");
		return loginmav;
	}
	@RequestMapping(value = "/logout.fu", method = RequestMethod.GET) 
	public ModelAndView logout(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws IOException {
		ModelAndView logoutmav = new ModelAndView();
		session.removeAttribute("email");
		logoutmav.setViewName("redirect:/login.fu");
		return logoutmav;
	}
	


	//회원가입
	@RequestMapping(value = "/register.fu", method = RequestMethod.GET) 
	public String register(Locale locale, Model model,HttpServletRequest request,HttpServletResponse response) throws IOException { 

		if(request.getParameter("emailcheck")!=null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('Email이 중복되었습니다.'); history.go(-1); </script>");
			writer.flush();
		}

		return "member/register"; 
	}

	@RequestMapping(value = "/register_ok.fu", method = {RequestMethod.GET,RequestMethod.POST}) 
	public String register_ok(MemberDTO dto,HttpServletRequest request,HttpServletResponse response) throws Exception {

		String phone1 = request.getParameter("phone1");	
		String phone2 = request.getParameter("phone2");	
		String phone = phone1 + phone2;		
		//dto.setPhone(phone);

		try {
			memberdao.insertData(dto);
		} 
		catch (Exception e) {
			System.out.println("Email이 중복되었습니다.");
			return "redirect:/register.fu?emailcheck=no"; 
		}
		return "redirect:/login.fu"; 
	}


	//COMPANY 
	@RequestMapping(value = "/company.fu", method = RequestMethod.GET)
	public String company(Locale locale, Model model) {
		return "company/company";
	}



	@RequestMapping(value = "/upload.fu", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView upload() {		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("upload");		
		return mav;
	}

	@RequestMapping(value = "/upload_ok.fu", method = {RequestMethod.GET, RequestMethod.POST})
	public String upload_ok(MultipartHttpServletRequest request, HttpServletResponse response, String str) {

		FurnitureDTO dto = new FurnitureDTO();

		MultipartFile file = request.getFile("bedupload");	
		dto.setImageIndex(Integer.parseInt(request.getParameter("imageIndex")));
		dto.setCateE(request.getParameter("cateE"));
		dto.setCateK(request.getParameter("cateK"));
		dto.setProductName(request.getParameter("productName"));
		dto.setPrice(Integer.parseInt(request.getParameter("price")));
		dto.setSaveFileName(file.getOriginalFilename());
		bedDao.insertBedData(dto);	
		//실제경로: D:\sts-bundle\work\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\HotelWebService\event
		Path path1 = Paths.get("D:\\sts-bundle\\work\\FurnitureWeb\\src\\main\\webapp\\resources\\images\\bedroom");			
		String path = request.getSession()
				.getServletContext()
				.getRealPath("/image/bed");
		System.out.println("패스"+path);
		if(file!=null&&file.getSize()>0) { //파일이 있으면
			try {
				FileOutputStream fos =
						new FileOutputStream(path +
								"/" + file.getOriginalFilename());
				InputStream is = file.getInputStream();
				byte[] buffer = new byte[512];
				while(true) {
					int data = is.read(buffer,0,buffer.length);
					if(data==-1) { 
						break; 
					}
					fos.write(buffer,0,data);
				}
				is.close();
				fos.close();

			} catch (Exception e) {
				System.out.println(e.toString());
			}
		}
		System.out.println("dto:"+dto);
		return "redirect:/upload.fu";
	}
	//이미지 업로드 컨트롤러
	@RequestMapping(value = "/diningupload.fu", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView eventupload() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("diningupload");
		return mav;
	}

	@RequestMapping(value = "/diningupload_ok.fu", method= {RequestMethod.GET,RequestMethod.POST})
	public String eventupload_ok(MultipartHttpServletRequest request, HttpServletResponse response, String str) {


		MultipartFile file = request.getFile("diningImageUpload");

		FurnitureDTO dto = new FurnitureDTO();

		dto.setImageIndex(Integer.parseInt(request.getParameter("imageIndex")));
		dto.setProductName(request.getParameter("productName"));
		dto.setCafe(request.getParameter("cate"));
		dto.setCafeEn(request.getParameter("cateEn"));
		dto.setPrice(Integer.parseInt(request.getParameter("price")));
		dto.setSaveFileName(file.getOriginalFilename());

		diningdao.insertData(dto);

		//실제경로: D:\sts-bundle\work\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\HotelWebService\event
		Path path1 = 
				Paths.get("D:\\sts-bundle\\work\\FurnitureWeb\\src\\main\\webapp\\resources\\images\\dining");


		String path = 
				request.getSession()
				.getServletContext()
				.getRealPath("/image/dining");


		if(file!=null&&file.getSize()>0) { //파일이 있으면

			try {

				FileOutputStream fos =
						new FileOutputStream(path +
								"/" + file.getOriginalFilename());
				InputStream is = file.getInputStream();

				byte[] buffer = new byte[512];

				while(true) {

					int data = is.read(buffer,0,buffer.length);

					if(data==-1) { 
						break; 

					}
					fos.write(buffer,0,data);
				}
				is.close();
				fos.close();

			} catch (Exception e) {
				System.out.println(e.toString());
			}
		}
		System.out.println("dto:"+dto);
		return "redirect:/diningupload.fu";
	}



	//제품 파트
	@RequestMapping(value = "/diningfull.fu", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView diningfull(HttpServletRequest request) throws Exception{

		//		//페이징처리
		//		String cp = request.getContextPath();
		//		
		//		String pageNum = request.getParameter("pageNum");
		//		int currentPage = 1;
		//		
		//		if(pageNum != null)
		//			currentPage = Integer.parseInt(pageNum);
		//		
		//		String searchKey = request.getParameter("searchKey");
		//		String searchValue = request.getParameter("searchValue");
		//		
		//		if(searchKey == null){
		//			
		//			searchKey = "subject";
		//			searchValue = "";
		//			
		//		}else{
		//			
		//			if(request.getMethod().equalsIgnoreCase("GET"))
		//				searchValue =
		//					URLDecoder.decode(searchValue, "UTF-8");
		//			
		//		}
		//		
		//		//전체데이터갯수
		//		int dataCount = diningdao.getDataCount();
		//		
		//		//전체페이지수
		//		int numPerPage = 10;
		//		int totalPage = myUtil.getPageCount(numPerPage, dataCount);
		//		
		//		if(currentPage > totalPage)
		//			currentPage = totalPage;
		//		
		//		int start = (currentPage-1)*numPerPage+1;
		//		int end = currentPage*numPerPage;
		//		
		//		//페이징 처리
		//		String param = "";
		//		if(!searchValue.equals("")){
		//			param = "searchKey=" + searchKey;
		//			param+= "&searchValue=" 
		//				+ URLEncoder.encode(searchValue, "UTF-8");
		//		}
		//		
		//		String listUrl = cp + "/list.action";
		//		if(!param.equals("")){
		//			listUrl = listUrl + "?" + param;				
		//		}
		//		
		//		String pageIndexList =
		//			myUtil.pageIndexList(currentPage, totalPage, listUrl);
		/////////////////////////////////////////////////////////////////

		ModelAndView mav = new ModelAndView();

		List<FurnitureDTO> lists = diningdao.getLists();
		//System.out.println("lists"+lists.size());
		mav.setViewName("diningfull");
		mav.addObject("lists", lists);

		return mav;

	}

	@RequestMapping(value = "/dining_sunbrella.fu", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView dining_sunbrella(HttpServletRequest request) {

		ModelAndView mav = new ModelAndView();

		String cate = request.getParameter("cate");

		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("cate", cate);

		List<FurnitureDTO> catelists = diningdao.getCateLists(params);

		mav.setViewName("dining_sunbrella");
		mav.addObject("catelists", catelists);

		return mav;
	}

	@RequestMapping(value = "/dining_sunbrella_details.fu", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView dining_sunbrella_details(HttpServletRequest request) {

		ModelAndView mav = new ModelAndView();

		int imageIndex = Integer.parseInt(request.getParameter("imageIndex"));
		String cate = request.getParameter("cate");

		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("cate", cate);

		List<FurnitureDTO> catelists = diningdao.getCateLists(params);

		FurnitureDTO dto = diningdao.getReadData(imageIndex,cate);

		mav.setViewName("dining_sunbrella_details");
		mav.addObject("dto", dto);
		mav.addObject("catelists", catelists);

		return mav;
	}

	@RequestMapping(value = "/dining_clean.fu", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView dining_clean(HttpServletRequest request) {

		ModelAndView mav = new ModelAndView();

		String cate = request.getParameter("cate");

		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("cate", cate);

		List<FurnitureDTO> catelists = diningdao.getCateLists(params);

		mav.setViewName("dining_clean");
		mav.addObject("catelists", catelists);

		return mav;
	}

	@RequestMapping(value = "/dining_clean_details.fu", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView dining_clean_details(HttpServletRequest request) {

		ModelAndView mav = new ModelAndView();

		int imageIndex = Integer.parseInt(request.getParameter("imageIndex"));
		String cate = request.getParameter("cate");

		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("cate", cate);

		List<FurnitureDTO> catelists = diningdao.getCateLists(params);

		FurnitureDTO dto = diningdao.getReadData(imageIndex,cate);

		mav.setViewName("dining_clean_details");
		mav.addObject("dto", dto);
		mav.addObject("catelists", catelists);

		return mav;
	}

	@RequestMapping(value = "/dining_rnl.fu", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView dining_rnl(HttpServletRequest request) {

		ModelAndView mav = new ModelAndView();

		String cate = request.getParameter("cate");

		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("cate", cate);

		List<FurnitureDTO> catelists = diningdao.getCateLists(params);

		mav.setViewName("dining_rnl");
		mav.addObject("catelists", catelists);

		return mav;
	}

	@RequestMapping(value = "/dining_rnl_details.fu", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView dining_rnl_details(HttpServletRequest request) {

		ModelAndView mav = new ModelAndView();

		int imageIndex = Integer.parseInt(request.getParameter("imageIndex"));
		String cate = request.getParameter("cate");

		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("cate", cate);

		List<FurnitureDTO> catelists = diningdao.getCateLists(params);

		FurnitureDTO dto = diningdao.getReadData(imageIndex,cate);

		mav.setViewName("dining_rnl_details");
		mav.addObject("dto", dto);
		mav.addObject("catelists", catelists);

		return mav;
	}

	@RequestMapping(value = "/dining_table.fu", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView dining_table(HttpServletRequest request) {

		ModelAndView mav = new ModelAndView();

		String cate = request.getParameter("cate");

		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("cate", cate);

		List<FurnitureDTO> catelists = diningdao.getCateLists(params);

		mav.setViewName("dining_table");
		mav.addObject("catelists", catelists);

		return mav;
	}

	@RequestMapping(value = "/dining_table_details.fu", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView dining_table_details(HttpServletRequest request) {

		ModelAndView mav = new ModelAndView();		
		int imageIndex = Integer.parseInt(request.getParameter("imageIndex"));
		String cate = request.getParameter("cate");		
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("cate", cate);	
		List<FurnitureDTO> catelists = diningdao.getCateLists(params);	
		FurnitureDTO dto = diningdao.getReadData(imageIndex,cate);
		mav.setViewName("dining_table_details");
		mav.addObject("dto", dto);
		mav.addObject("catelists", catelists);

		return mav;
	}

	@RequestMapping(value = "/dining_chair.fu", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView dining_chair(HttpServletRequest request) {

		ModelAndView mav = new ModelAndView();

		String cate = request.getParameter("cate");

		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("cate", cate);

		List<FurnitureDTO> catelists = diningdao.getCateLists(params);

		mav.setViewName("dining_chair");
		mav.addObject("catelists", catelists);

		return mav;
	}

	@RequestMapping(value = "/dining_deco.fu", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView dining_deco(HttpServletRequest request) {

		ModelAndView mav = new ModelAndView();

		String cate = request.getParameter("cate");

		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("cate", cate);

		List<FurnitureDTO> catelists = diningdao.getCateLists(params);

		mav.setViewName("dining_deco");
		mav.addObject("catelists", catelists);

		return mav;
	}

	@RequestMapping(value = "/dining_desk.fu", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView dining_desk(HttpServletRequest request) {

		ModelAndView mav = new ModelAndView();

		String cate = request.getParameter("cate");

		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("cate", cate);

		List<FurnitureDTO> catelists = diningdao.getCateLists(params);

		mav.setViewName("dining_desk");
		mav.addObject("catelists", catelists);

		return mav;
	}

	//홈데코 페이지 컨트롤러
	@RequestMapping(value = "/decofull.fu", method = {RequestMethod.GET,RequestMethod.POST})
	public String decofull() {

		//		
		//		  ModelAndView mav = new ModelAndView();
		//		  
		//		  List<FurnitureDTO> lists = decodao.getLists();
		//		  //System.out.println("lists"+lists.size()); mav.setViewName("decofull");
		//		  mav.addObject("lists", lists);
		//		  
		//		  return mav;
		return "decofull";


	}
	@RequestMapping(value = "/deco_monthly.fu", method = RequestMethod.GET)
	public String deco_monthly(Locale locale, Model model) {
		return "deco_monthly";
	}

	@RequestMapping(value = "/deco_light.fu", method = RequestMethod.GET)
	public String deco_light(Locale locale, Model model) {
		return "deco_light";
	}

	@RequestMapping(value = "/deco_plasticch.fu", method = RequestMethod.GET)
	public String deco_plasticch(Locale locale, Model model) {
		return "deco_plasticch";
	}



	//지점안내
	@RequestMapping(value = "/blog.fu", method = {RequestMethod.GET,RequestMethod.POST})
	public String blog(Locale locale, Model model,HttpServletRequest request) {	
		String location = request.getParameter("location");
		System.out.println("location : "+location);
		if(location.equals("Gangnam")) {
			return "location/blog_GangNam";
		}
		if(location.equals("Hongdae")) {
			return "location/blog_Hongdae";
		}
		if(location.equals("MogDong")) {
			return "location/blog_MogDong";
		}
		if(location.equals("Hanam")) {
			return "location/blog_Hanam";
		}		
		if(location.equals("BunDang")) {
			return "location/blog_BunDang";
		}
		if(location.equals("Dongtan")) {
			return "location/blog_Dongtan";
		}	
		if(location.equals("Anyang")) {
			return "location/blog_Anyang";
		}
		if(location.equals("Pyeongtaek")) {
			return "location/blog_Pyeongtaek";
		}
		return "location/blog_GanNam";
	}


	
	//REVIEW PART
	



	//EVENT PART
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


	
	//REVIEW PART
		@RequestMapping(value = "/qnamain.fu", method = {RequestMethod.GET,RequestMethod.POST})
		public String qnamain(HttpServletRequest request,Locale locale, Model model) {
			String cp=request.getContextPath();
			String pageNum = request.getParameter("pageNum");
			int currentPage = 1;
			
			if(pageNum != null)
				currentPage = Integer.parseInt(pageNum);
			
			
			//전체데이터갯수
			int dataCount = qnadao.getDataCount();

			//전체페이지수
			int numPerPage = 5;
			int totalPage = myUtil.getPageCount(numPerPage, dataCount);

			if(currentPage > totalPage)
				currentPage = totalPage;
			
			int start = (currentPage-1)*numPerPage+1;
			int end = currentPage*numPerPage;
			List<QnADTO> lists =
					qnadao.getList(start, end);
			
			String listUrl = cp + "/qnamain.fu";
			
			String pageIndexList =
				myUtil1.pageIndexList(currentPage, totalPage, listUrl);
			
			//글보기 주소 정리
			String articleUrl = 
				cp + "/qnamain.fu?pageNum=" + currentPage;
				
			//포워딩 될 페이지에 데이터를 넘긴다
			request.setAttribute("lists", lists);
			request.setAttribute("pageIndexList",pageIndexList);
			request.setAttribute("dataCount",dataCount);
			request.setAttribute("articleUrl",articleUrl);
			
			return "qna/qnamain";
		}
		
		@RequestMapping(value = "/qnawrite.fu", method = {RequestMethod.GET,RequestMethod.POST})
		public String qnawrite(QnADTO dto,HttpServletRequest request,Locale locale, Model model,HttpSession session) {
			
			 dto.setId(qnadao.getMAXID()+1);
			  dto.setIpaddr(request.getRemoteAddr());
			 dto.setName("홍길동");
			 
			 qnadao.insertData(dto);
			 
			return "redirect:/qnamain.fu";
		}
		
		
		@RequestMapping(value = "/qnaarticle.fu", method = {RequestMethod.GET,RequestMethod.POST})
		public String qnaview(HttpServletRequest request,Locale locale, Model model) {
			QnADTO dto=qnadao.getReadData(Integer.valueOf(request.getParameter("id")));
			request.setAttribute("dto", dto);
			List<Re_QnADTO> lists =
					qnadao.Re_getList(dto.getId());
			request.setAttribute("lists", lists);
			return "qna/qnaarticle";
		}
		
		@RequestMapping(value = "/qnaarticlewrite.fu", method = {RequestMethod.GET,RequestMethod.POST})
		public String qnaview_write(Re_QnADTO dto,HttpServletRequest request,Locale locale, Model model) {
			dto.setId(qnadao.getRe_MAXID()+1);
			dto.setIpaddr(request.getRemoteAddr());
			dto.setName("홍길동");
			dto.setQaboard_id(Integer.valueOf(request.getParameter("qaboard_id")));
			qnadao.Re_insertData(dto);
			QnADTO reviewdto=qnadao.getReadData(Integer.valueOf(request.getParameter("qaboard_id")));
			request.setAttribute("dto", reviewdto);
			List<Re_QnADTO> lists =
					qnadao.Re_getList(Integer.valueOf(request.getParameter("qaboard_id")));
			request.setAttribute("lists", lists);
			return "qna/qnaarticle";
		}
		
		@RequestMapping(value = "/qnadelete.fu", method = {RequestMethod.GET,RequestMethod.POST})
		public String qnadelete(HttpServletRequest request,Locale locale, Model model) {
			qnadao.deleteData(Integer.valueOf(request.getParameter("id")));
			return "redirect:/qnamain.fu";
		}
		
		@RequestMapping(value = "/qnarewrite.fu", method = {RequestMethod.GET,RequestMethod.POST})
		public String qnawirte(HttpServletRequest request,Locale locale, Model model) {
			QnADTO dto=qnadao.getReadData(Integer.valueOf(request.getParameter("id")));
			request.setAttribute("dto", dto);
			List<Re_QnADTO> lists =
					qnadao.Re_getList(dto.getId());
			request.setAttribute("lists", lists);
			return "qna/qnaarticle";
		}
		@RequestMapping(value = "/qnarewrite_ok.fu", method = {RequestMethod.GET,RequestMethod.POST})
		public String qnawirte_ok(QnADTO redto,HttpServletRequest request,Locale locale, Model model) {
			redto.setId(Integer.valueOf(request.getParameter("id")));
			qnadao.updateData(redto);
			QnADTO dto=qnadao.getReadData(Integer.valueOf(request.getParameter("id")));
			request.setAttribute("dto", dto);
			List<Re_QnADTO> lists =
					qnadao.Re_getList(dto.getId());
			request.setAttribute("lists", lists);
			return "qna/qnaarticle";
		}
		
		
		@RequestMapping(value = "/reviewmain.fu", method = {RequestMethod.GET,RequestMethod.POST})
		public String reviewmain(HttpServletRequest request,Locale locale, Model model) {
			String cp=request.getContextPath();
			String pageNum = request.getParameter("pageNum");
			int currentPage = 1;
			
			if(pageNum != null)
				currentPage = Integer.parseInt(pageNum);
			
			
			//전체데이터갯수
			int dataCount = reviewdao.getDataCount();

			//전체페이지수
			int numPerPage = 5;
			int totalPage = myUtil.getPageCount(numPerPage, dataCount);

			if(currentPage > totalPage)
				currentPage = totalPage;
			
			int start = (currentPage-1)*numPerPage+1;
			int end = currentPage*numPerPage;
			List<ReviewDTO> lists =
				reviewdao.getList(start, end);
			
			String listUrl = cp + "/reviewmain.fu";
			
			String pageIndexList =
				myUtil1.pageIndexList(currentPage, totalPage, listUrl);
			
			//글보기 주소 정리
			String articleUrl = 
				cp + "/reviewmain.fu?pageNum=" + currentPage;
				
			//포워딩 될 페이지에 데이터를 넘긴다
			request.setAttribute("lists", lists);
			request.setAttribute("pageIndexList",pageIndexList);
			request.setAttribute("dataCount",dataCount);
			request.setAttribute("articleUrl",articleUrl);
			
			return "review/reviewmain";
		}
		
		@RequestMapping(value = "/reviewwrite.fu", method = {RequestMethod.GET,RequestMethod.POST})
		public String reviewwrite(ReviewDTO dto,MultipartHttpServletRequest request,Locale locale, Model model,HttpSession session) {
			System.out.println("컨트롤 접속"+reviewdao.getMAXID());
			
			 dto.setId(reviewdao.getMAXID()+1);
			  dto.setIpaddr(request.getRemoteAddr());
			 dto.setName("홍길동");
			 //String path="D:/sts-bundle/work/FurnitureWeb/src/main/webapp/resources/assets/img/save";
			 String path = "d:/file";
			 //String path="D:/sts-bundle/work/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/FurnitureWeb/files";
			 MultipartFile file=request.getFile("upload");
			 if(file!=null&&file.getSize()>0) {
			 try { FileOutputStream fos = new FileOutputStream(path + "/" + file.getOriginalFilename());
				 InputStream is=file.getInputStream();
				 byte[] buffer=new byte[512];
				 while(true) {
					 int data=is.read(buffer,0,buffer.length); 
					 if(data==-1) { break; }
					 fos.write(buffer,0,data);
				 } 
				 is.close(); 
				 fos.close(); 
			 } 
			 catch (Exception e) {
			 // TODO: handle exception 
				 System.out.println(e.toString()); } 
			 }else {
				 System.out.println("데이터가 없습니다.");
			 }
			 dto.setPhoto(file.getOriginalFilename()); 
			 reviewdao.insertData(dto);
			 
			return "redirect:/reviewmain.fu";
		}
		
		
		@RequestMapping(value = "/reviewarticle.fu", method = {RequestMethod.GET,RequestMethod.POST})
		public String reviewview(HttpServletRequest request,Locale locale, Model model) {
			ReviewDTO dto=reviewdao.getReadData(Integer.valueOf(request.getParameter("id")));
			request.setAttribute("dto", dto);
			List<Re_ReviewDTO> lists =
					reviewdao.Re_getList(dto.getId());
			request.setAttribute("lists", lists);
			return "review/reviewarticle";
		}
		
		@RequestMapping(value = "/reviewarticlewrite.fu", method = {RequestMethod.GET,RequestMethod.POST})
		public String reviewview_write(Re_ReviewDTO dto,HttpServletRequest request,Locale locale, Model model) {
			dto.setId(reviewdao.getRe_MAXID()+1);
			dto.setIpaddr(request.getRemoteAddr());
			dto.setName("홍길동");
			dto.setQaboard_id(Integer.valueOf(request.getParameter("qaboard_id")));
			reviewdao.Re_insertData(dto);
			ReviewDTO reviewdto=reviewdao.getReadData(Integer.valueOf(request.getParameter("qaboard_id")));
			request.setAttribute("dto", reviewdto);
			List<Re_ReviewDTO> lists =
					reviewdao.Re_getList(Integer.valueOf(request.getParameter("qaboard_id")));
			request.setAttribute("lists", lists);
			return "review/reviewarticle";
		}
		
		@RequestMapping(value = "/reviewdelete.fu", method = {RequestMethod.GET,RequestMethod.POST})
		public String reviewdelete(HttpServletRequest request,Locale locale, Model model) {
			reviewdao.deleteData(Integer.valueOf(request.getParameter("id")));
			return "redirect:/reviewmain.fu";
		}
		
		@RequestMapping(value = "/reviewrewrite.fu", method = {RequestMethod.GET,RequestMethod.POST})
		public String reviewrewirte(HttpServletRequest request,Locale locale, Model model) {
			ReviewDTO dto=reviewdao.getReadData(Integer.valueOf(request.getParameter("id")));
			request.setAttribute("dto", dto);
			List<Re_ReviewDTO> lists =
					reviewdao.Re_getList(dto.getId());
			request.setAttribute("lists", lists);
			return "review/reviewarticle";
		}
		@RequestMapping(value = "/reviewrewrite_ok.fu", method = {RequestMethod.GET,RequestMethod.POST})
		public String reviewrewirte_ok(ReviewDTO redto,HttpServletRequest request,Locale locale, Model model) {
			redto.setId(Integer.valueOf(request.getParameter("id")));
			reviewdao.updateData(redto);
			ReviewDTO dto=reviewdao.getReadData(Integer.valueOf(request.getParameter("id")));
			request.setAttribute("dto", dto);
			List<Re_ReviewDTO> lists =
					reviewdao.Re_getList(dto.getId());
			request.setAttribute("lists", lists);
			return "review/reviewarticle";
		}
	
	


	//payment part
	@RequestMapping(value = "/payment.fu", method = RequestMethod.GET)
	public String payment(Locale locale, Model model) {
		return "payment";
	}

	@RequestMapping(value = "/cart.fu", method = RequestMethod.GET)
	public String cart(Locale locale, Model model) {
		return "cart";
	}


}
