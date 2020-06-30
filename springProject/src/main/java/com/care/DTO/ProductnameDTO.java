package com.care.DTO;

import org.springframework.web.multipart.MultipartFile;

public class ProductnameDTO {//등록상품에 대한 클래스
	private String product_name_no;//상품 고유 번호
	private String product_category_no;//카테고리 분류 번호
	private String product_name_title;//상품 이름
	private String product_name_detail;//상품 설명
	private int product_name_price;//상품 가격
	private String product_name_image;//상품 이미지 
	private String product_thumbnail; //이미지 썸네일
	private String product_hashtag;//해시태그(검색용)
	private int product_hit; // 조회수
	private int product_stock; //재고량
	
	public String getProduct_name_no() {
		return product_name_no;
	}
	public void setProduct_name_no(String product_name_no) {
		this.product_name_no = product_name_no;
	}
	public String getProduct_category_no() {
		return product_category_no;
	}
	public void setProduct_category_no(String product_category_no) {
		this.product_category_no = product_category_no;
	}
	public String getProduct_name_title() {
		return product_name_title;
	}
	public void setProduct_name_title(String product_name_title) {
		this.product_name_title = product_name_title;
	}
	public String getProduct_name_detail() {
		return product_name_detail;
	}
	public void setProduct_name_detail(String product_name_detail) {
		this.product_name_detail = product_name_detail;
	}
	public int getProduct_name_price() {
		return product_name_price;
	}
	public void setProduct_name_price(int product_name_price) {
		this.product_name_price = product_name_price;
	}
	public String getProduct_name_image() {
		return product_name_image;
	}
	public void setProduct_name_image(String product_name_image) {
		this.product_name_image = product_name_image;
	}
	public String getProduct_hashtag() {
		return product_hashtag;
	}
	public void setProduct_hashtag(String product_hashtag) {
		this.product_hashtag = product_hashtag;
	}
	public int getProduct_hit() {
		return product_hit;
	}
	public void setProduct_hit(int product_hit) {
		this.product_hit = product_hit;
	}
	public int getProduct_stock() {
		return product_stock;
	}
	public void setProduct_stock(int product_stock) {
		this.product_stock = product_stock;
	} 
	
	public String getProduct_thumbnail() {
		return product_thumbnail;
	}
	public void setProduct_thumbnail(String product_thumbnail) {
		this.product_thumbnail = product_thumbnail;
	}
	
}
	
