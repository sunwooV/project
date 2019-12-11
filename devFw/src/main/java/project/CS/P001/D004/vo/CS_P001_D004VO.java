package project.CS.P001.D004.vo;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component("CS_P001_D004VO")
public class CS_P001_D004VO {
	private String private_qna_num;
	private String private_qna_content;
	private String private_qna_title;
	private Date private_qna_date;
	private String private_memberid;
	private String private_answer_yn;
	private String board_num;
	private String board_name;
	private String board_use;
	
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
	public String getPrivate_answer_yn() {
		return private_answer_yn;
	}
	public void setPrivate_answer_yn(String private_answer_yn) {
		this.private_answer_yn = private_answer_yn;
	}
	public String getBoard_num() {
		return board_num;
	}
	public void setBoard_num(String board_num) {
		this.board_num = board_num;
	}
	public String getBoard_name() {
		return board_name;
	}
	public void setBoard_name(String board_name) {
		this.board_name = board_name;
	}
	public String getBoard_use() {
		return board_use;
	}
	public void setBoard_use(String board_use) {
		this.board_use = board_use;
	}
	
}
	
