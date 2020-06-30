package com.care.DTO;

import java.util.Date;


public class Board_qaDTO {//Q&A 게시판 클래스
	private String qa_category;//문의 유저 아이디
	private String user_id;//문의 유저 아이디
	private String qa_pwd;//비공개 패스워드
	private String qa_subject;//문의 제목
	private String qa_content;//문의 내용
	private int qa_state;//비밀글 여부
	private int qa_reply;//관리자 답변 여부
	private Date qa_logtime;//문의 작성 일자
	private int qa_seq;//글 번호(시퀀스)
	
	public int getQa_seq() {
		return qa_seq;
	}
	public void setQa_seq(int qa_seq) {
		this.qa_seq = qa_seq;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getQa_pwd() {
		return qa_pwd;
	}
	public void setQa_pwd(String qa_pwd) {
		this.qa_pwd = qa_pwd;
	}
	public String getQa_subject() {
		return qa_subject;
	}
	public void setQa_subject(String qa_subject) {
		this.qa_subject = qa_subject;
	}
	public String getQa_content() {
		return qa_content;
	}
	public void setQa_content(String qa_content) {
		this.qa_content = qa_content;
	}
	public int getQa_state() {
		return qa_state;
	}
	public void setQa_state(int qa_state) {
		this.qa_state = qa_state;
	}
	public int getQa_reply() {
		return qa_reply;
	}
	public void setQa_reply(int qa_reply) {
		this.qa_reply = qa_reply;
	}
	public Date getQa_logtime() {
		return qa_logtime;
	}
	public void setQa_logtime(Date qa_logtime) {
		this.qa_logtime = qa_logtime;
	}
	public String getQa_category() {
		return qa_category;
	}
	public void setQa_category(String qa_category) {
		this.qa_category = qa_category;
	}

	
}
