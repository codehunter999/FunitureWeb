package com.funi.controller;

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

@Controller
public class LivingController {

	@Autowired
	@Qualifier("LivingDAO")
	LivingDAO livingDao;

	@Autowired
	@Qualifier("myUtil")
	MyUtil myUtil;

	// <거실파트>
	// 거실 total
	@RequestMapping(value = "/living_total.fu", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView living_total(Locale locale, Model model) {
		ModelAndView mav = new ModelAndView();

		List<FurnitureDTO> lists = livingDao.livingImageList();
		// System.out.println("lists"+lists.size());
		mav.setViewName("product/living/living_total");
		mav.addObject("lists", lists);

		return mav;
	}

	// ---------------------------------------------------------------------
	// 선브렐라
	// cateEn이 null
	@RequestMapping(value = "/living_sunb.fu", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView living_sunb(HttpServletRequest request, HttpServletResponse response, String cateEn) {

		ModelAndView mav = new ModelAndView();
		System.out.println(cateEn);
		HashMap<String, Object> livingMap = new HashMap<String, Object>();
		livingMap.put("cateEn", cateEn);
		System.out.println(cateEn);

		List<FurnitureDTO> lists = livingDao.cateEImageList(livingMap);
		mav.setViewName("product/living/sunb/living_sunb");
		mav.addObject("lists", lists);

		return mav;

	}

	@RequestMapping(value = "/living_sunb_details.fu", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView living_sunb_details(HttpServletRequest request, int imageIndex, String cateEn) {

		ModelAndView mav = new ModelAndView();

		/*
		 * int imageIndex = Integer.parseInt(request.getParameter("imageIndex")); String
		 * cateE = request.getParameter("cateE");
		 */

		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("cateEn", cateEn);
		params.put("imageIndex", imageIndex);
		List<FurnitureDTO> Lists = livingDao.cateEImageList(params);

		FurnitureDTO dto = livingDao.getReadData(imageIndex, cateEn);
		System.out.println("test 입니다 " + dto.getSaveFileName());
		mav.setViewName("product/living/sunb/living_sunb_details");
		mav.addObject("dto", dto);
		mav.addObject("lists", Lists);

		return mav;
	}

	// ---------------------------------------------------------------------

	// 패브릭
	@RequestMapping(value = "/living_fabric.fu", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView living_fabric(HttpServletRequest request, HttpServletResponse response, String cateEn) {

		ModelAndView mav = new ModelAndView();
		System.out.println(cateEn);
		HashMap<String, Object> livingMap = new HashMap<String, Object>();
		livingMap.put("cateEn", cateEn);
		System.out.println(cateEn);

		List<FurnitureDTO> lists = livingDao.cateEImageList(livingMap);
		mav.setViewName("product/living/fabric/living_fabric");
		mav.addObject("lists", lists);

		return mav;
	}

	@RequestMapping(value = "/living_fabric_details.fu", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView living_fabric_details(HttpServletRequest request, int imageIndex, String cateEn) {

		ModelAndView mav = new ModelAndView();

		/*
		 * int imageIndex = Integer.parseInt(request.getParameter("imageIndex")); String
		 * cateE = request.getParameter("cateE");
		 */

		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("cateEn", cateEn);
		params.put("imageIndex", imageIndex);
		List<FurnitureDTO> Lists = livingDao.cateEImageList(params);

		FurnitureDTO dto = livingDao.getReadData(imageIndex, cateEn);
		System.out.println("test 입니다 " + dto.getSaveFileName());
		mav.setViewName("product/living/fabric/living_fabric_details");
		mav.addObject("dto", dto);
		mav.addObject("lists", Lists);

		return mav;
	}

	// ---------------------------------------------------------------------
	// 가죽
	@RequestMapping(value = "/living_leather.fu", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView living_leather(HttpServletRequest request, HttpServletResponse response, String cateEn) {

		ModelAndView mav = new ModelAndView();
		System.out.println(cateEn);
		HashMap<String, Object> livingMap = new HashMap<String, Object>();
		livingMap.put("cateEn", cateEn);
		System.out.println(cateEn);

		List<FurnitureDTO> lists = livingDao.cateEImageList(livingMap);
		mav.setViewName("product/living/leather/living_leather");
		mav.addObject("lists", lists);

		return mav;
	}

	@RequestMapping(value = "/living_leather_details.fu", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView living_leather_details(HttpServletRequest request, int imageIndex, String cateEn) {

		ModelAndView mav = new ModelAndView();

		/*
		 * int imageIndex = Integer.parseInt(request.getParameter("imageIndex")); String
		 * cateE = request.getParameter("cateE");
		 */

		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("cateEn", cateEn);
		params.put("imageIndex", imageIndex);
		List<FurnitureDTO> Lists = livingDao.cateEImageList(params);

		FurnitureDTO dto = livingDao.getReadData(imageIndex, cateEn);
		System.out.println("test 입니다 " + dto.getSaveFileName());
		mav.setViewName("product/living/leather/living_leather_details");
		mav.addObject("dto", dto);
		mav.addObject("lists", Lists);

		return mav;
	}

	// ---------------------------------------------------------------------
	// 데우스
	@RequestMapping(value = "/living_deus.fu", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView living_deus(HttpServletRequest request, HttpServletResponse response, String cateEn) {

		ModelAndView mav = new ModelAndView();
		System.out.println(cateEn);
		HashMap<String, Object> livingMap = new HashMap<String, Object>();
		livingMap.put("cateEn", cateEn);
		System.out.println(cateEn);

		List<FurnitureDTO> lists = livingDao.cateEImageList(livingMap);
		mav.setViewName("product/living/deus/living_deus");
		mav.addObject("lists", lists);

		return mav;
	}

	@RequestMapping(value = "/living_deus_details.fu", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView living_deus_details(HttpServletRequest request, int imageIndex, String cateEn) {

		ModelAndView mav = new ModelAndView();

		/*
		 * int imageIndex = Integer.parseInt(request.getParameter("imageIndex")); String
		 * cateE = request.getParameter("cateE");
		 */

		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("cateEn", cateEn);
		params.put("imageIndex", imageIndex);
		List<FurnitureDTO> Lists = livingDao.cateEImageList(params);

		FurnitureDTO dto = livingDao.getReadData(imageIndex, cateEn);
		System.out.println("test 입니다 " + dto.getSaveFileName());
		mav.setViewName("product/living/deus/living_deus_details");
		mav.addObject("dto", dto);
		mav.addObject("lists", Lists);

		return mav;
	}

	// ---------------------------------------------------------------------
	// 사이드 테이블
	@RequestMapping(value = "/living_sideTable.fu", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView living_sideTable(HttpServletRequest request, HttpServletResponse response, String cateEn) {

		ModelAndView mav = new ModelAndView();
		System.out.println(cateEn);
		HashMap<String, Object> livingMap = new HashMap<String, Object>();
		livingMap.put("cateEn", cateEn);
		System.out.println(cateEn);

		List<FurnitureDTO> lists = livingDao.cateEImageList(livingMap);
		mav.setViewName("product/living/sideTable/living_sideTable");
		mav.addObject("lists", lists);

		return mav;
	}

	@RequestMapping(value = "/living_sideTable_details.fu", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView living_sideTable_details(HttpServletRequest request, int imageIndex, String cateEn) {

		ModelAndView mav = new ModelAndView();

		/*
		 * int imageIndex = Integer.parseInt(request.getParameter("imageIndex")); String
		 * cateE = request.getParameter("cateE");
		 */

		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("cateEn", cateEn);
		params.put("imageIndex", imageIndex);
		List<FurnitureDTO> Lists = livingDao.cateEImageList(params);

		FurnitureDTO dto = livingDao.getReadData(imageIndex, cateEn);
		System.out.println("test 입니다 " + dto.getSaveFileName());
		mav.setViewName("product/living/sideTable/living_sideTable_details");
		mav.addObject("dto", dto);
		mav.addObject("lists", Lists);

		return mav;
	}

	// ---------------------------------------------------------------------
	// 티비 장
	@RequestMapping(value = "/living_TV.fu", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView living_TV(HttpServletRequest request, HttpServletResponse response, String cateEn) {

		ModelAndView mav = new ModelAndView();
		System.out.println(cateEn);
		HashMap<String, Object> livingMap = new HashMap<String, Object>();
		livingMap.put("cateEn", cateEn);
		System.out.println(cateEn);

		List<FurnitureDTO> lists = livingDao.cateEImageList(livingMap);
		mav.setViewName("product/living/TV/living_TV");
		mav.addObject("lists", lists);

		return mav;
	}

	@RequestMapping(value = "/living_TV_details.fu", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView living_TV_details(HttpServletRequest request, int imageIndex, String cateEn) {

		ModelAndView mav = new ModelAndView();

		/*
		 * int imageIndex = Integer.parseInt(request.getParameter("imageIndex")); String
		 * cateE = request.getParameter("cateE");
		 */

		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("cateEn", cateEn);
		params.put("imageIndex", imageIndex);
		List<FurnitureDTO> Lists = livingDao.cateEImageList(params);

		FurnitureDTO dto = livingDao.getReadData(imageIndex, cateEn);
		System.out.println("test 입니다 " + dto.getSaveFileName());
		mav.setViewName("product/living/TV/living_TV_details");
		mav.addObject("dto", dto);
		mav.addObject("lists", Lists);

		return mav;
	}

	// ---------------------------------------------------------------------
	// 선반
	@RequestMapping(value = "/living_shelf.fu", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView living_shelf(HttpServletRequest request, HttpServletResponse response, String cateEn) {

		ModelAndView mav = new ModelAndView();
		System.out.println(cateEn);
		HashMap<String, Object> livingMap = new HashMap<String, Object>();
		livingMap.put("cateEn", cateEn);
		System.out.println(cateEn);

		List<FurnitureDTO> lists = livingDao.cateEImageList(livingMap);
		mav.setViewName("product/living/shelf/living_shelf");
		mav.addObject("lists", lists);

		return mav;
	}

	@RequestMapping(value = "/living_shelf_details.fu", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView living_shelf_details(HttpServletRequest request, int imageIndex, String cateEn) {

		ModelAndView mav = new ModelAndView();

		/*
		 * int imageIndex = Integer.parseInt(request.getParameter("imageIndex")); String
		 * cateE = request.getParameter("cateE");
		 */

		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("cateEn", cateEn);
		params.put("imageIndex", imageIndex);
		List<FurnitureDTO> Lists = livingDao.cateEImageList(params);

		FurnitureDTO dto = livingDao.getReadData(imageIndex, cateEn);
		System.out.println("test 입니다 " + dto.getSaveFileName());
		mav.setViewName("product/living/shelf/living_shelf_details");
		mav.addObject("dto", dto);
		mav.addObject("lists", Lists);

		return mav;
	}

	// ---------------------------------------------------------------------
	// 북케이스
	@RequestMapping(value = "/living_bookcase.fu", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView living_bookcase(HttpServletRequest request, HttpServletResponse response, String cateEn) {

		ModelAndView mav = new ModelAndView();
		System.out.println(cateEn);
		HashMap<String, Object> livingMap = new HashMap<String, Object>();
		livingMap.put("cateEn", cateEn);
		System.out.println(cateEn);

		List<FurnitureDTO> lists = livingDao.cateEImageList(livingMap);
		mav.setViewName("product/living/bookcase/living_bookcase");
		mav.addObject("lists", lists);

		return mav;
	}

	@RequestMapping(value = "/living_bookcase_details.fu", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView living_bookcase_details(HttpServletRequest request, int imageIndex, String cateEn) {

		ModelAndView mav = new ModelAndView();

		/*
		 * int imageIndex = Integer.parseInt(request.getParameter("imageIndex")); String
		 * cateE = request.getParameter("cateE");
		 */

		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("cateEn", cateEn);
		params.put("imageIndex", imageIndex);
		List<FurnitureDTO> Lists = livingDao.cateEImageList(params);

		FurnitureDTO dto = livingDao.getReadData(imageIndex, cateEn);
		System.out.println("test 입니다 " + dto.getSaveFileName());
		mav.setViewName("product/living/bookcase/living_bookcase_details");
		mav.addObject("dto", dto);
		mav.addObject("lists", Lists);

		return mav;
	}

}
