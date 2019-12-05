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

import com.funi.dao.LivingDAO;
import com.funi.domain.FurnitureDTO;
import com.funi.util.MyUtil;
import com.funi.util.MyUtil1;

@Controller
public class LivingController {

	@Autowired
	@Qualifier("LivingDAO")
	LivingDAO livingDao;

	@Autowired
	MyUtil1 myUtil1;

	//�Ž� total
		@RequestMapping(value = "/living_total.fu", method = {RequestMethod.GET,RequestMethod.POST})
		public ModelAndView living_total(HttpServletRequest request) throws Exception {
			
			//searchKey �� ���ֱ�
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
			
			//��ü ������ ����
			int dataCount = livingDao.getDataCount(searchValue);
			
			//��ü ��������
			int numPerPage = 8;
			int totalPage = myUtil1.getPageCount(numPerPage, dataCount);
			
			if(currentPage > totalPage)
				currentPage = totalPage;
			
			int start = (currentPage-1)*numPerPage+1;
			int end = currentPage*numPerPage;
			
			List<FurnitureDTO> lists = livingDao.livingImageList(start, end, searchValue);
			
			//����¡ ó��
			String param = "";
			if(!searchValue.equals("")) {
				param = "searchValue=" + URLEncoder.encode(searchValue, "UTF-8");
			}
			
			String listUrl = cp + "/living_total.fu";
			if(!param.equals("")) {
				listUrl = listUrl + "?" + param;
			}
			
			String pageIndexList = myUtil1.pageIndexList(currentPage, totalPage, listUrl);
			
			//�ۺ��� �ּ� ����
			
			//System.out.println("lists"+lists.size());
			mav.setViewName("product/living/living_total");
			mav.addObject("lists", lists);
			mav.addObject("pageIndexList", pageIndexList);
			mav.addObject("dataCount", dataCount);
			mav.addObject("pageNum", pageNum);

			return mav;
		}
		
	//---------------------------------------------------------------------
		//���근��
		//cateEn�� null
		@RequestMapping(value = "/living_sunb.fu", method = {RequestMethod.GET,RequestMethod.POST})
		public ModelAndView living_sunb(HttpServletRequest request, HttpServletResponse response) throws Exception{
			
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

			//��ü �����Ͱ���
			int dataCount = livingDao.getCateDataCount(cateEn, searchValue);


			System.out.println("number of all data: " + livingDao.getCateDataCount(cateEn,searchValue)); //

			//��ü ������ ��
			int numPerPage = 8;
			int totalPage = myUtil1.getPageCount(numPerPage, dataCount);

			if(currentPage > totalPage)
				currentPage = totalPage;

			int start = (currentPage-1)*numPerPage+1;
			int end = currentPage*numPerPage;

			List<FurnitureDTO> catelists = livingDao.cateSImageList(cateEn, start, end, searchValue);

			System.out.println("size of lists:" + catelists.size());

			//����¡ ó��
			String param = "";
			if(!searchValue.equals("")){
				param= "searchValue=" + URLEncoder.encode(searchValue, "UTF-8");
			}

			String listUrl = cp + "/living_sunb.fu?cateEn="+cateEn;
			
			if(!param.equals("")){
				listUrl = listUrl + "&" + param;	
				
			}

			String pageIndexList = myUtil1.pageIndexList(currentPage, totalPage, listUrl);

			ModelAndView mav = new ModelAndView();

//					List<FurnitureDTO> catelists = diningdao.getCateLists(cate,searchValue);

			mav.setViewName("product/living/sunb/living_sunb");
			mav.addObject("listUrl", listUrl);
			mav.addObject("lists", catelists);
			mav.addObject("pageNum",pageNum);
			mav.addObject("dataCount",dataCount);
			mav.addObject("pageIndexList", pageIndexList);
			mav.addObject("cateEn", cateEn);
			mav.addObject("searchValue", searchValue);

			return mav;
			
		}
		
		@RequestMapping(value = "/living_sunb_details.fu", method = {RequestMethod.GET,RequestMethod.POST})
		public ModelAndView living_sunb_details(HttpServletRequest request,int imageIndex,String cateEn) {
			
			ModelAndView mav = new ModelAndView();
			
			/*
			 * int imageIndex = Integer.parseInt(request.getParameter("imageIndex")); String
			 * cateE = request.getParameter("cateE");
			 */
		
			HashMap<String, Object> params = new HashMap<String, Object>();
			params.put("cateEn", cateEn);
			params.put("imageIndex", imageIndex);
			List<FurnitureDTO> Lists = livingDao.cateEImageList(params);
			
			FurnitureDTO dto = livingDao.getReadData(imageIndex,cateEn);
			System.out.println("test �Դϴ� "+dto.getSaveFileName());
			mav.setViewName("product/living/sunb/living_sunb_details");
			mav.addObject("dto", dto);
			mav.addObject("lists", Lists);
			
			return mav;
		}
		
		//---------------------------------------------------------------------
		
		//�к긯
		@RequestMapping(value = "/living_fabric.fu", method = {RequestMethod.GET,RequestMethod.POST})
		public ModelAndView living_fabric(HttpServletRequest request, HttpServletResponse response) throws Exception{
			
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

			//��ü ī�װ��� �����Ͱ���
			int dataCount = livingDao.getCateDataCount(cateEn, searchValue);


			System.out.println("number of all data: " + livingDao.getCateDataCount(cateEn,searchValue)); //

			//��ü ������ ��
			int numPerPage = 8;
			int totalPage = myUtil1.getPageCount(numPerPage, dataCount);

			if(currentPage > totalPage)
				currentPage = totalPage;

			int start = (currentPage-1)*numPerPage+1;
			int end = currentPage*numPerPage;

			List<FurnitureDTO> catelists = livingDao.cateSImageList(cateEn, start, end, searchValue);

			System.out.println("size of lists:" + catelists.size());

			//����¡ ó��
			String param = "";
			if(!searchValue.equals("")){
				param= "searchValue=" + URLEncoder.encode(searchValue, "UTF-8");
			}

			String listUrl = cp + "/living_fabric.fu?cateEn="+cateEn;
			
			if(!param.equals("")){
				listUrl = listUrl + "&" + param;	
				
			}

			String pageIndexList = myUtil1.pageIndexList(currentPage, totalPage, listUrl);

			ModelAndView mav = new ModelAndView();

//					List<FurnitureDTO> catelists = diningdao.getCateLists(cate,searchValue);

			mav.setViewName("product/living/fabric/living_fabric");
			mav.addObject("listUrl", listUrl);
			mav.addObject("lists", catelists);
			mav.addObject("pageNum",pageNum);
			mav.addObject("dataCount",dataCount);
			mav.addObject("pageIndexList", pageIndexList);
			mav.addObject("cateEn", cateEn);
			mav.addObject("searchValue", searchValue);

			return mav;
		}
		
		@RequestMapping(value = "/living_fabric_details.fu", method = {RequestMethod.GET,RequestMethod.POST})
		public ModelAndView living_fabric_details(HttpServletRequest request,int imageIndex,String cateEn) {
			
			ModelAndView mav = new ModelAndView();
			
			/*
			 * int imageIndex = Integer.parseInt(request.getParameter("imageIndex")); String
			 * cateE = request.getParameter("cateE");
			 */
		
			HashMap<String, Object> params = new HashMap<String, Object>();
			params.put("cateEn", cateEn);
			params.put("imageIndex", imageIndex);
			List<FurnitureDTO> Lists = livingDao.cateEImageList(params);
			
			FurnitureDTO dto = livingDao.getReadData(imageIndex,cateEn);
			System.out.println("test �Դϴ� "+dto.getSaveFileName());
			mav.setViewName("product/living/fabric/living_fabric_details");
			mav.addObject("dto", dto);
			mav.addObject("lists", Lists);
			
			return mav;
		}
		
		//---------------------------------------------------------------------
		//����
		@RequestMapping(value = "/living_leather.fu", method = {RequestMethod.GET,RequestMethod.POST})
		public ModelAndView living_leather(HttpServletRequest request, HttpServletResponse response) throws Exception {
			
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

			//��ü �����Ͱ���
			int dataCount = livingDao.getCateDataCount(cateEn, searchValue);


			System.out.println("number of all data: " + livingDao.getCateDataCount(cateEn,searchValue)); //

			//��ü ������ ��
			int numPerPage = 8;
			int totalPage = myUtil1.getPageCount(numPerPage, dataCount);

			if(currentPage > totalPage)
				currentPage = totalPage;

			int start = (currentPage-1)*numPerPage+1;
			int end = currentPage*numPerPage;

			List<FurnitureDTO> catelists = livingDao.cateSImageList(cateEn, start, end, searchValue);

			System.out.println("size of lists:" + catelists.size());

			//����¡ ó��
			String param = "";
			if(!searchValue.equals("")){
				param= "searchValue=" + URLEncoder.encode(searchValue, "UTF-8");
			}

			String listUrl = cp + "/living_leather.fu?cateEn="+cateEn;
			
			if(!param.equals("")){
				listUrl = listUrl + "&" + param;	
				
			}

			String pageIndexList = myUtil1.pageIndexList(currentPage, totalPage, listUrl);

			ModelAndView mav = new ModelAndView();

//					List<FurnitureDTO> catelists = diningdao.getCateLists(cate,searchValue);

			mav.setViewName("product/living/leather/living_leather");
			mav.addObject("listUrl", listUrl);
			mav.addObject("lists", catelists);
			mav.addObject("pageNum",pageNum);
			mav.addObject("dataCount",dataCount);
			mav.addObject("pageIndexList", pageIndexList);
			mav.addObject("cateEn", cateEn);
			mav.addObject("searchValue", searchValue);

			return mav;
		}
		
		@RequestMapping(value = "/living_leather_details.fu", method = {RequestMethod.GET,RequestMethod.POST})
		public ModelAndView living_leather_details(HttpServletRequest request,int imageIndex,String cateEn) {
			
			ModelAndView mav = new ModelAndView();
			
			/*
			 * int imageIndex = Integer.parseInt(request.getParameter("imageIndex")); String
			 * cateE = request.getParameter("cateE");
			 */
		
			HashMap<String, Object> params = new HashMap<String, Object>();
			params.put("cateEn", cateEn);
			params.put("imageIndex", imageIndex);
			List<FurnitureDTO> Lists = livingDao.cateEImageList(params);
			
			FurnitureDTO dto = livingDao.getReadData(imageIndex,cateEn);
			System.out.println("test �Դϴ� "+dto.getSaveFileName());
			mav.setViewName("product/living/leather/living_leather_details");
			mav.addObject("dto", dto);
			mav.addObject("lists", Lists);
			
			return mav;
		}
		
		
		
		//---------------------------------------------------------------------
		//���콺
		@RequestMapping(value = "/living_deus.fu", method = {RequestMethod.GET,RequestMethod.POST})
		public ModelAndView living_deus(HttpServletRequest request, HttpServletResponse response) throws Exception {
			
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

			//��ü �����Ͱ���
			int dataCount = livingDao.getCateDataCount(cateEn, searchValue);


			System.out.println("number of all data: " + livingDao.getCateDataCount(cateEn,searchValue)); //

			//��ü ������ ��
			int numPerPage = 8;
			int totalPage = myUtil1.getPageCount(numPerPage, dataCount);

			if(currentPage > totalPage)
				currentPage = totalPage;

			int start = (currentPage-1)*numPerPage+1;
			int end = currentPage*numPerPage;

			List<FurnitureDTO> catelists = livingDao.cateSImageList(cateEn, start, end, searchValue);

			System.out.println("size of lists:" + catelists.size());

			//����¡ ó��
			String param = "";
			if(!searchValue.equals("")){
				param= "searchValue=" + URLEncoder.encode(searchValue, "UTF-8");
			}

			String listUrl = cp + "/living_deus.fu?cateEn="+cateEn;
			
			if(!param.equals("")){
				listUrl = listUrl + "&" + param;	
				
			}

			String pageIndexList = myUtil1.pageIndexList(currentPage, totalPage, listUrl);

			ModelAndView mav = new ModelAndView();

//					List<FurnitureDTO> catelists = diningdao.getCateLists(cate,searchValue);

			mav.setViewName("product/living/deus/living_deus");
			mav.addObject("listUrl", listUrl);
			mav.addObject("lists", catelists);
			mav.addObject("pageNum",pageNum);
			mav.addObject("dataCount",dataCount);
			mav.addObject("pageIndexList", pageIndexList);
			mav.addObject("cateEn", cateEn);
			mav.addObject("searchValue", searchValue);

			return mav;
		}
		
		@RequestMapping(value = "/living_deus_details.fu", method = {RequestMethod.GET,RequestMethod.POST})
		public ModelAndView living_deus_details(HttpServletRequest request,int imageIndex,String cateEn) {
			
			ModelAndView mav = new ModelAndView();
			
			/*
			 * int imageIndex = Integer.parseInt(request.getParameter("imageIndex")); String
			 * cateE = request.getParameter("cateE");
			 */
		
			HashMap<String, Object> params = new HashMap<String, Object>();
			params.put("cateEn", cateEn);
			params.put("imageIndex", imageIndex);
			List<FurnitureDTO> Lists = livingDao.cateEImageList(params);
			
			FurnitureDTO dto = livingDao.getReadData(imageIndex,cateEn);
			System.out.println("test �Դϴ� "+dto.getSaveFileName());
			mav.setViewName("product/living/deus/living_deus_details");
			mav.addObject("dto", dto);
			mav.addObject("lists", Lists);
			
			return mav;
		}
		
		//---------------------------------------------------------------------
		//���̵� ���̺�
		@RequestMapping(value = "/living_sideTable.fu", method = {RequestMethod.GET,RequestMethod.POST})
		public ModelAndView living_sideTable(HttpServletRequest request, HttpServletResponse response) throws Exception {
			
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

			//��ü �����Ͱ���
			int dataCount = livingDao.getCateDataCount(cateEn, searchValue);


			System.out.println("number of all data: " + livingDao.getCateDataCount(cateEn,searchValue)); //

			//��ü ������ ��
			int numPerPage = 8;
			int totalPage = myUtil1.getPageCount(numPerPage, dataCount);

			if(currentPage > totalPage)
				currentPage = totalPage;

			int start = (currentPage-1)*numPerPage+1;
			int end = currentPage*numPerPage;

			List<FurnitureDTO> catelists = livingDao.cateSImageList(cateEn, start, end, searchValue);

			System.out.println("size of lists:" + catelists.size());

			//����¡ ó��
			String param = "";
			if(!searchValue.equals("")){
				param= "searchValue=" + URLEncoder.encode(searchValue, "UTF-8");
			}

			String listUrl = cp + "/living_sideTable.fu?cateEn="+cateEn;
			
			if(!param.equals("")){
				listUrl = listUrl + "&" + param;	
				
			}

			String pageIndexList = myUtil1.pageIndexList(currentPage, totalPage, listUrl);

			ModelAndView mav = new ModelAndView();

//					List<FurnitureDTO> catelists = diningdao.getCateLists(cate,searchValue);

			mav.setViewName("product/living/sideTable/living_sideTable");
			mav.addObject("listUrl", listUrl);
			mav.addObject("lists", catelists);
			mav.addObject("pageNum",pageNum);
			mav.addObject("dataCount",dataCount);
			mav.addObject("pageIndexList", pageIndexList);
			mav.addObject("cateEn", cateEn);
			mav.addObject("searchValue", searchValue);

			return mav;
		}
		
		@RequestMapping(value = "/living_sideTable_details.fu", method = {RequestMethod.GET,RequestMethod.POST})
		public ModelAndView living_sideTable_details(HttpServletRequest request,int imageIndex,String cateEn) {
			
			ModelAndView mav = new ModelAndView();
			
			/*
			 * int imageIndex = Integer.parseInt(request.getParameter("imageIndex")); String
			 * cateE = request.getParameter("cateE");
			 */
		
			HashMap<String, Object> params = new HashMap<String, Object>();
			params.put("cateEn", cateEn);
			params.put("imageIndex", imageIndex);
			List<FurnitureDTO> Lists = livingDao.cateEImageList(params);
			
			FurnitureDTO dto = livingDao.getReadData(imageIndex,cateEn);
			System.out.println("test �Դϴ� "+dto.getSaveFileName());
			mav.setViewName("product/living/sideTable/living_sideTable_details");
			mav.addObject("dto", dto);
			mav.addObject("lists", Lists);
			
			return mav;
		}
		
		//---------------------------------------------------------------------
		//Ƽ�� ��
		@RequestMapping(value = "/living_TV.fu", method = {RequestMethod.GET,RequestMethod.POST})
		public ModelAndView living_TV(HttpServletRequest request, HttpServletResponse response) throws Exception {
			
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

			//��ü �����Ͱ���
			int dataCount = livingDao.getCateDataCount(cateEn, searchValue);


			System.out.println("number of all data: " + livingDao.getCateDataCount(cateEn,searchValue)); //

			//��ü ������ ��
			int numPerPage = 8;
			int totalPage = myUtil1.getPageCount(numPerPage, dataCount);

			if(currentPage > totalPage)
				currentPage = totalPage;

			int start = (currentPage-1)*numPerPage+1;
			int end = currentPage*numPerPage;

			List<FurnitureDTO> catelists = livingDao.cateSImageList(cateEn, start, end, searchValue);

			System.out.println("size of lists:" + catelists.size());

			//����¡ ó��
			String param = "";
			if(!searchValue.equals("")){
				param= "searchValue=" + URLEncoder.encode(searchValue, "UTF-8");
			}

			String listUrl = cp + "/living_TV.fu?cateEn="+cateEn;
			
			if(!param.equals("")){
				listUrl = listUrl + "&" + param;	
				
			}

			String pageIndexList = myUtil1.pageIndexList(currentPage, totalPage, listUrl);

			ModelAndView mav = new ModelAndView();

//					List<FurnitureDTO> catelists = diningdao.getCateLists(cate,searchValue);

			mav.setViewName("product/living/TV/living_TV");
			mav.addObject("listUrl", listUrl);
			mav.addObject("lists", catelists);
			mav.addObject("pageNum",pageNum);
			mav.addObject("dataCount",dataCount);
			mav.addObject("pageIndexList", pageIndexList);
			mav.addObject("cateEn", cateEn);
			mav.addObject("searchValue", searchValue);

			return mav;
		}
		
		@RequestMapping(value = "/living_TV_details.fu", method = {RequestMethod.GET,RequestMethod.POST})
		public ModelAndView living_TV_details(HttpServletRequest request,int imageIndex,String cateEn) {
			
			ModelAndView mav = new ModelAndView();
			
			/*
			 * int imageIndex = Integer.parseInt(request.getParameter("imageIndex")); String
			 * cateE = request.getParameter("cateE");
			 */
		
			HashMap<String, Object> params = new HashMap<String, Object>();
			params.put("cateEn", cateEn);
			params.put("imageIndex", imageIndex);
			List<FurnitureDTO> Lists = livingDao.cateEImageList(params);
			
			FurnitureDTO dto = livingDao.getReadData(imageIndex,cateEn);
			System.out.println("test �Դϴ� "+dto.getSaveFileName());
			mav.setViewName("product/living/TV/living_TV_details");
			mav.addObject("dto", dto);
			mav.addObject("lists", Lists);
			
			return mav;
		}
		
		//---------------------------------------------------------------------
		//����
		@RequestMapping(value = "/living_shelf.fu", method = {RequestMethod.GET,RequestMethod.POST})
		public ModelAndView living_shelf(HttpServletRequest request, HttpServletResponse response) throws Exception {
			
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

			//��ü �����Ͱ���
			int dataCount = livingDao.getCateDataCount(cateEn, searchValue);


			System.out.println("number of all data: " + livingDao.getCateDataCount(cateEn,searchValue)); //

			//��ü ������ ��
			int numPerPage = 8;
			int totalPage = myUtil1.getPageCount(numPerPage, dataCount);

			if(currentPage > totalPage)
				currentPage = totalPage;

			int start = (currentPage-1)*numPerPage+1;
			int end = currentPage*numPerPage;

			List<FurnitureDTO> catelists = livingDao.cateSImageList(cateEn, start, end, searchValue);

			System.out.println("size of lists:" + catelists.size());

			//����¡ ó��
			String param = "";
			if(!searchValue.equals("")){
				param= "searchValue=" + URLEncoder.encode(searchValue, "UTF-8");
			}

			String listUrl = cp + "/living_shelf.fu?cateEn="+cateEn;
			
			if(!param.equals("")){
				listUrl = listUrl + "&" + param;	
				
			}

			String pageIndexList = myUtil1.pageIndexList(currentPage, totalPage, listUrl);

			ModelAndView mav = new ModelAndView();

//					List<FurnitureDTO> catelists = diningdao.getCateLists(cate,searchValue);

			mav.setViewName("product/living/shelf/living_shelf");
			mav.addObject("listUrl", listUrl);
			mav.addObject("lists", catelists);
			mav.addObject("pageNum",pageNum);
			mav.addObject("dataCount",dataCount);
			mav.addObject("pageIndexList", pageIndexList);
			mav.addObject("cateEn", cateEn);
			mav.addObject("searchValue", searchValue);

			return mav;
		}
		
		@RequestMapping(value = "/living_shelf_details.fu", method = {RequestMethod.GET,RequestMethod.POST})
		public ModelAndView living_shelf_details(HttpServletRequest request,int imageIndex,String cateEn) {
			
			ModelAndView mav = new ModelAndView();
			
			/*
			 * int imageIndex = Integer.parseInt(request.getParameter("imageIndex")); String
			 * cateE = request.getParameter("cateE");
			 */
		
			HashMap<String, Object> params = new HashMap<String, Object>();
			params.put("cateEn", cateEn);
			params.put("imageIndex", imageIndex);
			List<FurnitureDTO> Lists = livingDao.cateEImageList(params);
			
			FurnitureDTO dto = livingDao.getReadData(imageIndex,cateEn);
			System.out.println("test �Դϴ� "+dto.getSaveFileName());
			mav.setViewName("product/living/shelf/living_shelf_details");
			mav.addObject("dto", dto);
			mav.addObject("lists", Lists);
			
			return mav;
		}
		
		//---------------------------------------------------------------------
		//�����̽�
		@RequestMapping(value = "/living_bookcase.fu", method = {RequestMethod.GET,RequestMethod.POST})
		public ModelAndView living_bookcase(HttpServletRequest request, HttpServletResponse response) throws Exception {
			
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

			//��ü �����Ͱ���
			int dataCount = livingDao.getCateDataCount(cateEn, searchValue);


			System.out.println("number of all data: " + livingDao.getCateDataCount(cateEn,searchValue)); //

			//��ü ������ ��
			int numPerPage = 8;
			int totalPage = myUtil1.getPageCount(numPerPage, dataCount);

			if(currentPage > totalPage)
				currentPage = totalPage;

			int start = (currentPage-1)*numPerPage+1;
			int end = currentPage*numPerPage;

			List<FurnitureDTO> catelists = livingDao.cateSImageList(cateEn, start, end, searchValue);

			System.out.println("size of lists:" + catelists.size());

			//����¡ ó��
			String param = "";
			if(!searchValue.equals("")){
				param= "searchValue=" + URLEncoder.encode(searchValue, "UTF-8");
			}

			String listUrl = cp + "/living_bookcase.fu?cateEn="+cateEn;
			
			if(!param.equals("")){
				listUrl = listUrl + "&" + param;	
				
			}

			String pageIndexList = myUtil1.pageIndexList(currentPage, totalPage, listUrl);

			ModelAndView mav = new ModelAndView();

//					List<FurnitureDTO> catelists = diningdao.getCateLists(cate,searchValue);

			mav.setViewName("product/living/bookcase/living_bookcase");
			mav.addObject("listUrl", listUrl);
			mav.addObject("lists", catelists);
			mav.addObject("pageNum",pageNum);
			mav.addObject("dataCount",dataCount);
			mav.addObject("pageIndexList", pageIndexList);
			mav.addObject("cateEn", cateEn);
			mav.addObject("searchValue", searchValue);

			return mav;
		}
		
		@RequestMapping(value = "/living_bookcase_details.fu", method = {RequestMethod.GET,RequestMethod.POST})
		public ModelAndView living_bookcase_details(HttpServletRequest request,int imageIndex,String cateEn) {
			
			ModelAndView mav = new ModelAndView();
			
			/*
			 * int imageIndex = Integer.parseInt(request.getParameter("imageIndex")); String
			 * cateE = request.getParameter("cateE");
			 */
		
			HashMap<String, Object> params = new HashMap<String, Object>();
			params.put("cateEn", cateEn);
			params.put("imageIndex", imageIndex);
			List<FurnitureDTO> Lists = livingDao.cateEImageList(params);
			
			FurnitureDTO dto = livingDao.getReadData(imageIndex,cateEn);
			System.out.println("test �Դϴ� "+dto.getSaveFileName());
			mav.setViewName("product/living/bookcase/living_bookcase_details");
			mav.addObject("dto", dto);
			mav.addObject("lists", Lists);
			
			return mav;
		}

}
