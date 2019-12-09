package com.funi.controller;

import java.io.FileOutputStream;
import java.io.InputStream;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.funi.dao.QnADAO;
import com.funi.dao.ReviewDAO;
import com.funi.domain.QnADTO;
import com.funi.domain.Re_QnADTO;
import com.funi.domain.Re_ReviewDTO;
import com.funi.domain.ReviewDTO;
import com.funi.util.MyUtil;
import com.funi.util.MyUtil1;

@Controller
public class ReviewController {
	
	@Autowired
	@Qualifier("qnadao")
	QnADAO qnadao;

	@Autowired
	@Qualifier("reviewdao")
	ReviewDAO reviewdao;
	
	@Autowired
	@Qualifier("myUtil")
	MyUtil myUtil;
	
	@Autowired
	@Qualifier("myUtil1")
	MyUtil1 myUtil1;
	
	// REVIEW PART
	@RequestMapping(value = "/qnamain.fu", method = { RequestMethod.GET, RequestMethod.POST })
	public String qnamain(HttpServletRequest request, Locale locale, Model model) {
		String cp = request.getContextPath();
		String pageNum = request.getParameter("pageNum");
		int currentPage = 1;

		if (pageNum != null)
			currentPage = Integer.parseInt(pageNum);

		// �뜝�룞�삕泥닷뜝�룞�삕�뜝�룞�삕�뜝�떢怨ㅼ삕�뜝�룞�삕
		int dataCount = qnadao.getDataCount();

		// �뜝�룞�삕泥닷뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕
		int numPerPage = 5;
		int totalPage = myUtil.getPageCount(numPerPage, dataCount);

		if (currentPage > totalPage)
			currentPage = totalPage;

		int start = (currentPage - 1) * numPerPage + 1;
		int end = currentPage * numPerPage;
		List<QnADTO> lists = qnadao.getList(start, end);

		String listUrl = cp + "/qnamain.fu";

		String pageIndexList = myUtil1.pageIndexList(currentPage, totalPage, listUrl);

		// �뜝�뙗釉앹삕�뜝�룞�삕 �뜝�뙇�눦�삕 �뜝�룞�삕�뜝�룞�삕
		String articleUrl = cp + "/qnamain.fu?pageNum=" + currentPage;

		// �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕�뜝�떢紐뚯삕
		// �뜝�떬源띿삕�뜝占�
		request.setAttribute("lists", lists);
		request.setAttribute("pageIndexList", pageIndexList);
		request.setAttribute("dataCount", dataCount);
		request.setAttribute("articleUrl", articleUrl);

		return "qna/qnamain";
	}

	@RequestMapping(value = "/qnawrite.fu", method = { RequestMethod.GET, RequestMethod.POST })
	public String qnawrite(QnADTO dto, HttpServletRequest request, Locale locale, Model model, HttpSession session) {

		dto.setId(qnadao.getMAXID() + 1);
		dto.setIpaddr(request.getRemoteAddr());
		dto.setName((String)session.getAttribute("name"));
		qnadao.insertData(dto);

		return "redirect:/qnamain.fu";
	}

	@RequestMapping(value = "/qnaarticle.fu", method = { RequestMethod.GET, RequestMethod.POST })
	public String qnaview(HttpServletRequest request, Locale locale, Model model) {
		QnADTO dto = qnadao.getReadData(Integer.valueOf(request.getParameter("id")));
		request.setAttribute("dto", dto);
		List<Re_QnADTO> lists = qnadao.Re_getList(dto.getId());
		request.setAttribute("lists", lists);
		return "qna/qnaarticle";
	}

	@RequestMapping(value = "/qnaarticlewrite.fu", method = { RequestMethod.GET, RequestMethod.POST })
	public String qnaview_write(Re_QnADTO dto, HttpServletRequest request, Locale locale, Model model,HttpSession session) {
		dto.setId(qnadao.getRe_MAXID() + 1);
		dto.setIpaddr(request.getRemoteAddr());
		dto.setName((String)session.getAttribute("name"));
		dto.setQaboard_id(Integer.valueOf(request.getParameter("qaboard_id")));
		qnadao.Re_insertData(dto);
		QnADTO reviewdto = qnadao.getReadData(Integer.valueOf(request.getParameter("qaboard_id")));
		request.setAttribute("dto", reviewdto);
		List<Re_QnADTO> lists = qnadao.Re_getList(Integer.valueOf(request.getParameter("qaboard_id")));
		request.setAttribute("lists", lists);
		return "qna/qnaarticle";
	}

	@RequestMapping(value = "/qnadelete.fu", method = { RequestMethod.GET, RequestMethod.POST })
	public String qnadelete(HttpServletRequest request, Locale locale, Model model) {
		qnadao.deleteData(Integer.valueOf(request.getParameter("id")));
		return "redirect:/qnamain.fu";
	}

	@RequestMapping(value = "/qnarewrite.fu", method = { RequestMethod.GET, RequestMethod.POST })
	public String qnawirte(HttpServletRequest request, Locale locale, Model model) {
		QnADTO dto = qnadao.getReadData(Integer.valueOf(request.getParameter("id")));
		request.setAttribute("dto", dto);
		List<Re_QnADTO> lists = qnadao.Re_getList(dto.getId());
		request.setAttribute("lists", lists);
		return "qna/qnaarticle";
	}

	@RequestMapping(value = "/qnarewrite_ok.fu", method = { RequestMethod.GET, RequestMethod.POST })
	public String qnawirte_ok(QnADTO redto, HttpServletRequest request, Locale locale, Model model) {
		redto.setId(Integer.valueOf(request.getParameter("id")));
		qnadao.updateData(redto);
		QnADTO dto = qnadao.getReadData(Integer.valueOf(request.getParameter("id")));
		request.setAttribute("dto", dto);
		List<Re_QnADTO> lists = qnadao.Re_getList(dto.getId());
		request.setAttribute("lists", lists);
		return "qna/qnaarticle";
	}

	
	
	
	
	
	
	
	@RequestMapping(value = "/reviewmain.fu", method = { RequestMethod.GET, RequestMethod.POST })
	public String reviewmain(HttpServletRequest request, Locale locale, Model model) {
		String cp = request.getContextPath();
		String pageNum = request.getParameter("pageNum");
		int currentPage = 1;

		if (pageNum != null)
			currentPage = Integer.parseInt(pageNum);

		// �뜝�룞�삕泥닷뜝�룞�삕�뜝�룞�삕�뜝�떢怨ㅼ삕�뜝�룞�삕
		int dataCount = reviewdao.getDataCount();

		// �뜝�룞�삕泥닷뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕
		int numPerPage = 5;
		int totalPage = myUtil.getPageCount(numPerPage, dataCount);

		if (currentPage > totalPage)
			currentPage = totalPage;

		int start = (currentPage - 1) * numPerPage + 1;
		int end = currentPage * numPerPage;
		List<ReviewDTO> lists = reviewdao.getList(start, end);

		String listUrl = cp + "/reviewmain.fu";

		String pageIndexList = myUtil1.pageIndexList(currentPage, totalPage, listUrl);

		// �뜝�뙗釉앹삕�뜝�룞�삕 �뜝�뙇�눦�삕 �뜝�룞�삕�뜝�룞�삕
		String articleUrl = cp + "/reviewmain.fu?pageNum=" + currentPage;

		// �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕�뜝�떢紐뚯삕
		// �뜝�떬源띿삕�뜝占�
		request.setAttribute("lists", lists);
		request.setAttribute("pageIndexList", pageIndexList);
		request.setAttribute("dataCount", dataCount);
		request.setAttribute("articleUrl", articleUrl);

		return "review/reviewmain";
	}

	@RequestMapping(value = "/reviewwrite.fu", method = { RequestMethod.GET, RequestMethod.POST })
	public String reviewwrite(ReviewDTO dto, MultipartHttpServletRequest request, Locale locale, Model model,
			HttpSession session) {
		System.out.println("�뜝�룞�삕�듃�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕" + reviewdao.getMAXID());

		dto.setId(reviewdao.getMAXID() + 1);
		dto.setIpaddr(request.getRemoteAddr());
		dto.setName((String)session.getAttribute("name"));
		System.out.println(dto.getName());
		// String
		// path="D:/sts-bundle/work/FurnitureWeb/src/main/webapp/resources/assets/img/save";
		String path = "d:/file";
		// String
		// path="D:/sts-bundle/work/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/FurnitureWeb/files";
		MultipartFile file = request.getFile("upload");
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
				// TODO: handle exception
				System.out.println(e.toString());
			}
		} else {
			System.out.println("�뜝�룞�삕�뜝�룞�삕�뜝�떢怨ㅼ삕 �뜝�룞�삕�뜝�룞�삕�뜝�떦�뙋�삕.");
		}
		dto.setPhoto(file.getOriginalFilename());
		reviewdao.insertData(dto);

		return "redirect:/reviewmain.fu";
	}

	@RequestMapping(value = "/reviewarticle.fu", method = { RequestMethod.GET, RequestMethod.POST })
	public String reviewview(HttpServletRequest request, Locale locale, Model model) {
		ReviewDTO dto = reviewdao.getReadData(Integer.valueOf(request.getParameter("id")));
		request.setAttribute("dto", dto);
		List<Re_ReviewDTO> lists = reviewdao.Re_getList(dto.getId());
		request.setAttribute("lists", lists);
		return "review/reviewarticle";
	}

	@RequestMapping(value = "/reviewarticlewrite.fu", method = { RequestMethod.GET, RequestMethod.POST })
	public String reviewview_write(Re_ReviewDTO dto, HttpServletRequest request, Locale locale, Model model,HttpSession session) {
		dto.setId(reviewdao.getRe_MAXID() + 1);
		dto.setIpaddr(request.getRemoteAddr());
		dto.setName((String)session.getAttribute("name"));
		dto.setQaboard_id(Integer.valueOf(request.getParameter("qaboard_id")));
		reviewdao.Re_insertData(dto);
		ReviewDTO reviewdto = reviewdao.getReadData(Integer.valueOf(request.getParameter("qaboard_id")));
		request.setAttribute("dto", reviewdto);
		List<Re_ReviewDTO> lists = reviewdao.Re_getList(Integer.valueOf(request.getParameter("qaboard_id")));
		request.setAttribute("lists", lists);
		return "review/reviewarticle";
	}

	@RequestMapping(value = "/reviewdelete.fu", method = { RequestMethod.GET, RequestMethod.POST })
	public String reviewdelete(HttpServletRequest request, Locale locale, Model model) {
		reviewdao.deleteData(Integer.valueOf(request.getParameter("id")));
		return "redirect:/reviewmain.fu";
	}

	@RequestMapping(value = "/reviewrewrite.fu", method = { RequestMethod.GET, RequestMethod.POST })
	public String reviewrewirte(HttpServletRequest request, Locale locale, Model model) {
		ReviewDTO dto = reviewdao.getReadData(Integer.valueOf(request.getParameter("id")));
		request.setAttribute("dto", dto);
		List<Re_ReviewDTO> lists = reviewdao.Re_getList(dto.getId());
		request.setAttribute("lists", lists);
		return "review/reviewarticle";
	}

	@RequestMapping(value = "/reviewrewrite_ok.fu", method = { RequestMethod.GET, RequestMethod.POST })
	public String reviewrewirte_ok(ReviewDTO redto, HttpServletRequest request, Locale locale, Model model) {
		redto.setId(Integer.valueOf(request.getParameter("id")));
		reviewdao.updateData(redto);
		ReviewDTO dto = reviewdao.getReadData(Integer.valueOf(request.getParameter("id")));
		request.setAttribute("dto", dto);
		List<Re_ReviewDTO> lists = reviewdao.Re_getList(dto.getId());
		request.setAttribute("lists", lists);
		return "review/reviewarticle";
	}

}
