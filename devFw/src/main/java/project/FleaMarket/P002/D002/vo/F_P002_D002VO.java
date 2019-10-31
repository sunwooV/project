package project.FleaMarket.P002.D002.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component("F_P002_D002VO")
public class F_P002_D002VO {
	private String seller_memberid = "";
	private String review_group = "";
	private String review_number = "";
	private String prod_number = "";
	private String buyer_memberid = "";
	private String review_score = "";
	private String review_title = "";
	private String review_photo = "";
	private String review_content = "";
	private Date review_date;
	private String flea_code = "";
	
	
	public F_P002_D002VO() {
		System.out.println("MemberVO 생성자 호출");
	}


	public String getSeller_memberid() {
		return seller_memberid;
	}


	public void setSeller_memberid(String seller_memberid) {
		this.seller_memberid = seller_memberid;
	}


	public String getReview_group() {
		return review_group;
	}


	public void setReview_group(String review_group) {
		this.review_group = review_group;
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


	public String getBuyer_memberid() {
		return buyer_memberid;
	}


	public void setBuyer_memberid(String buyer_memberid) {
		this.buyer_memberid = buyer_memberid;
	}


	public String getReview_score() {
		return review_score;
	}


	public void setReview_score(String review_score) {
		this.review_score = review_score;
	}


	public String getReview_title() {
		return review_title;
	}


	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}


	public String getReview_photo() {
		return review_photo;
	}


	public void setReview_photo(String review_photo) {
		this.review_photo = review_photo;
	}


	public String getReview_content() {
		return review_content;
	}


	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}


	public Date getReview_date() {
		return review_date;
	}


	public void setReview_date(Date review_date) {
		this.review_date = review_date;
	}


	public String getFlea_code() {
		return flea_code;
	}


	public void setFlea_code(String flea_code) {
		this.flea_code = flea_code;
	}
	
	
	
	

	
}
