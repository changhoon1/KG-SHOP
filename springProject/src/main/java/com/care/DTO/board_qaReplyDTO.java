package com.care.DTO;

import java.util.Date;

public class board_qaReplyDTO {
	private int qa_seq;
	private int qa_reply_seq;
	private String qa_reply_user_id;
	private String qa_reply_content;
	private Date qa_reply_logtime;
	
	@Override
	public String toString() {
		return qa_seq+qa_reply_seq+qa_reply_user_id+qa_reply_content+qa_reply_logtime;
	}
	
	public int getQa_seq() {
		return qa_seq;
	}
	public void setQa_seq(int qa_seq) {
		this.qa_seq = qa_seq;
	}
	public int getQa_reply_seq() {
		return qa_reply_seq;
	}
	public void setQa_reply_seq(int qa_reply_seq) {
		this.qa_reply_seq = qa_reply_seq;
	}
	public String getQa_reply_content() {
		return qa_reply_content;
	}
	public void setQa_reply_content(String qa_reply_content) {
		this.qa_reply_content = qa_reply_content;
	}
	public String getQa_reply_user_id() {
		return qa_reply_user_id;
	}
	public void setQa_reply_user_id(String qa_reply_user_id) {
		this.qa_reply_user_id = qa_reply_user_id;
	}
	public Date getQa_reply_logtime() {
		return qa_reply_logtime;
	}
	public void setQa_reply_logtime(Date qa_reply_logtime) {
		this.qa_reply_logtime = qa_reply_logtime;
	}
	
	
}
