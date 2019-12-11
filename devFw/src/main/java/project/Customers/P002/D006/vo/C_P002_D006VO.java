package project.Customers.P002.D006.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component("C_P002_D006VO")
public class C_P002_D006VO {
	private String memberID;
	private String prod_number;
	private String qna_number;
	private String qna_date;
	private String answer_date;
	private String secret_yn;
	private String represent_image;
	private String answer_yn; /* 답변여부 */
	private String qna_content;
	private String answer_content; /* 답변내용 */
	public String getMemberID() {
		return memberID;
	}
	public void setMemberID(String memberID) {
		this.memberID = memberID;
	}
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
	public String getQna_date() {
		return qna_date;
	}
	public void setQna_date(String qna_date) {
		this.qna_date = qna_date;
	}
	public String getAnswer_date() {
		return answer_date;
	}
	public void setAnswer_date(String answer_date) {
		this.answer_date = answer_date;
	}
	public String getSecret_yn() {
		return secret_yn;
	}
	public void setSecret_yn(String secet_yn) {
		this.secret_yn = secet_yn;
	}
	public String getRepresent_image() {
		return represent_image;
	}
	public void setRepresent_image(String represent_image) {
		this.represent_image = represent_image;
	}
	public String getAnswer_yn() {
		return answer_yn;
	}
	public void setAnswer_yn(String answer_yn) {
		this.answer_yn = answer_yn;
	}
	public String getQna_content() {
		return qna_content;
	}
	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}
	public String getAnswer_content() {
		return answer_content;
	}
	public void setAnswer_content(String answer_content) {
		this.answer_content = answer_content;
	}



}
