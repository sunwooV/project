package project.Customers.P002.D007.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component("C_P002_D007VO")
public class C_P002_D007VO {
	private String buyer_memberID;
	private String review_number;
	private String prod_number;
	private String review_title;
	private String review_content;

	public String getBuyer_memberID() {
		return buyer_memberID;
	}

	public void setBuyer_memberID(String buyer_memberID) {
		this.buyer_memberID = buyer_memberID;
	}

	public String getReview_content() {
		return review_content;
	}

	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}

	public String getReview_number() {
		return review_number;
	}

	public void setReview_number(String review_number) {
		this.review_number = review_number;
	}

	public String getProd_number() {
		return prod_number;
	}

	public void setProd_number(String prod_number) {
		this.prod_number = prod_number;
	}

	public String getReview_title() {
		return review_title;
	}

	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}

}
