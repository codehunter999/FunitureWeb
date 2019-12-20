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

import com.funi.dao.EventDAO;
import com.funi.domain.FurnitureDTO;
import com.funi.util.MyUtil;
import com.funi.util.MyUtil1;

@Controller
public class EventController {

	@Autowired
	@Qualifier("eventdao")
	EventDAO eventdao;

	@Autowired
	@Qualifier("myUtil1")
	MyUtil1 myUtil1;

	@RequestMapping(value = "/eventupload.fu", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView eventupload() {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("eventupload");

		return mav;
	}

	@RequestMapping(value = "/eventupload_ok.fu", method = { RequestMethod.GET, RequestMethod.POST })
	public String eventupload_ok(MultipartHttpServletRequest request, HttpServletResponse response, String str) {

		MultipartFile file = request.getFile("eventImageUpload");

		FurnitureDTO dto = new FurnitureDTO();
		dto.setImageIndex(Integer.parseInt(request.getParameter("imageIndex")));
		dto.setProductName(request.getParameter("productName"));
		dto.setCate(request.getParameter("cate"));
		dto.setCateEn(request.getParameter("cateEn"));
		dto.setPrice(request.getParameter("price"));
		dto.setSaveFileName(file.getOriginalFilename());

		eventdao.insertData(dto);

		
		//D:\sts-bundle\work\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\furnitureproject\resources\images\event
		Path path1 = Paths.get("D:\\sts-bundle\\work\\FurnitureWeb\\src\\main\\webapp\\resources\\images\\event");

		String path = request.getSession().getServletContext().getRealPath("/images/event");

		if (file != null && file.getSize() > 0) { 

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

		return "redirect:/eventupload.fu";
	}


	@RequestMapping(value = "/event_list.fu", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView event_list(HttpServletRequest request) throws Exception {

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

		//전체 데이터갯수
		int dataCount = eventdao.getDataCount(searchValue);

		System.out.println("number of all data: " + eventdao.getDataCount(searchValue)); // 27

		//전체 페이지수
		int numPerPage = 8;
		int totalPage = myUtil1.getPageCount(numPerPage, dataCount);

		if (currentPage > totalPage)
			currentPage = totalPage;

		int start = (currentPage - 1) * numPerPage + 1;
		int end = currentPage * numPerPage;

		List<FurnitureDTO> lists = eventdao.getLists(start, end, searchValue);

		//페이징 처리
		String param = "";
		if (!searchValue.equals("")) {
			param = "searchValue=" + URLEncoder.encode(searchValue, "UTF-8");
		}

		String listUrl = cp + "/event_list.fu";
		if (!param.equals("")) {
			listUrl = listUrl + "?" + param;
		}

		String pageIndexList = myUtil1.pageIndexList(currentPage, totalPage, listUrl);
		/////////////////////////////////////////////////////////////////
		System.out.println("test2");

		/*
		//글보기 주소 정리
		String eventUrl = 
			cp + "/event_" + dto.getCateEn() +"_details?pageNum=" + currentPage;

		if(!param.equals(""))
			articleUrl = articleUrl + "&" + param;
		 */

		ModelAndView mav = new ModelAndView();

		System.out.println("size of lists:"+lists.size());
		mav.setViewName("event/event_list");
		mav.addObject("lists", lists);
		mav.addObject("dataCount", dataCount);
		mav.addObject("pageIndexList", pageIndexList);
		mav.addObject("pageNum", pageNum);
		
		mav.addObject("searchValue", searchValue);

		return mav;

	}


	@RequestMapping(value = "/event_details.fu", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView event_details(HttpServletRequest request) {

		ModelAndView mav = new ModelAndView();

		int imageIndex = Integer.parseInt(request.getParameter("imageIndex"));

		String cateEn = request.getParameter("cateEn");
		List<FurnitureDTO> catelists = eventdao.getDetailLists(cateEn);

		FurnitureDTO dto = eventdao.getReadData(imageIndex, cateEn);

		mav.setViewName("event/event_details");
		mav.addObject("dto", dto);
		mav.addObject("catelists", catelists);

		return mav;
	}


}
