package com.care.controller;

import org.springframework.stereotype.Controller;
import java.io.File;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.care.DTO.BannerDTO;
import com.care.DTO.Board_qaPageMaker;
import com.care.DTO.Board_qaSearchCriteria;
import com.care.DTO.ProductnameDTO;

import com.care.service.SaveProductService;
import com.care.uitls.UploadFileUtils;
@Controller
public class ProductNameController {
	
	@Autowired
	SaveProductService service;

	
	
	@RequestMapping("productName")
	public String productName(HttpServletRequest request,Model model) {
		HttpSession session = request.getSession();	
		String id = (String) session.getAttribute("id");
		String system= "system";
		if(!id.equals(system)) {
			model.addAttribute("msg","관리자만 사용가능합니다");
	        model.addAttribute("url","home");
	        return "error/error";
		}
		return "shopping/productName";
	}
	
	//노트북 카테고리 조회(카테고리 통합예정) if문으로 
		@RequestMapping("notebookproduct")
		public String notebookproduct(Model model, Board_qaSearchCriteria scri) {

			model.addAttribute("notebooklists",service.notebookproductview(scri));
			
			Board_qaPageMaker pageMaker = new Board_qaPageMaker();
			pageMaker.setCri(scri);
			pageMaker.setTotalCount(service.productListCount(scri));
			
			model.addAttribute("pageMaker", pageMaker);
			
			model.addAttribute("product_category_no",scri.getProduct_category_no());
			return "category/notebook/notebookproduct";
		}
	
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@RequestMapping(value = "SaveProduct" ,method = RequestMethod.POST)
	public String saveproduct(ProductnameDTO dto, MultipartFile file,Model model)throws Exception {	
		try {
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;

		if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
		 fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
		} else {
		 fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		}
		
		dto.setProduct_name_image(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		dto.setProduct_thumbnail(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		dto.setProduct_hit(0);
		service.saveproduct(dto);
		
		model.addAttribute("msg","상품이 등록 되었습니다");
        model.addAttribute("url","home");

		}catch (Exception e) {
			
			model.addAttribute("msg","상품이 등록 실패 되었습니다");
	        model.addAttribute("url","productName");
			
		}
		return "error/error";
	}
	
	//상품명 중복체크
	@ResponseBody
	@RequestMapping(value = "titleChk", method =RequestMethod.POST)
	public int idChk(ProductnameDTO dto) throws Exception {
		
		int result = service.titleChk(dto);
		return result;
		
		}

	@RequestMapping("productview")
	public String productview(@RequestParam("product_name_no") String product_name_no, Model model,HttpServletRequest request) {
		upHit(product_name_no);
		ProductnameDTO view = service.productview(product_name_no);
		HttpSession session = request.getSession();	
		String id = (String) session.getAttribute("id");
		if(id==null) {
			model.addAttribute("msg","회원가입 후 이용 가능 합니다.");
			model.addAttribute("url","bootlogin");
			return "error/error";
		}
		model.addAttribute("productlist",view);
		return "category/productview/view";
	}
	private void upHit(String product_name_no) {
		service.upHit(product_name_no);
		return ;
	}
	
	@RequestMapping("modifyproduct")
	public String modifyproduct(@RequestParam("product_name_no") String product_name_no, Model model,HttpServletRequest request) {
		HttpSession session = request.getSession();	
		String id = (String) session.getAttribute("id");
		String system= "system";
		if(!id.equals(system)) {
			model.addAttribute("msg","관리자만 사용가능합니다");
	        model.addAttribute("url","home");
	        return "error/error";
		}
		ProductnameDTO modify = service.modifyproduct(product_name_no);
		model.addAttribute("modifylist",modify);
		return "shopping/modifyproduct";
	}
	@RequestMapping("ModifySaveProduct")
	public String ModifySaveProduct(ProductnameDTO dto, MultipartFile file,Model model)throws Exception {
		try {
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;

		if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
		 fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
		} else {
		 fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		}
		
		dto.setProduct_name_image(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		dto.setProduct_thumbnail(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		service.modifysaveproduct(dto);
		
		model.addAttribute("msg","상품이 수정 되었습니다");
        model.addAttribute("url","home");
        
		}catch (Exception e) {
			
		model.addAttribute("msg","상품 수정 실패");
	    model.addAttribute("url","modifyproduct");
		}
		return "error/error";
	}
	@RequestMapping("deleteproduct")
	public String deleteproduct(@RequestParam("product_name_no") String product_name_no,Model model,HttpServletRequest request)throws Exception {
		HttpSession session = request.getSession();	
		String id = (String) session.getAttribute("id");
		String system= "system";
		if(!id.equals(system)) {
			model.addAttribute("msg","관리자만 사용가능합니다");
	        model.addAttribute("url","home");
	        return "error/error";
		}
		
		try {
		service.deleteproduct(product_name_no);
		model.addAttribute("msg","상품이 삭제 되었습니다");
        model.addAttribute("url","home");
		
		}catch (Exception e) {
			
		model.addAttribute("msg","상품삭제 실패");
		model.addAttribute("url","home");
		}
		return "error/error";
	}
	
	
	@RequestMapping("viewbanner")
	public String banner(Model model,HttpServletRequest request) {
		HttpSession session = request.getSession();	
		String id = (String) session.getAttribute("id");
		String system = "system";
		if(!id.equals(system)) {
			model.addAttribute("msg","관리자만 사용가능합니다");
	        model.addAttribute("url","home");
	        return "error/error";
		}
		List<BannerDTO> view = service.viewbanner();
		model.addAttribute("banner",view);	
		return "shopping/viewbanner";
	}
	

	@RequestMapping("Modifybanner")
	public String Modifybanner(@RequestParam("banner_no") String banner_no,Model model,HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();	
		String id = (String) session.getAttribute("id");
		String system = "system";
		if(!id.equals(system)) {
			model.addAttribute("msg","관리자만 사용가능합니다");
	        model.addAttribute("url","home");
	        return "error/error";
		}
		model.addAttribute("banner_no",banner_no);
		return "shopping/modifybanner";
	}
	
	
	@RequestMapping(value = "Savebanner" ,method = RequestMethod.POST)
public String Savebanner(BannerDTO dto, MultipartFile file,@RequestParam("banner_no") String banner_no,Model model) throws Exception {

		try {
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;

		if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
		 fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
		} else {
		 fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		}
		dto.setChange_no(banner_no);
		dto.setBanner_image(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		service.savebanner(dto);
		
		model.addAttribute("msg","배너가 수정 되었습니다");
        model.addAttribute("url","home");
		
		}catch (Exception e) {
			
		model.addAttribute("msg","배너 수정 실패");
	    model.addAttribute("url","home");
		}

		return "error/error";
	}
	
	@RequestMapping("searchView")
	public String SearchView(Model model, @ModelAttribute("scri") Board_qaSearchCriteria scri) {
		
		model.addAttribute("searchView",service.searchView(scri));
		
		Board_qaPageMaker pageMaker = new Board_qaPageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.searchListCount(scri));
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "category/searchView/searchView";
	}

}

