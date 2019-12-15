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

import com.funi.dao.DecoDAO;
import com.funi.domain.FurnitureDTO;
import com.funi.util.MyUtil;
import com.funi.util.MyUtil1;

@Controller
public class DecoController {

	@Autowired
	@Qualifier("decodao")
	DecoDAO decodao;

	@Autowired
	@Qualifier("myUtil1")
	MyUtil1 myUtil1;

	@RequestMapping(value = "/decoupload.fu", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView decoupload() {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("decoupload");

		return mav;
	}

	@RequestMapping(value = "/decoupload_ok.fu", method = { RequestMethod.GET, RequestMethod.POST })
	public String decoupload_ok(MultipartHttpServletRequest request, HttpServletResponse response, String str) {

		MultipartFile file = request.getFile("decoImageUpload");

		FurnitureDTO dto = new FurnitureDTO();
		dto.setImageIndex(Integer.parseInt(request.getParameter("imageIndex")));
		dto.setProductName(request.getParameter("productName"));
		dto.setCate(request.getParameter("cate"));
		dto.setCateEn(request.getParameter("cateEn"));
		dto.setPrice(request.getParameter("price"));
		dto.setSaveFileName(file.getOriginalFilename());

		decodao.insertData(dto);

		// 실제경로:
		// D:\sts-bundle\work\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\HotelWebService\event
		Path path1 = Paths.get("D:\\sts-bundle\\work\\FurnitureWeb\\src\\main\\webapp\\resources\\images\\deco");

		String path = request.getSession().getServletContext().getRealPath("/image/deco");

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

		return "redirect:/decoupload.fu";
	}


	@RequestMapping(value = "/decofull.fu", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView decofull(HttpServletRequest request) throws Exception {

		//페이징 & 검색
		String cp = request.getContextPath();

		String pageNum = request.getParameter("pageNum");
		int currentPage = 1;

		if (pageNum != null) {
			currentPage = Integer.parseInt(pageNum);
		}

		String searchValue = request.getParameter("searchValue");

		if (searchValue == null) {

			searchValue = "";

		} else {

			if (request.getMethod().equalsIgnoreCase("GET"))
				searchValue = URLDecoder.decode(searchValue, "UTF-8");

		}

		System.out.println("test searchValue: " + searchValue);

		//전체 데이터 갯수
		int dataCount = decodao.getDataCount(searchValue);

		System.out.println("number of all data: " + decodao.getDataCount(searchValue)); // 27

		//전체 페이지 수
		int numPerPage = 12;
		int totalPage = myUtil1.getPageCount(numPerPage, dataCount);

		if (currentPage > totalPage)
			currentPage = totalPage;

		int start = (currentPage - 1) * numPerPage + 1;
		int end = currentPage * numPerPage;

		List<FurnitureDTO> lists = decodao.getLists(start, end, searchValue);

		//페이징 처리
		String param = "";
		if (!searchValue.equals("")) {
			param = "searchValue=" + URLEncoder.encode(searchValue, "UTF-8");
		}

		String listUrl = cp + "/decofull.fu";
		if (!param.equals("")) {
			listUrl = listUrl + "?" + param;
		}

		String pageIndexList = myUtil1.pageIndexList(currentPage, totalPage, listUrl);
		/////////////////////////////////////////////////////////////////
		System.out.println("test2");

		/*
		//글보기 주소 정리
		String DecoUrl = 
			cp + "/deco_" + dto.getCateEn() +"_details?pageNum=" + currentPage;

		if(!param.equals(""))
			articleUrl = articleUrl + "&" + param;
		 */

		ModelAndView mav = new ModelAndView();

		System.out.println("size of lists:"+lists.size());
		mav.setViewName("product/deco/decofull");
		mav.addObject("lists", lists);
		mav.addObject("dataCount", dataCount);
		mav.addObject("pageIndexList", pageIndexList);
		mav.addObject("pageNum", pageNum);

		return mav;

	}

	@RequestMapping(value = "/deco_monthly.fu", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView deco_monthlly(HttpServletRequest request) throws Exception {

		//페이징 & 검색
		String cp = request.getContextPath();
		
		String pageNum = request.getParameter("pageNum");
		String cateEn = request.getParameter("cateEn");
		
		int currentPage = 1;

		if (pageNum != null) {
			currentPage = Integer.parseInt(pageNum);
		}

		String searchValue = request.getParameter("searchValue");

		if (searchValue == null) {

			searchValue = "";

		} else {

			if (request.getMethod().equalsIgnoreCase("GET"))
				searchValue = URLDecoder.decode(searchValue, "UTF-8");

		}

		System.out.println("test searchValue: " + searchValue);

		//전체 데이터 갯수
		int dataCount = decodao.getCateDataCount(cateEn,searchValue);

		System.out.println("number of all data: " + decodao.getCateDataCount(cateEn,searchValue));

		//전체 페이지 수
		int numPerPage = 8;
		int totalPage = myUtil1.getPageCount(numPerPage, dataCount);

		if (currentPage > totalPage)
			currentPage = totalPage;

		int start = (currentPage - 1) * numPerPage + 1;
		int end = currentPage * numPerPage;

		List<FurnitureDTO> catelists = decodao.getCateLists(cateEn, searchValue, start, end);
		
		System.out.println("size of catelists:"+catelists.size());

		//페이징 처리
		String param = "";
		if (!searchValue.equals("")) {
			param = "searchValue=" + URLEncoder.encode(searchValue, "UTF-8");
		}

		String listUrl = cp + "/deco_monthly.fu?&cateEn="+cateEn;
		if (!param.equals("")) {
			listUrl = listUrl + "?" + param;
		}

		String pageIndexList = myUtil1.pageIndexList(currentPage, totalPage, listUrl);
		/////////////////////////////////////////////////////////////////
		System.out.println("test2");

		/*
		//글보기 주소 정리
		String DecoUrl = 
			cp + "/deco_" + dto.getCateEn() +"_details?pageNum=" + currentPage;

		if(!param.equals(""))
			articleUrl = articleUrl + "&" + param;
		 */

		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("product/deco/monthly/deco_monthly");
		mav.addObject("catelists", catelists);
		mav.addObject("dataCount", dataCount);
		mav.addObject("pageIndexList", pageIndexList);
		mav.addObject("pageNum", pageNum);
		
		mav.addObject("searchValue", searchValue);
		mav.addObject("cateEn", cateEn);

		return mav;
	}

	@RequestMapping(value = "/deco_monthly_details.fu", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView deco_monthly_details(HttpServletRequest request) {

		ModelAndView mav = new ModelAndView();

		int imageIndex = Integer.parseInt(request.getParameter("imageIndex"));
		String cateEn = request.getParameter("cateEn");

		List<FurnitureDTO> catelists = decodao.getDetailLists(cateEn);

		FurnitureDTO dto = decodao.getReadData(imageIndex, cateEn);

		mav.setViewName("product/deco/monthly/deco_monthly_details");
		mav.addObject("dto", dto);
		mav.addObject("catelists", catelists);

		return mav;
	}

	@RequestMapping(value = "/deco_light.fu", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView deco_light(HttpServletRequest request) throws Exception {

		//페이징 & 검색
		String cp = request.getContextPath();
		
		String pageNum = request.getParameter("pageNum");
		String cateEn = request.getParameter("cateEn");
		
		int currentPage = 1;

		if (pageNum != null) {
			currentPage = Integer.parseInt(pageNum);
		}

		String searchValue = request.getParameter("searchValue");

		if (searchValue == null) {

			searchValue = "";

		} else {

			if (request.getMethod().equalsIgnoreCase("GET"))
				searchValue = URLDecoder.decode(searchValue, "UTF-8");

		}

		System.out.println("test searchValue: " + searchValue);

		//전체 데이터 갯수
		int dataCount = decodao.getCateDataCount(cateEn,searchValue);

		System.out.println("number of all data: " + decodao.getCateDataCount(cateEn,searchValue));

		//전체 페이지 수
		int numPerPage = 8;
		int totalPage = myUtil1.getPageCount(numPerPage, dataCount);

		if (currentPage > totalPage)
			currentPage = totalPage;

		int start = (currentPage - 1) * numPerPage + 1;
		int end = currentPage * numPerPage;

		List<FurnitureDTO> catelists = decodao.getCateLists(cateEn, searchValue, start, end);
		
		System.out.println("size of catelists:"+catelists.size());

		//페이징 처리
		String param = "";
		if (!searchValue.equals("")) {
			param = "searchValue=" + URLEncoder.encode(searchValue, "UTF-8");
		}

		String listUrl = cp + "/deco_light.fu?&cateEn="+cateEn;
		if (!param.equals("")) {
			listUrl = listUrl + "?" + param;
		}

		String pageIndexList = myUtil1.pageIndexList(currentPage, totalPage, listUrl);
		/////////////////////////////////////////////////////////////////
		System.out.println("test2");

		/*
		//글보기 주소 정리
		String DecoUrl = 
			cp + "/deco_" + dto.getCateEn() +"_details?pageNum=" + currentPage;

		if(!param.equals(""))
			articleUrl = articleUrl + "&" + param;
		 */

		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("product/deco/light/deco_light");
		mav.addObject("catelists", catelists);
		mav.addObject("dataCount", dataCount);
		mav.addObject("pageIndexList", pageIndexList);
		mav.addObject("pageNum", pageNum);
		
		mav.addObject("searchValue", searchValue);
		mav.addObject("cateEn", cateEn);

		return mav;

	}

	@RequestMapping(value = "/deco_light_details.fu", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView deco_light_details(HttpServletRequest request) {

		ModelAndView mav = new ModelAndView();

		int imageIndex = Integer.parseInt(request.getParameter("imageIndex"));
		String cateEn = request.getParameter("cateEn");

		List<FurnitureDTO> catelists = decodao.getDetailLists(cateEn);

		FurnitureDTO dto = decodao.getReadData(imageIndex, cateEn);

		mav.setViewName("product/deco/light/deco_light_details");
		mav.addObject("dto", dto);
		mav.addObject("catelists", catelists);

		return mav;
	}

	@RequestMapping(value = "/deco_plasticch.fu", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView deco_plasticch(HttpServletRequest request) throws Exception {

		//페이징 & 검색
		String cp = request.getContextPath();
		
		String pageNum = request.getParameter("pageNum");
		String cateEn = request.getParameter("cateEn");
		
		int currentPage = 1;

		if (pageNum != null) {
			currentPage = Integer.parseInt(pageNum);
		}

		String searchValue = request.getParameter("searchValue");

		if (searchValue == null) {

			searchValue = "";

		} else {

			if (request.getMethod().equalsIgnoreCase("GET"))
				searchValue = URLDecoder.decode(searchValue, "UTF-8");

		}

		System.out.println("test searchValue: " + searchValue);

		//전체 데이터 갯수
		int dataCount = decodao.getCateDataCount(cateEn,searchValue);

		System.out.println("number of all data: " + decodao.getCateDataCount(cateEn,searchValue));

		//전체 페이지 수
		int numPerPage = 8;
		int totalPage = myUtil1.getPageCount(numPerPage, dataCount);

		if (currentPage > totalPage)
			currentPage = totalPage;

		int start = (currentPage - 1) * numPerPage + 1;
		int end = currentPage * numPerPage;

		List<FurnitureDTO> catelists = decodao.getCateLists(cateEn, searchValue, start, end);
		
		System.out.println("size of catelists:"+catelists.size());

		//페이징 처리
		String param = "";
		if (!searchValue.equals("")) {
			param = "searchValue=" + URLEncoder.encode(searchValue, "UTF-8");
		}

		String listUrl = cp + "/deco_plasticch.fu?&cateEn="+cateEn;
		if (!param.equals("")) {
			listUrl = listUrl + "?" + param;
		}

		String pageIndexList = myUtil1.pageIndexList(currentPage, totalPage, listUrl);
		/////////////////////////////////////////////////////////////////
		System.out.println("test2");

		/*
		//글보기 주소 정리
		String DecoUrl = 
			cp + "/deco_" + dto.getCateEn() +"_details?pageNum=" + currentPage;

		if(!param.equals(""))
			articleUrl = articleUrl + "&" + param;
		 */

		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("product/deco/plasticch/deco_plasticch");
		mav.addObject("catelists", catelists);
		mav.addObject("dataCount", dataCount);
		mav.addObject("pageIndexList", pageIndexList);
		mav.addObject("pageNum", pageNum);
		
		mav.addObject("searchValue", searchValue);
		mav.addObject("cateEn", cateEn);

		return mav;

	}

	@RequestMapping(value = "/deco_plasticch_details.fu", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView deco_plasticch_details(HttpServletRequest request) {

		ModelAndView mav = new ModelAndView();

		int imageIndex = Integer.parseInt(request.getParameter("imageIndex"));
		String cateEn = request.getParameter("cateEn");

		List<FurnitureDTO> catelists = decodao.getDetailLists(cateEn);

		FurnitureDTO dto = decodao.getReadData(imageIndex, cateEn);

		mav.setViewName("product/deco/plasticch/deco_plasticch_details");
		mav.addObject("dto", dto);
		mav.addObject("catelists", catelists);

		return mav;

	}


}
