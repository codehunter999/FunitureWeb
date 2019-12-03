package com.funi.controller;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.funi.dao.DiningDAO;
import com.funi.domain.FurnitureDTO;
import com.funi.util.MyUtil;
import com.funi.util.MyUtil1;

@Controller
public class DiningController {

	@Autowired
	@Qualifier("diningdao")
	DiningDAO diningdao;

	@Autowired
	@Qualifier("myUtil1")
	MyUtil1 myUtil1;


	// 이미지 업로드 컨트롤러
	@RequestMapping(value = "/diningupload.fu", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView diningupload() {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("diningupload");

		return mav;
	}

	@RequestMapping(value = "/diningupload_ok.fu", method = { RequestMethod.GET, RequestMethod.POST })
	public String diningupload_ok(MultipartHttpServletRequest request, HttpServletResponse response, String str) {

		MultipartFile file = request.getFile("diningImageUpload");

		FurnitureDTO dto = new FurnitureDTO();
		dto.setImageIndex(Integer.parseInt(request.getParameter("imageIndex")));
		dto.setProductName(request.getParameter("productName"));
		dto.setCate(request.getParameter("cate"));
		dto.setCateEn(request.getParameter("cateEn"));
		dto.setPrice(Integer.parseInt(request.getParameter("price")));
		dto.setSaveFileName(file.getOriginalFilename());

		diningdao.insertData(dto);

		// 실제경로:
		// D:\sts-bundle\work\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\HotelWebService\event
		Path path1 = Paths.get("D:\\sts-bundle\\work\\FurnitureWeb\\src\\main\\webapp\\resources\\images\\dining");

		String path = request.getSession().getServletContext().getRealPath("/image/dining");

		if (file != null && file.getSize() > 0) { // 파일이 있으면

			try {

				FileOutputStream fos = new FileOutputStream(path + "/" + file.getOriginalFilename());

				InputStream is = file.getInputStream();

				byte[] buffer = new byte[58];

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

		return "redirect:/diningupload.fu";
	}




	@RequestMapping(value = "/diningfull.fu", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView diningfull(HttpServletRequest request) throws Exception{

		//페이징 & 검색
		String cp = request.getContextPath();

		String pageNum = request.getParameter("pageNum");
		
		int currentPage = 1;
		
		if(pageNum != null) {
			currentPage = Integer.parseInt(pageNum);
		}

		System.out.println("pageNum: " + pageNum);
		System.out.println("currentPage: " + currentPage);

		String searchValue = request.getParameter("searchValue");

		if(searchValue==null) {

			searchValue = "";

		}else{

			if(request.getMethod().equalsIgnoreCase("GET"))
				searchValue =
				URLDecoder.decode(searchValue, "UTF-8");

		}

		System.out.println("test searchValue: " + searchValue);

		//전체 데이터갯수
		int dataCount = diningdao.getDataCount(searchValue);

		System.out.println("number of all data: " + diningdao.getDataCount(searchValue)); //72

		//전체 페이지 수
		int numPerPage = 12;
		int totalPage = myUtil1.getPageCount(numPerPage, dataCount);

		if(currentPage > totalPage)
			currentPage = totalPage;

		int start = (currentPage-1)*numPerPage+1;
		int end = currentPage*numPerPage;
		
		List<FurnitureDTO> lists = diningdao.getLists(start,end,searchValue);
		
		System.out.println("size of lists:" + lists.size());

		//페이징 처리
		String param = "";
		if(!searchValue.equals("")){
			param= "searchValue=" 
					+ URLEncoder.encode(searchValue, "UTF-8");
		}

		String listUrl = cp + "/diningfull.fu";
		if(!param.equals("")){
			listUrl = listUrl + "?" + param;				
		}

		String pageIndexList =
				myUtil1.pageIndexList(currentPage, totalPage, listUrl);
		/////////////////////////////////////////////////////////////////
		System.out.println("test2");

		/*
		//글보기 주소 정리
		String DiningUrl = 
			cp + "/dining_" + dto.getCateEn() +"_details?pageNum=" + currentPage;

		if(!param.equals(""))
			articleUrl = articleUrl + "&" + param;
		 */

		ModelAndView mav = new ModelAndView();
		//		System.out.println("test!!!");

		System.out.println("lists size:"+lists.size());

		mav.setViewName("product/dining/diningfull");
		mav.addObject("lists", lists);
		mav.addObject("dataCount", dataCount);
		mav.addObject("pageIndexList", pageIndexList);
		mav.addObject("pageNum", pageNum);

		//		System.out.println("test3");

		return mav;

	}

	@RequestMapping(value = "/dining_sunbrella.fu", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView dining_sunbrella(HttpServletRequest request) throws Exception {
		
		//페이징 & 검색
		String cp = request.getContextPath();

		String pageNum = request.getParameter("pageNum");
		String cate = request.getParameter("cate");

		int currentPage = 1;

		if(pageNum != null) {
			currentPage = Integer.parseInt(pageNum);
		}

		System.out.println("pageNum: " + pageNum);
		System.out.println("currentPage: " + currentPage);

		String searchValue = request.getParameter("searchValue");

		if(searchValue==null) {

			searchValue = "";

		}else{

			if(request.getMethod().equalsIgnoreCase("GET"))
				searchValue =
				URLDecoder.decode(searchValue, "UTF-8");

		}

		System.out.println("test searchValue: " + searchValue);

		//전체 데이터갯수
		int dataCount = diningdao.getCateDataCount(cate,searchValue);

		System.out.println("number of all data: " + diningdao.getCateDataCount(cate,searchValue)); //72

		//전체 페이지 수
		int numPerPage = 8;
		int totalPage = myUtil1.getPageCount(numPerPage, dataCount);

		if(currentPage > totalPage)
			currentPage = totalPage;

		int start = (currentPage-1)*numPerPage+1;
		int end = currentPage*numPerPage;

		List<FurnitureDTO> catelists = diningdao.getCateLists(cate, searchValue, start, end);

		System.out.println("size of lists:" + catelists.size());

		//페이징 처리
		String param = "";
		if(!searchValue.equals("")){
			param= "searchValue=" 
					+ URLEncoder.encode(searchValue, "UTF-8");
		}

		String listUrl = cp + "/dining_sunbrella.fu?cate="+cate;
		if(!param.equals("")){
			listUrl = listUrl + "&" + param;				
		}

		String pageIndexList =
				myUtil1.pageIndexList(currentPage, totalPage, listUrl);

		ModelAndView mav = new ModelAndView();

//		List<FurnitureDTO> catelists = diningdao.getCateLists(cate,searchValue);

		mav.setViewName("product/dining/sunbrella/dining_sunbrella");
		mav.addObject("catelists", catelists);
		mav.addObject("pageNum",pageNum);
		mav.addObject("dataCount",dataCount);
		mav.addObject("pageIndexList", pageIndexList);

		return mav;

	}

	@RequestMapping(value = "/dining_sunbrella_details.fu", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView dining_sunbrella_details(HttpServletRequest request) {

		ModelAndView mav = new ModelAndView();

		int imageIndex = Integer.parseInt(request.getParameter("imageIndex"));
		String cate = request.getParameter("cate");

		List<FurnitureDTO> catelists = diningdao.getDetailLists(cate);

		FurnitureDTO dto = diningdao.getReadData(imageIndex,cate);

		mav.setViewName("product/dining/sunbrella/dining_sunbrella_details");
		mav.addObject("dto", dto);
		mav.addObject("catelists", catelists);

		return mav;
	}

	@RequestMapping(value = "/dining_clean.fu", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView dining_clean(HttpServletRequest request) throws Exception {

		//페이징 & 검색
		String cp = request.getContextPath();

		String pageNum = request.getParameter("pageNum");
		String cate = request.getParameter("cate");

		int currentPage = 1;

		if(pageNum != null) {
			currentPage = Integer.parseInt(pageNum);
		}

		System.out.println("pageNum: " + pageNum);
		System.out.println("currentPage: " + currentPage);

		String searchValue = request.getParameter("searchValue");

		if(searchValue==null) {

			searchValue = "";

		}else{

			if(request.getMethod().equalsIgnoreCase("GET"))
				searchValue =
				URLDecoder.decode(searchValue, "UTF-8");

		}

		System.out.println("test searchValue: " + searchValue);

		//전체 데이터갯수
		int dataCount = diningdao.getCateDataCount(cate,searchValue);

		System.out.println("number of all data: " + diningdao.getCateDataCount(cate,searchValue)); //72

		//전체 페이지 수
		int numPerPage = 8;
		int totalPage = myUtil1.getPageCount(numPerPage, dataCount);

		if(currentPage > totalPage)
			currentPage = totalPage;

		int start = (currentPage-1)*numPerPage+1;
		int end = currentPage*numPerPage;

		List<FurnitureDTO> catelists = diningdao.getCateLists(cate, searchValue, start, end);

		System.out.println("size of lists:" + catelists.size());

		//페이징 처리
		String param = "";
		if(!searchValue.equals("")){
			param= "searchValue=" 
					+ URLEncoder.encode(searchValue, "UTF-8");
		}

		String listUrl = cp + "/dining_clean.fu?cate="+cate;
		if(!param.equals("")){
			listUrl = listUrl + "&" + param;				
		}

		String pageIndexList =
				myUtil1.pageIndexList(currentPage, totalPage, listUrl);

		ModelAndView mav = new ModelAndView();

//		List<FurnitureDTO> catelists = diningdao.getCateLists(cate,searchValue);

		mav.setViewName("product/dining/clean/dining_clean");
		mav.addObject("catelists", catelists);
		mav.addObject("pageNum",pageNum);
		mav.addObject("dataCount",dataCount);
		mav.addObject("pageIndexList", pageIndexList);

		return mav;
	}

	@RequestMapping(value = "/dining_clean_details.fu", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView dining_clean_details(HttpServletRequest request) {

		ModelAndView mav = new ModelAndView();

		int imageIndex = Integer.parseInt(request.getParameter("imageIndex"));
		String cate = request.getParameter("cate");

		List<FurnitureDTO> catelists = diningdao.getDetailLists(cate);

		FurnitureDTO dto = diningdao.getReadData(imageIndex,cate);

		mav.setViewName("product/dining/clean/dining_clean_details");
		mav.addObject("dto", dto);
		mav.addObject("catelists", catelists);

		return mav;
	}

	@RequestMapping(value = "/dining_rnl.fu", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView dining_rnl(HttpServletRequest request) throws Exception {

		//페이징 & 검색
		String cp = request.getContextPath();

		String pageNum = request.getParameter("pageNum");
		String cate = request.getParameter("cate");

		int currentPage = 1;

		if(pageNum != null) {
			currentPage = Integer.parseInt(pageNum);
		}

		System.out.println("pageNum: " + pageNum);
		System.out.println("currentPage: " + currentPage);

		String searchValue = request.getParameter("searchValue");

		if(searchValue==null) {

			searchValue = "";

		}else{

			if(request.getMethod().equalsIgnoreCase("GET"))
				searchValue =
				URLDecoder.decode(searchValue, "UTF-8");

		}

		System.out.println("test searchValue: " + searchValue);

		//전체 데이터갯수
		int dataCount = diningdao.getCateDataCount(cate,searchValue);

		System.out.println("number of all data: " + diningdao.getCateDataCount(cate,searchValue)); //72

		//전체 페이지 수
		int numPerPage = 8;
		int totalPage = myUtil1.getPageCount(numPerPage, dataCount);

		if(currentPage > totalPage)
			currentPage = totalPage;

		int start = (currentPage-1)*numPerPage+1;
		int end = currentPage*numPerPage;

		List<FurnitureDTO> catelists = diningdao.getCateLists(cate, searchValue, start, end);

		System.out.println("size of lists:" + catelists.size());

		//페이징 처리
		String param = "";
		if(!searchValue.equals("")){
			param= "searchValue=" 
					+ URLEncoder.encode(searchValue, "UTF-8");
		}

		String listUrl = cp + "/dining_rnl.fu?cate="+cate;
		if(!param.equals("")){
			listUrl = listUrl + "&" + param;				
		}

		String pageIndexList =
				myUtil1.pageIndexList(currentPage, totalPage, listUrl);

		ModelAndView mav = new ModelAndView();

//		List<FurnitureDTO> catelists = diningdao.getCateLists(cate,searchValue);

		mav.setViewName("product/dining/rnl/dining_rnl");
		mav.addObject("catelists", catelists);
		mav.addObject("pageNum",pageNum);
		mav.addObject("dataCount",dataCount);
		mav.addObject("pageIndexList", pageIndexList);

		return mav;
	}

	@RequestMapping(value = "/dining_rnl_details.fu", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView dining_rnl_details(HttpServletRequest request) {

		ModelAndView mav = new ModelAndView();

		int imageIndex = Integer.parseInt(request.getParameter("imageIndex"));
		String cate = request.getParameter("cate");

		List<FurnitureDTO> catelists = diningdao.getDetailLists(cate);

		FurnitureDTO dto = diningdao.getReadData(imageIndex,cate);

		mav.setViewName("product/dining/rnl/dining_rnl_details");
		mav.addObject("dto", dto);
		mav.addObject("catelists", catelists);

		return mav;
	}

	@RequestMapping(value = "/dining_table.fu", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView dining_table(HttpServletRequest request) throws Exception {

		//페이징 & 검색
		String cp = request.getContextPath();

		String pageNum = request.getParameter("pageNum");
		String cate = request.getParameter("cate");

		int currentPage = 1;

		if(pageNum != null) {
			currentPage = Integer.parseInt(pageNum);
		}

		System.out.println("pageNum: " + pageNum);
		System.out.println("currentPage: " + currentPage);

		String searchValue = request.getParameter("searchValue");

		if(searchValue==null) {

			searchValue = "";

		}else{

			if(request.getMethod().equalsIgnoreCase("GET"))
				searchValue =
				URLDecoder.decode(searchValue, "UTF-8");

		}

		System.out.println("test searchValue: " + searchValue);

		//전체 데이터갯수
		int dataCount = diningdao.getCateDataCount(cate,searchValue);

		System.out.println("number of all data: " + diningdao.getCateDataCount(cate,searchValue)); //72

		//전체 페이지 수
		int numPerPage = 8;
		int totalPage = myUtil1.getPageCount(numPerPage, dataCount);

		if(currentPage > totalPage)
			currentPage = totalPage;

		int start = (currentPage-1)*numPerPage+1;
		int end = currentPage*numPerPage;

		List<FurnitureDTO> catelists = diningdao.getCateLists(cate, searchValue, start, end);

		System.out.println("size of lists:" + catelists.size());

		//페이징 처리
		String param = "";
		if(!searchValue.equals("")){
			param= "searchValue=" 
					+ URLEncoder.encode(searchValue, "UTF-8");
		}

		String listUrl = cp + "/dining_table.fu?cate="+cate;
		if(!param.equals("")){
			listUrl = listUrl + "&" + param;				
		}

		String pageIndexList =
				myUtil1.pageIndexList(currentPage, totalPage, listUrl);

		ModelAndView mav = new ModelAndView();

//		List<FurnitureDTO> catelists = diningdao.getCateLists(cate,searchValue);

		mav.setViewName("product/dining/table/dining_table");
		mav.addObject("catelists", catelists);
		mav.addObject("pageNum",pageNum);
		mav.addObject("dataCount",dataCount);
		mav.addObject("pageIndexList", pageIndexList);

		return mav;
	}

	@RequestMapping(value = "/dining_table_details.fu", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView dining_table_details(HttpServletRequest request) {

		ModelAndView mav = new ModelAndView();

		int imageIndex = Integer.parseInt(request.getParameter("imageIndex"));
		String cate = request.getParameter("cate");

		List<FurnitureDTO> catelists = diningdao.getDetailLists(cate);

		FurnitureDTO dto = diningdao.getReadData(imageIndex,cate);

		mav.setViewName("product/dining/table/dining_table_details");
		mav.addObject("dto", dto);
		mav.addObject("catelists", catelists);

		return mav;
	}

	@RequestMapping(value = "/dining_chair.fu", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView dining_chair(HttpServletRequest request) throws Exception {

		//페이징 & 검색
		String cp = request.getContextPath();

		String pageNum = request.getParameter("pageNum");
		String cate = request.getParameter("cate");

		int currentPage = 1;

		if(pageNum != null) {
			currentPage = Integer.parseInt(pageNum);
		}

		System.out.println("pageNum: " + pageNum);
		System.out.println("currentPage: " + currentPage);

		String searchValue = request.getParameter("searchValue");

		if(searchValue==null) {

			searchValue = "";

		}else{

			if(request.getMethod().equalsIgnoreCase("GET"))
				searchValue =
				URLDecoder.decode(searchValue, "UTF-8");

		}

		System.out.println("test searchValue: " + searchValue);

		//전체 데이터갯수
		int dataCount = diningdao.getCateDataCount(cate,searchValue);

		System.out.println("number of all data: " + diningdao.getCateDataCount(cate,searchValue)); //72

		//전체 페이지 수
		int numPerPage = 8;
		int totalPage = myUtil1.getPageCount(numPerPage, dataCount);

		if(currentPage > totalPage)
			currentPage = totalPage;

		int start = (currentPage-1)*numPerPage+1;
		int end = currentPage*numPerPage;

		List<FurnitureDTO> catelists = diningdao.getCateLists(cate, searchValue, start, end);

		System.out.println("size of lists:" + catelists.size());

		//페이징 처리
		String param = "";
		if(!searchValue.equals("")){
			param= "searchValue=" 
					+ URLEncoder.encode(searchValue, "UTF-8");
		}

		String listUrl = cp + "/dining_chair.fu?cate="+cate;
		if(!param.equals("")){
			listUrl = listUrl + "&" + param;				
		}

		String pageIndexList =
				myUtil1.pageIndexList(currentPage, totalPage, listUrl);

		ModelAndView mav = new ModelAndView();

//		List<FurnitureDTO> catelists = diningdao.getCateLists(cate,searchValue);

		mav.setViewName("product/dining/chair/dining_chair");
		mav.addObject("catelists", catelists);
		mav.addObject("pageNum",pageNum);
		mav.addObject("dataCount",dataCount);
		mav.addObject("pageIndexList", pageIndexList);

		return mav;
	}

	@RequestMapping(value = "/dining_chair_details.fu", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView dining_chair_details(HttpServletRequest request) {

		ModelAndView mav = new ModelAndView();

		int imageIndex = Integer.parseInt(request.getParameter("imageIndex"));
		String cate = request.getParameter("cate");

		List<FurnitureDTO> catelists = diningdao.getDetailLists(cate);

		FurnitureDTO dto = diningdao.getReadData(imageIndex,cate);

		mav.setViewName("product/dining/chair/dining_chair_details");
		mav.addObject("dto", dto);
		mav.addObject("catelists", catelists);

		return mav;
	}

	@RequestMapping(value = "/dining_deco.fu", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView dining_deco(HttpServletRequest request) throws Exception {

		//페이징 & 검색
		String cp = request.getContextPath();

		String pageNum = request.getParameter("pageNum");
		String cate = request.getParameter("cate");

		int currentPage = 1;

		if(pageNum != null) {
			currentPage = Integer.parseInt(pageNum);
		}

		System.out.println("pageNum: " + pageNum);
		System.out.println("currentPage: " + currentPage);

		String searchValue = request.getParameter("searchValue");

		if(searchValue==null) {

			searchValue = "";

		}else{

			if(request.getMethod().equalsIgnoreCase("GET"))
				searchValue =
				URLDecoder.decode(searchValue, "UTF-8");

		}

		System.out.println("test searchValue: " + searchValue);

		//전체 데이터갯수
		int dataCount = diningdao.getCateDataCount(cate,searchValue);

		System.out.println("number of all data: " + diningdao.getCateDataCount(cate,searchValue)); //72

		//전체 페이지 수
		int numPerPage = 8;
		int totalPage = myUtil1.getPageCount(numPerPage, dataCount);

		if(currentPage > totalPage)
			currentPage = totalPage;

		int start = (currentPage-1)*numPerPage+1;
		int end = currentPage*numPerPage;

		List<FurnitureDTO> catelists = diningdao.getCateLists(cate, searchValue, start, end);

		System.out.println("size of lists:" + catelists.size());

		//페이징 처리
		String param = "";
		if(!searchValue.equals("")){
			param= "searchValue=" 
					+ URLEncoder.encode(searchValue, "UTF-8");
		}

		String listUrl = cp + "/dining_deco.fu?cate="+cate;
		if(!param.equals("")){
			listUrl = listUrl + "&" + param;				
		}

		String pageIndexList =
				myUtil1.pageIndexList(currentPage, totalPage, listUrl);

		ModelAndView mav = new ModelAndView();

//		List<FurnitureDTO> catelists = diningdao.getCateLists(cate,searchValue);

		mav.setViewName("product/dining/deco/dining_deco");
		mav.addObject("catelists", catelists);
		mav.addObject("pageNum",pageNum);
		mav.addObject("dataCount",dataCount);
		mav.addObject("pageIndexList", pageIndexList);

		return mav;
	}

	@RequestMapping(value = "/dining_deco_details.fu", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView dining_deco_details(HttpServletRequest request) {

		ModelAndView mav = new ModelAndView();

		int imageIndex = Integer.parseInt(request.getParameter("imageIndex"));
		String cate = request.getParameter("cate");

		List<FurnitureDTO> catelists = diningdao.getDetailLists(cate);

		FurnitureDTO dto = diningdao.getReadData(imageIndex,cate);

		mav.setViewName("product/dining/deco/dining_deco_details");
		mav.addObject("dto", dto);
		mav.addObject("catelists", catelists);

		return mav;
	}

	@RequestMapping(value = "/dining_desk.fu", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView dining_desk(HttpServletRequest request) throws Exception {

		//페이징 & 검색
		String cp = request.getContextPath();

		String pageNum = request.getParameter("pageNum");
		String cate = request.getParameter("cate");

		int currentPage = 1;

		if(pageNum != null) {
			currentPage = Integer.parseInt(pageNum);
		}

		System.out.println("pageNum: " + pageNum);
		System.out.println("currentPage: " + currentPage);

		String searchValue = request.getParameter("searchValue");

		if(searchValue==null) {

			searchValue = "";

		}else{

			if(request.getMethod().equalsIgnoreCase("GET"))
				searchValue =
				URLDecoder.decode(searchValue, "UTF-8");

		}

		System.out.println("test searchValue: " + searchValue);

		//전체 데이터갯수
		int dataCount = diningdao.getCateDataCount(cate,searchValue);

		System.out.println("number of all data: " + diningdao.getCateDataCount(cate,searchValue)); //72

		//전체 페이지 수
		int numPerPage = 8;
		int totalPage = myUtil1.getPageCount(numPerPage, dataCount);

		if(currentPage > totalPage)
			currentPage = totalPage;

		int start = (currentPage-1)*numPerPage+1;
		int end = currentPage*numPerPage;

		List<FurnitureDTO> catelists = diningdao.getCateLists(cate, searchValue, start, end);

		System.out.println("size of lists:" + catelists.size());

		//페이징 처리
		String param = "";
		if(!searchValue.equals("")){
			param= "searchValue=" 
					+ URLEncoder.encode(searchValue, "UTF-8");
		}

		String listUrl = cp + "/dining_desk.fu?cate="+cate;
		if(!param.equals("")){
			listUrl = listUrl + "&" + param;				
		}

		String pageIndexList =
				myUtil1.pageIndexList(currentPage, totalPage, listUrl);

		ModelAndView mav = new ModelAndView();

//		List<FurnitureDTO> catelists = diningdao.getCateLists(cate,searchValue);

		mav.setViewName("product/dining/desk/dining_desk");
		mav.addObject("catelists", catelists);
		mav.addObject("pageNum",pageNum);
		mav.addObject("dataCount",dataCount);
		mav.addObject("pageIndexList", pageIndexList);

		return mav;

	}

	@RequestMapping(value = "/dining_desk_details.fu", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView dining_desk_details(HttpServletRequest request) {

		ModelAndView mav = new ModelAndView();

		int imageIndex = Integer.parseInt(request.getParameter("imageIndex"));
		String cate = request.getParameter("cate");

		List<FurnitureDTO> catelists = diningdao.getDetailLists(cate);

		FurnitureDTO dto = diningdao.getReadData(imageIndex,cate);

		mav.setViewName("product/dining/desk/dining_desk_details");
		mav.addObject("dto", dto);
		mav.addObject("catelists", catelists);

		return mav;
	}

}
