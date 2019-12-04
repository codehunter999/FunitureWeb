package com.funi.controller;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.funi.dao.BedDAO;
import com.funi.domain.FurnitureDTO;
import com.funi.util.MyUtil1;

@Controller
public class BedController {
	
	@Autowired
	@Qualifier("BedDAO")
	BedDAO bedDao;
	
	@Autowired
	@Qualifier("myUtil1")
	MyUtil1 myUtil1;
	
	// <침실파트>
	//침실 total
	@RequestMapping(value = "/bed_total.fu", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView bed_total(HttpServletRequest request) throws Exception {
		
		//searchKey 다 빼주기
		ModelAndView mav = new ModelAndView();
		
		String cp = request.getContextPath();
		
		String pageNum = request.getParameter("pageNum");
		int currentPage = 1;
		
		if(pageNum != null)
			currentPage = Integer.parseInt(pageNum);
		
		System.out.println("pageNum!!!" + pageNum);
		
		String searchValue = request.getParameter("searchValue");
		
		if(searchValue==null) {

			searchValue = "";
			
		}else {
			
			if(request.getMethod().equalsIgnoreCase("GET"))
				searchValue = URLDecoder.decode(searchValue, "UTF-8");
		}
		
		System.out.println("searchValue!!!!" + searchValue);
		
		//전체 데이터 갯수
		int dataCount = bedDao.getDataCount(searchValue);
		
		//전체 페이지수
		int numPerPage = 8;
		int totalPage = myUtil1.getPageCount(numPerPage, dataCount);
		
		if(currentPage > totalPage)
			currentPage = totalPage;
		
		int start = (currentPage-1)*numPerPage+1;
		int end = currentPage*numPerPage;
		
		List<FurnitureDTO> lists = bedDao.bedImageList(start, end, searchValue);
		
		//페이징 처리
		String param = "";
		if(!searchValue.equals("")) {
			param = "searchValue=" + URLEncoder.encode(searchValue, "UTF-8");
		}
		
		String listUrl = cp + "/bed_total.fu";
		if(!param.equals("")) {
			listUrl = listUrl + "?" + param;
		}
		
		String pageIndexList = myUtil1.pageIndexList(currentPage, totalPage, listUrl);
		
		//글보기 주소 정리
		
		//System.out.println("lists"+lists.size());
		mav.setViewName("product/bed/bed_total");
		mav.addObject("lists", lists);
		mav.addObject("pageIndexList", pageIndexList);
		mav.addObject("dataCount", dataCount);
		mav.addObject("pageNum", pageNum);

		return mav;
	}
	
	//카테고리와 디테일 따로 주기
	@RequestMapping(value = "/bed_bed.fu", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView bed_bed(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//페이징 & 검색
		String cp = request.getContextPath();

		String pageNum = request.getParameter("pageNum");
		String cateEn = request.getParameter("cateEn");

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
				searchValue = URLDecoder.decode(searchValue, "UTF-8");

		}
		System.out.println("test searchValue: " + searchValue);

		//전체 데이터갯수
		int dataCount = bedDao.getCateDataCount(cateEn, searchValue);


		System.out.println("number of all data: " + bedDao.getCateDataCount(cateEn,searchValue)); //

		//전체 페이지 수
		int numPerPage = 8;
		int totalPage = myUtil1.getPageCount(numPerPage, dataCount);

		if(currentPage > totalPage)
			currentPage = totalPage;

		int start = (currentPage-1)*numPerPage+1;
		int end = currentPage*numPerPage;

		List<FurnitureDTO> catelists = bedDao.cateSImageList(cateEn, start, end, searchValue);

		System.out.println("size of lists:" + catelists.size());

		//페이징 처리
		String param = "";
		if(!searchValue.equals("")){
			param= "searchValue=" + URLEncoder.encode(searchValue, "UTF-8");
		}

		String listUrl = cp + "/bed_bed.fu?cateEn="+cateEn;
		
		if(!param.equals("")){
			listUrl = listUrl + "&" + param;	
			
		}

		String pageIndexList = myUtil1.pageIndexList(currentPage, totalPage, listUrl);

		ModelAndView mav = new ModelAndView();

//					List<FurnitureDTO> catelists = diningdao.getCateLists(cate,searchValue);

		mav.setViewName("product/bed/bed/bed_bed");
		mav.addObject("listUrl", listUrl);
		mav.addObject("Blists", catelists);
		mav.addObject("pageNum",pageNum);
		mav.addObject("dataCount",dataCount);
		mav.addObject("pageIndexList", pageIndexList);

		return mav;
		
	}
	
	@RequestMapping(value = "/bed_BED_details.fu", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView bed_BED_details(HttpServletRequest request,int imageIndex,String cateEn) {
		
		ModelAndView mav = new ModelAndView();
		
		/*
		 * int imageIndex = Integer.parseInt(request.getParameter("imageIndex")); String
		 * cateE = request.getParameter("cateE");
		 */
	
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("cateEn", cateEn);
		params.put("imageIndex", imageIndex);
		System.out.println("");
		List<FurnitureDTO> Lists = bedDao.cateEImageList(params);
		
		FurnitureDTO dto = bedDao.getReadData(imageIndex,cateEn);
		System.out.println("test 입니다 "+dto.getSaveFileName());
		mav.setViewName("product/bed/bed/bed_BED_details");
		mav.addObject("dto", dto);
		mav.addObject("Blists", Lists);
		
		return mav;
	}
	
	//----------------------------------------------------------
	
	@RequestMapping(value = "/bed_ht.fu", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView bed_ht(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		//페이징 & 검색
		String cp = request.getContextPath();

		String pageNum = request.getParameter("pageNum");
		String cateEn = request.getParameter("cateEn");

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
				searchValue = URLDecoder.decode(searchValue, "UTF-8");

		}
		System.out.println("test searchValue: " + searchValue);

		//전체 데이터갯수
		int dataCount = bedDao.getCateDataCount(cateEn, searchValue);


		System.out.println("number of all data: " + bedDao.getCateDataCount(cateEn,searchValue)); //

		//전체 페이지 수
		int numPerPage = 8;
		int totalPage = myUtil1.getPageCount(numPerPage, dataCount);

		if(currentPage > totalPage)
			currentPage = totalPage;

		int start = (currentPage-1)*numPerPage+1;
		int end = currentPage*numPerPage;

		List<FurnitureDTO> catelists = bedDao.cateSImageList(cateEn, start, end, searchValue);

		System.out.println("size of lists:" + catelists.size());

		//페이징 처리
		String param = "";
		if(!searchValue.equals("")){
			param= "searchValue=" + URLEncoder.encode(searchValue, "UTF-8");
		}
		
		String listUrl = cp + "/bed_ht.fu?cateEn="+cateEn;
		
		if(!param.equals("")){
			listUrl = listUrl + "&" + param;	
			
		}

		String pageIndexList = myUtil1.pageIndexList(currentPage, totalPage, listUrl);

		ModelAndView mav = new ModelAndView();

//							List<FurnitureDTO> catelists = diningdao.getCateLists(cate,searchValue);

		mav.setViewName("product/bed/ht/bed_ht");
		mav.addObject("Blists", catelists);
		mav.addObject("pageNum",pageNum);
		mav.addObject("dataCount",dataCount);
		mav.addObject("pageIndexList", pageIndexList);

		return mav;
	}
	
	@RequestMapping(value = "/bed_ht_details.fu", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView bed_ht_details(HttpServletRequest request,int imageIndex,String cateEn) {
		
		ModelAndView mav = new ModelAndView();
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("cateEn", cateEn);
		params.put("imageIndex", imageIndex);
		
		List<FurnitureDTO> bLists = bedDao.cateEImageList(params);
		FurnitureDTO dto = bedDao.getReadData(imageIndex,cateEn);
		System.out.println("test 입니다 "+dto.getSaveFileName());
		mav.setViewName("product/bed/ht/bed_ht_details");
		mav.addObject("dto", dto);
		mav.addObject("Blists", bLists);
		
		return mav;
	}
	
	//----------------------------------------------------------
	
	
	@RequestMapping(value = "/bed_dressingTable.fu", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView bed_dressingTable(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//페이징 & 검색
		String cp = request.getContextPath();

		String pageNum = request.getParameter("pageNum");
		String cateEn = request.getParameter("cateEn");

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
				searchValue = URLDecoder.decode(searchValue, "UTF-8");

		}
		System.out.println("test searchValue: " + searchValue);

		//전체 데이터갯수
		int dataCount = bedDao.getCateDataCount(cateEn, searchValue);


		System.out.println("number of all data: " + bedDao.getCateDataCount(cateEn,searchValue)); //

		//전체 페이지 수
		int numPerPage = 8;
		int totalPage = myUtil1.getPageCount(numPerPage, dataCount);

		if(currentPage > totalPage)
			currentPage = totalPage;

		int start = (currentPage-1)*numPerPage+1;
		int end = currentPage*numPerPage;

		List<FurnitureDTO> catelists = bedDao.cateSImageList(cateEn, start, end, searchValue);

		System.out.println("size of lists:" + catelists.size());

		//페이징 처리
		String param = "";
		if(!searchValue.equals("")){
			param= "searchValue=" + URLEncoder.encode(searchValue, "UTF-8");
		}

		String listUrl = cp + "/bed_dressingTable.fu?cateEn="+cateEn;
		
		if(!param.equals("")){
			listUrl = listUrl + "&" + param;	
			
		}

		String pageIndexList = myUtil1.pageIndexList(currentPage, totalPage, listUrl);

		ModelAndView mav = new ModelAndView();

//									List<FurnitureDTO> catelists = diningdao.getCateLists(cate,searchValue);

		mav.setViewName("product/bed/dressing/bed_dressingTable");
		mav.addObject("Blists", catelists);
		mav.addObject("pageNum",pageNum);
		mav.addObject("dataCount",dataCount);
		mav.addObject("pageIndexList", pageIndexList);

		return mav;
		
	}
	
	@RequestMapping(value = "/bed_dressingTable_details.fu", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView bed_dressingTable_details(HttpServletRequest request,int imageIndex,String cateEn) {
		
		ModelAndView mav = new ModelAndView();
	
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("cateEn", cateEn);
		params.put("imageIndex", imageIndex);
		
		List<FurnitureDTO> bedlists = bedDao.cateEImageList(params);
		
		FurnitureDTO dto = bedDao.getReadData(imageIndex,cateEn);
		System.out.println("test 입니다 "+dto.getSaveFileName());
		mav.setViewName("product/bed/dressing/bed_dressingTable_details");
		mav.addObject("dto", dto);
		mav.addObject("Blists", bedlists);
		
		return mav;
	}
	
	//----------------------------------------------------------
	
	@RequestMapping(value = "/bed_chiff.fu", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView bed_chiff(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//페이징 & 검색
		String cp = request.getContextPath();

		String pageNum = request.getParameter("pageNum");
		String cateEn = request.getParameter("cateEn");

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
				searchValue = URLDecoder.decode(searchValue, "UTF-8");

		}
		System.out.println("test searchValue: " + searchValue);

		//전체 데이터갯수
		int dataCount = bedDao.getCateDataCount(cateEn, searchValue);


		System.out.println("number of all data: " + bedDao.getCateDataCount(cateEn,searchValue)); //

		//전체 페이지 수
		int numPerPage = 8;
		int totalPage = myUtil1.getPageCount(numPerPage, dataCount);

		if(currentPage > totalPage)
			currentPage = totalPage;

		int start = (currentPage-1)*numPerPage+1;
		int end = currentPage*numPerPage;

		List<FurnitureDTO> catelists = bedDao.cateSImageList(cateEn, start, end, searchValue);

		System.out.println("size of lists:" + catelists.size());

		//페이징 처리
		String param = "";
		if(!searchValue.equals("")){
			param= "searchValue=" + URLEncoder.encode(searchValue, "UTF-8");
		}

		String listUrl = cp + "/bed_chiff.fu?cateEn="+cateEn;
		
		if(!param.equals("")){
			listUrl = listUrl + "&" + param;	
			
		}

		String pageIndexList = myUtil1.pageIndexList(currentPage, totalPage, listUrl);

		ModelAndView mav = new ModelAndView();

//									List<FurnitureDTO> catelists = diningdao.getCateLists(cate,searchValue);

		mav.setViewName("product/bed/chiff/bed_chiff");
		mav.addObject("Blists", catelists);
		mav.addObject("pageNum",pageNum);
		mav.addObject("dataCount",dataCount);
		mav.addObject("pageIndexList", pageIndexList);

		return mav;
	}
	
	@RequestMapping(value = "/bed_chiff_details.fu", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView bed_chiff_details(HttpServletRequest request,int imageIndex,String cateEn) {
		
		ModelAndView mav = new ModelAndView();
	
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("cateEn", cateEn);
		params.put("imageIndex", imageIndex);
		System.out.println("");
		List<FurnitureDTO> Lists = bedDao.cateEImageList(params);
		
		FurnitureDTO dto = bedDao.getReadData(imageIndex,cateEn);
		System.out.println("test 입니다 "+dto.getSaveFileName());
		mav.setViewName("product/bed/chiff/bed_chiff_details");
		mav.addObject("dto", dto);
		mav.addObject("Blists", Lists);
		
		return mav;
	}

}
