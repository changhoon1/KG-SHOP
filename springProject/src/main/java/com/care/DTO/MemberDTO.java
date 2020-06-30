package com.care.DTO;

public class MemberDTO {//회원 정보에 대한 클래스
	private String id;//유저 아이디
	private String pw;//유저 패스워드
	private String name;//유저 이름
	private String email;//유저 이메일
	private String tel;//유저 전화번호
	private String tel1;//유저 전화번호
	private String tel2;//유저 전화번호
	private String addr;//유저 주소
	private String addr1;//유저 주소
	private String addr2;//유저 주소
	private String pw_answer;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getTel1() {
		return tel1;
	}
	public void setTel1(String tel1) {
		this.tel1 = tel1;
	}
	public String getTel2() {
		return tel2;
	}
	public void setTel2(String tel2) {
		this.tel2 = tel2;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getPw_answer() {
		return pw_answer;
	}
	public void setPw_answer(String pw_answer) {
		this.pw_answer = pw_answer;
	}

}
