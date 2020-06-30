package com.care.DTO;

public class BannerDTO {//main화면 배너 클래스
	private String banner_category;//배너 카테고리
	private String banner_image;//배너 이미지
	private String banner_no ;//배너 설명
	private String change_no ; //바뀔 배너 
	
	
	public String getBanner_category() {
		return banner_category;
	}
	public void setBanner_category(String banner_category) {
		this.banner_category = banner_category;
	}
	public String getBanner_image() {
		return banner_image;
	}
	public void setBanner_image(String banner_image) {
		this.banner_image = banner_image;
	}
	public String getBanner_no() {
		return banner_no;
	}
	public void setBanner_no(String banner_no) {
		this.banner_no = banner_no;
	}
	public String getChange_no() {
		return change_no;
	}
	public void setChange_no(String change_no) {
		this.change_no = change_no;
	}
	
	

	
}
