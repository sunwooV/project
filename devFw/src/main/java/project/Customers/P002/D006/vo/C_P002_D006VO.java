package project.Customers.P002.D006.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component("C_P002_D006VO")
public class C_P002_D006VO {
	private String memberID;
	private String prod_number;
	private String answer_YN; /* 답변여부 */
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

	public String getAnswer_YN() {
		return answer_YN;
	}

	public void setAnswer_YN(String answer_YN) {
		this.answer_YN = answer_YN;
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
