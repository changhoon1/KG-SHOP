package com.care.DTO;

public class Board_qaSearchCriteria extends Board_qaCriteria{
	
	private String searchType = "";
	private String keyword = "";
	private String product_category_no;
	 
	public String getProduct_category_no() {
		return product_category_no;
	}
	public void setProduct_category_no(String product_category_no) {
		this.product_category_no = product_category_no;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	@Override
	public String toString() {
		return "SearchCriteria [searchType=" + searchType + ", keyword=" + keyword + "]";
	}

}
