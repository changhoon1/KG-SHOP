package com.care.DTO;

import java.util.Date;

public class ReviewDTO {//리뷰에 대한 클래스
	private int review_seq; //리뷰 게시글 번호
	private int review_score; //리뷰 점수
	private String review_product_title;//리뷰 상품 고유번호
	private String review_product_image;//리뷰 상품 이미지
	private String review_user_id;//회원 아이디
	private String review_subject;//리뷰 제목
	private String review_content;//리뷰 내용
	private String review_image;//리뷰 이미지
	private Date review_logtime;//리뷰 작성일
	
	
	public String getReview_product_image() {
		return review_product_image;
	}
	public void setReview_product_image(String review_product_image) {
		this.review_product_image = review_product_image;
	}
	public String getReview_product_title() {
		return review_product_title;
	}
	public void setReview_product_title(String review_product_title) {
		this.review_product_title = review_product_title;
	}
	public String getReview_user_id() {
		return review_user_id;
	}
	public void setReview_user_id(String review_user_id) {
		this.review_user_id = review_user_id;
	}
	public int getReview_score() {
		return review_score;
	}
	public void setReview_score(int review_score) {
		this.review_score = review_score;
	}
	public int getReview_seq() {
		return review_seq;
	}
	public void setReview_seq(int review_seq) {
		this.review_seq = review_seq;
	}
	public String getReview_image() {
		return review_image;
	}
	public void setReview_image(String review_image) {
		this.review_image = review_image;
	}
	public String getReview_subject() {
		return review_subject;
	}
	public void setReview_subject(String review_subject) {
		this.review_subject = review_subject;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public Date getReview_logtime() {
		return review_logtime;
	}
	public void setReview_logtime(Date review_logtime) {
		this.review_logtime = review_logtime;
	}
}
