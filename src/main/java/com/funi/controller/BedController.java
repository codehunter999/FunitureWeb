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

import com.funi.dao.BedDAO;
import com.funi.domain.FurnitureDTO;

@Controller
public class BedController {
	
	@Autowired
	@Qualifier("BedDAO")
	BedDAO bedDao;
	
	// <침실파트>
		// 침실 total
		@RequestMapping(value = "/bed_total.fu", method = { RequestMethod.GET, RequestMethod.POST })
		public ModelAndView bed_total(HttpServletRequest request) throws Exception {

			ModelAndView mav = new ModelAndView();

			List<FurnitureDTO> lists = bedDao.bedImageList();
			// System.out.println("lists"+lists.size());
			mav.setViewName("product/bed/bed_total");
			mav.addObject("lists", lists);

			return mav;
		}

		@RequestMapping(value = "/bed_bed.fu", method = { RequestMethod.GET, RequestMethod.POST })
		public ModelAndView bed_bed(HttpServletRequest request, HttpServletResponse response, String cateEn) {

			ModelAndView mav = new ModelAndView();
			System.out.println(cateEn);
			HashMap<String, Object> bedMap = new HashMap<String, Object>();
			bedMap.put("cateEn", cateEn);
			List<FurnitureDTO> bedlists = bedDao.cateEImageList(bedMap);
			mav.setViewName("product/bed/bed/bed_bed");
			mav.addObject("Blists", bedlists);

			return mav;

		}

		@RequestMapping(value = "/bed_BED_details.fu", method = { RequestMethod.GET, RequestMethod.POST })
		public ModelAndView bed_BED_details(HttpServletRequest request, int imageIndex, String cateEn) {

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

			FurnitureDTO dto = bedDao.getReadData(imageIndex, cateEn);
			System.out.println("test 입니다 " + dto.getSaveFileName());
			mav.setViewName("product/bed/bed/bed_BED_details");
			mav.addObject("dto", dto);
			mav.addObject("Blists", Lists);

			return mav;
		}

		// ----------------------------------------------------------

		@RequestMapping(value = "/bed_ht.fu", method = { RequestMethod.GET, RequestMethod.POST })
		public ModelAndView bed_ht(Locale locale, Model model, String cateEn) {

			ModelAndView mav = new ModelAndView();
			System.out.println(cateEn);
			HashMap<String, Object> bedMap = new HashMap<String, Object>();
			bedMap.put("cateEn", cateEn);
			List<FurnitureDTO> bedlists = bedDao.cateEImageList(bedMap);
			mav.setViewName("product/bed/ht/bed_ht");
			mav.addObject("Blists", bedlists);

			return mav;
		}

		@RequestMapping(value = "/bed_ht_details.fu", method = { RequestMethod.GET, RequestMethod.POST })
		public ModelAndView bed_ht_details(HttpServletRequest request, int imageIndex, String cateEn) {

			ModelAndView mav = new ModelAndView();

			HashMap<String, Object> params = new HashMap<String, Object>();
			params.put("cateEn", cateEn);
			params.put("imageIndex", imageIndex);

			List<FurnitureDTO> bLists = bedDao.cateEImageList(params);
			FurnitureDTO dto = bedDao.getReadData(imageIndex, cateEn);
			System.out.println("test 입니다 " + dto.getSaveFileName());
			mav.setViewName("product/bed/ht/bed_ht_details");
			mav.addObject("dto", dto);
			mav.addObject("Blists", bLists);

			return mav;
		}

		// ----------------------------------------------------------

		@RequestMapping(value = "/bed_dressingTable.fu", method = { RequestMethod.GET, RequestMethod.POST })
		public ModelAndView bed_dressingTable(Locale locale, Model model, String cateEn) {

			ModelAndView mav = new ModelAndView();
			System.out.println(cateEn);
			HashMap<String, Object> bedMap = new HashMap<String, Object>();
			bedMap.put("cateEn", cateEn);
			List<FurnitureDTO> bedlists = bedDao.cateEImageList(bedMap);
			mav.setViewName("product/bed/dressing/bed_dressingTable");
			mav.addObject("Blists", bedlists);

			return mav;

		}

		@RequestMapping(value = "/bed_dressingTable_details.fu", method = { RequestMethod.GET, RequestMethod.POST })
		public ModelAndView bed_dressingTable_details(HttpServletRequest request, int imageIndex, String cateEn) {

			ModelAndView mav = new ModelAndView();

			HashMap<String, Object> params = new HashMap<String, Object>();
			params.put("cateEn", cateEn);
			params.put("imageIndex", imageIndex);

			List<FurnitureDTO> bedlists = bedDao.cateEImageList(params);

			FurnitureDTO dto = bedDao.getReadData(imageIndex, cateEn);
			System.out.println("test 입니다 " + dto.getSaveFileName());
			mav.setViewName("product/bed/dressing/bed_dressingTable_details");
			mav.addObject("dto", dto);
			mav.addObject("Blists", bedlists);

			return mav;
		}

		// ----------------------------------------------------------

		@RequestMapping(value = "/bed_chiff.fu", method = { RequestMethod.GET, RequestMethod.POST })
		public ModelAndView bed_chiff(Locale locale, Model model, String cateEn) {

			ModelAndView mav = new ModelAndView();
			System.out.println(cateEn);
			HashMap<String, Object> bedMap = new HashMap<String, Object>();
			bedMap.put("cateEn", cateEn);
			List<FurnitureDTO> bedlists = bedDao.cateEImageList(bedMap);
			mav.setViewName("product/bed/chiff/bed_chiff");
			mav.addObject("Blists", bedlists);

			return mav;
		}

		@RequestMapping(value = "/bed_chiff_details.fu", method = { RequestMethod.GET, RequestMethod.POST })
		public ModelAndView bed_chiff_details(HttpServletRequest request, int imageIndex, String cateEn) {

			ModelAndView mav = new ModelAndView();

			HashMap<String, Object> params = new HashMap<String, Object>();
			params.put("cateEn", cateEn);
			params.put("imageIndex", imageIndex);
			System.out.println("");
			List<FurnitureDTO> Lists = bedDao.cateEImageList(params);

			FurnitureDTO dto = bedDao.getReadData(imageIndex, cateEn);
			System.out.println("test 입니다 " + dto.getSaveFileName());
			mav.setViewName("product/bed/chiff/bed_chiff_details");
			mav.addObject("dto", dto);
			mav.addObject("Blists", Lists);

			return mav;
		}

}
