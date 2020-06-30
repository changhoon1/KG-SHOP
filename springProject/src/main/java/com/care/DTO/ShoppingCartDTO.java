package com.care.DTO;

public class ShoppingCartDTO {//장바구니에 대한 클래스
	private String id;//회원 아이디
	private String product_name_image; //이미지
	private String product_name_title; // 상품명
	private int product_name_price; // 가격
	private int product_count;  //수량

	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getProduct_name_image() {
		return product_name_image;
	}
	public void setProduct_name_image(String product_name_image) {
		this.product_name_image = product_name_image;
	}
	public String getProduct_name_title() {
		return product_name_title;
	}
	public void setProduct_name_title(String product_name_title) {
		this.product_name_title = product_name_title;
	}
	public int getProduct_name_price() {
		return product_name_price;
	}
	public void setProduct_name_price(int product_name_price) {
		this.product_name_price = product_name_price;
	}
	public int getProduct_count() {
		return product_count;
	}
	public void setProduct_count(int product_count) {
		this.product_count = product_count;
	}
	
	
	


}
