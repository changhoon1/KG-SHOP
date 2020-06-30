package com.care.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.care.DAO.ProductnameDAO;
import com.care.DTO.BannerDTO;
import com.care.DTO.Board_qaSearchCriteria;
import com.care.DTO.DeletecartDTO;
import com.care.DTO.DownStockDTO;
import com.care.DTO.OrderlistDTO;
import com.care.DTO.OrdersDTO;
import com.care.DTO.ProductnameDTO;
import com.care.DTO.ShoppingCartDTO;

@Service
public class SaveProductService { 
	@Autowired
	private ProductnameDAO dao;
	
	
	public void saveproduct(ProductnameDTO dto) {
		dao.saveproduct(dto);
	}
	
	//카테고리 목록
		public List<ProductnameDTO> notebookproductview(Board_qaSearchCriteria scri) {
			return dao.notebookproductview(scri);
		}
		//카테고리 총 개수
		public int productListCount(Board_qaSearchCriteria scri) {
			return dao.productListCount(scri);
		}

	public ProductnameDTO productview(String product_name_no) {
		
		return dao.productview(product_name_no);
		
	}

	public ProductnameDTO modifyproduct(String product_name_no) {
		
		return dao.modifyproduct(product_name_no);
	}
	public void upHit(String product_name_no) {
		dao.uphit(product_name_no);
		return ;
	}
	public void modifysaveproduct(ProductnameDTO dto) {
		dao.modifysaveproduct(dto);
		
	}

	public void deleteproduct(String product_name_no) {
		dao.deleteproduct(product_name_no);
		
	}

public void saveshoppingcart(ShoppingCartDTO dto) {
		
		dao.saveshoppingcart(dto);
		
	}

	public List<ShoppingCartDTO> viewshoppingcart(String id) {
		
		return dao.viewshoppingcart(id);
	}

	

	public ProductnameDTO orderview(String product_name_title) {
		
		return dao.orderview(product_name_title);
	}

	public void saveorders(OrdersDTO dto) {
		
		dao.saveorders(dto);
		
	}

	public List<OrdersDTO> pay(String id) {
		
		return dao.pay(id);
	}

	public void deletecart(DeletecartDTO dto) {
		
		dao.deletecart(dto);
		
	}

	public void Saveorderlist(DeletecartDTO dto) {
		dao.saveorderlist(dto);
		
	}

	public void deletepay(String product_name_title) {
		dao.deletepay(product_name_title);
		
	}

	public void downstock(DownStockDTO downdto) {
		dao.downstock(downdto);
		
	}

	public List<OrderlistDTO> vieworderlist(String id) {
		
		return dao.vieworderlist(id);
		
	}

	public void savebanner(BannerDTO dto) {
		dao.savebanner(dto);
		
	}

	public List<BannerDTO> viewbanner() {
		
		return dao.viewbanner();
	}

	public int titleChk(ProductnameDTO dto) throws Exception{
		int result = dao.titleChk(dto);
		return result;
	}

	public int cartChk(ShoppingCartDTO dto) {
		int result = dao.cartChk(dto);
		return result;
	}

	public List<ProductnameDTO> searchView(Board_qaSearchCriteria scri) {
		return dao.searchView(scri);
	}

	public int searchListCount(Board_qaSearchCriteria scri) {
		
		return dao.searchListCount(scri);
	}

	public ProductnameDTO getproduct(String product_name_title) {
		
		return dao.getproduct(product_name_title);
	}
	
	
}
