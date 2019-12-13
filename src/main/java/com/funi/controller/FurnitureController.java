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


	// EVENT PART
	@RequestMapping(value = "/event_list.fu", method = RequestMethod.GET)
	public String event_list(Locale locale, Model model) {
		return "event/event_list";
	}


	@RequestMapping(value = "/event_5.fu", method = RequestMethod.GET)
	public String event_5(Locale locale, Model model) {
		return "event/event_5";
	}

	// 카트 장바구니 
	@RequestMapping(value = "/cartlist.fu", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView cartList(Locale locale, Model model,HttpServletRequest request,HttpSession session) {			
			List cartlist = (List<String>)session.getAttribute("cartlist");
			System.out.println("cartlist session "+cartlist.get(0));
			ModelAndView cartlistmav = new ModelAndView();
			cartlistmav.addObject("catlist",cartlist);
			cartlistmav.setViewName("cart/cart");
			return cartlistmav;
	}
		// 카트 장바구니 
		@RequestMapping(value = "/cartlist_input.fu", method = {RequestMethod.GET,RequestMethod.POST})
		public String cartList_Input(Locale locale, Model model,HttpServletRequest request,HttpSession session) {			
			//session.invalidate();
			List<String> cartlist;	
			String data = request.getParameter("data").trim();				
			System.out.println("data 입니다."+data);
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
						System.out.println("이미 추가된 상품입니다. ");			
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
				return "cart/cart";
		}		
	
	@RequestMapping(value = "/deletecart.fu", method = RequestMethod.GET)
	public String deletecart(Locale locale, Model model,HttpServletRequest request,HttpSession session) {
		//Use List
		//session.invalidate();
		List cartlist;
		cartlist=(ArrayList<String>)session.getAttribute("cartlist");
		int id = Integer.parseInt(request.getParameter("id"));	
		System.out.println("cartlist.get(id) :" + cartlist.get(id));
		cartlist.remove(id);	
		session.setAttribute("cartlist", cartlist);		
		return "cart/cart";
	}
	
	@RequestMapping(value = "/removeAllcart.fu", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView RemoveAllCart(Locale locale, Model model,HttpServletRequest request,HttpSession session) {
		
		ModelAndView removemav = new ModelAndView();
		removemav.setViewName("redirect:/cartlist.fu");
		session.removeAttribute("cartlist");
		return removemav; 
	}
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

// @RequestMapping(value = "/event_2.fu", method = RequestMethod.GET)
// public String event_2(Locale locale, Model model) {
// return "event/event_2";
// }
//
// @RequestMapping(value = "/event_3.fu", method = RequestMethod.GET)
// public String event_3(Locale locale, Model model) {
// return "event/event_3";
// }
//
// @RequestMapping(value = "/event_4.fu", method = RequestMethod.GET)
// public String event_4(Locale locale, Model model) {
// return "event/event_4";
// }



