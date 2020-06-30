package com.care.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.care.DTO.DeletecartDTO;
import com.care.DTO.DownStockDTO;
import com.care.DTO.OrderlistDTO;
import com.care.DTO.OrdersDTO;
import com.care.DTO.ProductnameDTO;
import com.care.DTO.ShoppingCartDTO;
import com.care.service.SaveProductService;

@Controller
public class ShoppingCartController {

	@Autowired
	SaveProductService service;

	
	@RequestMapping(value = "SaveshoppingCart" ,method = RequestMethod.POST)
	public String SaveshoppingCart(ShoppingCartDTO dto,HttpServletRequest request) {
		HttpSession session ;
		session = request.getSession();;
		String id = (String) session.getAttribute("id");
		dto.setId(id); //여기에 로그인한 세션값 넣어주면됩니다
		
		service.saveshoppingcart(dto);
		return "redirect:shoppingcart";
		 
	}
	
	//장바구니 중복체크
	@ResponseBody
	@RequestMapping(value = "cartChk", method =RequestMethod.POST)
	public int cartChk(ShoppingCartDTO dto) throws Exception {
			
		int result = service.cartChk(dto);
		return result;
			
		}

	
	@RequestMapping("shoppingcart")
	public String shoppingcart(HttpServletRequest request,Model model) {
		HttpSession session ;
		session = request.getSession();;
		String id = (String) session.getAttribute("id");		
		List<ShoppingCartDTO> view =service.viewshoppingcart(id);	
		model.addAttribute("shoppingcart",view);				
		return "shopping/shoppingCart";
	}
	
	@RequestMapping("orderview")
	public String orderview(@RequestParam("product_name_title") String product_name_title,Model model,
			@RequestParam("product_count") int product_count) {
		System.out.println(product_name_title);
		ProductnameDTO view = service.orderview(product_name_title);
		System.out.println(view.getProduct_name_price());
		int price = view.getProduct_name_price();
		int sumprice = (price * product_count); 
		model.addAttribute("orderview",view);
		model.addAttribute("count",product_count);
		model.addAttribute("sum",sumprice);
		
		return "pay/orderview";
	}

	@RequestMapping("Saveorders")
	public String Sabeorder(OrdersDTO dto,Model model) {
		service.saveorders(dto);
		
		return "redirect:paypay";
	}
	
	@RequestMapping("paypay")
	public String kakaopay(HttpServletRequest request,Model model) {
		HttpSession session ;
		session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		List<OrdersDTO> pay = service.pay(id);
		model.addAttribute("pay",pay);
		return "pay/kakaopay";
	}
	
	@RequestMapping("deletecart")
	public String deletecart(HttpServletRequest request,DeletecartDTO dto,@RequestParam("product_name_title") String product_name_title,Model model) {
		HttpSession session ;
		session = request.getSession();
		String id = (String) session.getAttribute("id");
		try {
		dto.setId(id);
		dto.setProduct_name_title(product_name_title);
		service.deletecart(dto);
		
		model.addAttribute("msg","해당 상품이 삭제 되었습니다");
        model.addAttribute("url","shoppingcart");
		
		}catch (Exception e) {
			
		model.addAttribute("msg","삭제 실패 ");
	    model.addAttribute("url","shoppingcart");
		}
		return "error/error";
	}

	@RequestMapping("Saveorderlist")
	public String Saveorderlist (DeletecartDTO dto,@RequestParam("product_name_title") String product_name_title,
			@RequestParam("product_count") int product_count,DownStockDTO downdto,
			DeletecartDTO deletecart,HttpServletRequest request) {
		
		dto.setProduct_name_title(product_name_title);
		service.Saveorderlist(dto);
		
		downdto.setProduct_name_title(product_name_title);
		downdto.setProduct_count(product_count);
		deletepay(product_name_title);
		downstock(downdto);
		
		HttpSession session ;
		session = request.getSession();
		String id = (String) session.getAttribute("id");
		deletecart.setId(id);
		deletecart.setProduct_name_title(product_name_title);
		deletecart(deletecart);
		return "redirect:vieworderlist";
	}
	
	private void deletepay(String product_name_title) {
		service.deletepay(product_name_title);
	}
	
	private void downstock(DownStockDTO downdto) {
		service.downstock(downdto);
	}
	
	private void deletecart(DeletecartDTO deletecart) {
		service.deletecart(deletecart);
	}
	
	@RequestMapping("vieworderlist")
	public String vieworderlist(HttpServletRequest request,Model model) {
		HttpSession session ;
		session = request.getSession();
		String id = (String) session.getAttribute("id");
		List<OrderlistDTO> orderlist = service.vieworderlist(id);
		model.addAttribute("orderlist",orderlist);
		return "pay/orderlist";
	}
	
	@RequestMapping("deletepay")
	public String paydelete(@RequestParam("product_name_title") String product_name_title) {
		deletepay(product_name_title);
		return "home";
	}
	
	
	
}
