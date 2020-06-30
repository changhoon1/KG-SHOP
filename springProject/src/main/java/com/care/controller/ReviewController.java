package com.care.controller;

import java.io.File;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.care.DTO.Board_qaPageMaker;
import com.care.DTO.Board_qaSearchCriteria;
import com.care.DTO.ProductnameDTO;
import com.care.DTO.ReviewDTO;
import com.care.service.ReviewService;
import com.care.service.SaveProductService;
import com.care.uitls.UploadFileUtils;


@Controller
public class ReviewController {
		@Autowired
		ReviewService service;
		
		@Autowired
		SaveProductService productservice;
		//리뷰게시판 페이지
		@RequestMapping("reviewPage")
		public String QnA(Model model, @ModelAttribute("scri") Board_qaSearchCriteria scri) throws Exception {
			model.addAttribute("list",service.list(scri));
			
			Board_qaPageMaker pageMaker = new Board_qaPageMaker();
			pageMaker.setCri(scri);
			pageMaker.setTotalCount(service.listCount(scri));
			model.addAttribute("pageMaker", pageMaker);
			
			return "cs/reviewPage";
			
		}
		
		//리뷰 글쓰기
		@RequestMapping("reviewWrite")
		public String QnAwrite(HttpServletRequest request,Model model,@RequestParam("product_name_title") String product_name_title) {
			ProductnameDTO view = productservice.getproduct(product_name_title);
			model.addAttribute("product",view);
			
			HttpSession session = request.getSession();
			String id = (String) session.getAttribute("id");
			if(id == null) {
				model.addAttribute("msg","로그인후 이용 가능 합니다.");
				model.addAttribute("url","bootlogin");
				return "error/error";
			}
			
			return "cs/reviewWrite";
		}
		
		@Resource(name="uploadPath")
		private String uploadPath;
		
		//글쓰기 저장
		@RequestMapping(value = "reviewSavedata" ,method = RequestMethod.POST)
		public String savedata(ReviewDTO dto,MultipartFile file)throws Exception {
			String imgUploadPath = uploadPath + File.separator + "imgUpload";
			String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
			String fileName = null;
			

			if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			 fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
			} else {
			 fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
			}
			dto.setReview_image(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
			int i;
			i = service.insert(dto);
			System.out.println("결과값"+i);
			
			return "redirect:reviewPage";
		}
		
		//리뷰게시판 조회
		@RequestMapping("reviewReadView")
		public String read(ReviewDTO dto, @ModelAttribute("scri") Board_qaSearchCriteria scri, Model model) throws Exception {
				
			model.addAttribute("read", service.read(dto.getReview_seq()));
			
			return "cs/reviewReadView";
				
		}
	 	
		// 리뷰게시판 수정뷰
		@RequestMapping("reviewUpdateView")
		public String updateView(ReviewDTO dto, @ModelAttribute("scri") Board_qaSearchCriteria scri,Model model,MultipartFile file) throws Exception{
			String imgUploadPath = uploadPath + File.separator + "imgUpload";
			String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
			String fileName = null;

			if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			 fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
			} else {
			 fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
			}
			dto.setReview_image(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
			
			model.addAttribute("update", service.read(dto.getReview_seq()));
			return "cs/reviewUpdateView";
		}
		
		// 리뷰게시판 수정
		@RequestMapping("reviewUpdate")
		public String update(ReviewDTO dto, Board_qaSearchCriteria scri, RedirectAttributes rttr) throws Exception{
			service.update(dto);
			
			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			
			return "redirect:reviewPage";
		}
		
		//리뷰게시판 삭제
		@RequestMapping("reviewDelete")
		public String delete(ReviewDTO dto, Board_qaSearchCriteria scri, RedirectAttributes rttr) throws Exception{
			service.delete(dto.getReview_seq());
			
			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			
			return "redirect:reviewPage";
		}
		
}
