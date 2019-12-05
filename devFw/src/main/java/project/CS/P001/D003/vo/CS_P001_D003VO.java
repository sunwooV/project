package project.CS.P001.D003.vo;


import java.util.Date;

import org.springframework.stereotype.Component;

@Component("CS_P001_D003VO")
public class CS_P001_D003VO {
	private String private_qna_num;
	private String private_qna_content;
	private String private_qna_title;
	private Date private_qna_date;
	private String private_memberid;
	private String private_answer_date;
	private String private_answer_content;
	private String answer_num;
	private String private_answer_memberid;
	private String private_answer_yn;
	
	
	
	public String getPrivate_qna_num() {
		return private_qna_num;
	}
	public void setPrivate_qna_num(String private_qna_num) {
		this.private_qna_num = private_qna_num;
	}
	public String getPrivate_qna_content() {
		return private_qna_content;
	}
	public void setPrivate_qna_content(String private_qna_content) {
		this.private_qna_content = private_qna_content;
	}
	public String getPrivate_qna_title() {
		return private_qna_title;
	}
	public void setPrivate_qna_title(String private_qna_title) {
		this.private_qna_title = private_qna_title;
	}
	public Date getPrivate_qna_date() {
		return private_qna_date;
	}
	public void setPrivate_qna_date(Date private_qna_date) {
		this.private_qna_date = private_qna_date;
	}
	public String getPrivate_memberid() {
		return private_memberid;
	}
	public void setPrivate_memberid(String private_memberid) {
		this.private_memberid = private_memberid;
	}
	public String getPrivate_answer_date() {
		return private_answer_date;
	}
	public void setPrivate_answer_date(String private_answer_date) {
		this.private_answer_date = private_answer_date;
	}
	public String getPrivate_answer_content() {
		return private_answer_content;
	}
	public void setPrivate_answer_content(String private_answer_content) {
		this.private_answer_content = private_answer_content;
	}
	public String getAnswer_num() {
		return answer_num;
	}
	public void setAnswer_num(String answer_num) {
		this.answer_num = answer_num;
	}
	public String getPrivate_answer_memberid() {
		return private_answer_memberid;
	}
	public void setPrivate_answer_memberid(String private_answer_memberid) {
		this.private_answer_memberid = private_answer_memberid;
	}
	public String getPrivate_answer_yn() {
		return private_answer_yn;
	}
	public void setPrivate_answer_yn(String private_answer_yn) {
		this.private_answer_yn = private_answer_yn;
	}
	


}
