package project.Sell.P001.D003.vo;

import org.springframework.stereotype.Component;

@Component("S_P001_D003VO")
public class S_P001_D003VO {
	private String prod_number;
	private String qna_number;
	private String qna_content;
	private String qna_date;
	private String memberId;
	private String answer_yn;
	private String anwer_date;
	private String anwer_content;
	
	
	public String getProd_number() {
		return prod_number;
	}
	public void setProd_number(String prod_number) {
		this.prod_number = prod_number;
	}
	public String getQna_number() {
		return qna_number;
	}
	public void setQna_number(String qna_number) {
		this.qna_number = qna_number;
	}
	public String getQna_content() {
		return qna_content;
	}
	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}
	public String getQna_date() {
		return qna_date;
	}
	public void setQna_date(String qna_date) {
		this.qna_date = qna_date;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getAnswer_yn() {
		return answer_yn;
	}
	public void setAnswer_yn(String answer_yn) {
		this.answer_yn = answer_yn;
	}
	public String getAnwer_date() {
		return anwer_date;
	}
	public void setAnwer_date(String anwer_date) {
		this.anwer_date = anwer_date;
	}
	public String getAnwer_content() {
		return anwer_content;
	}
	public void setAnwer_content(String anwer_content) {
		this.anwer_content = anwer_content;
	}
	
	
}
