package com.care.DTO;

public class InputProductDTO {//등록상품에 대한 클래스
	private int product_name_no;//상품 고유 번호
	private int product_category_no;//카테고리 분류 번호
	private String product_name_title;//상품 이름
	private String product_name_detail;//상품 설명
	private int product_name_price;//상품 가격
	private String product_name_image;//상품 이미지명
	private String product_hashtag;//해시태그(검색용)
	private String product_size;//상품 사이즈
	private String product_color;//상품 색상
	
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
	private int product_hit;
	
	public String getProduct_size() {
		return product_size;
	}
	public void setProduct_size(String product_size) {
		this.product_size = product_size;
	}
	public String getProduct_color() {
		return product_color;
	}
	public void setProduct_color(String product_color) {
		this.product_color = product_color;
	}
	public int getProduct_name_no() {
		return product_name_no;
	}
	public void setProduct_name_no(int product_name_no) {
		this.product_name_no = product_name_no;
	}
	public int getProduct_category_no() {
		return product_category_no;
	}
	public void setProduct_category_no(int product_category_no) {
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
}
