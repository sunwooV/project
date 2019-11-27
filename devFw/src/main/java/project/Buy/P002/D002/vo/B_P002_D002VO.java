package project.Buy.P002.D002.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("B_P002_D002VO")
public class B_P002_D002VO {

	private String seller_memberId; // 판매자 ID
	private String review_number; // Review_Number
	private String prod_number; // 상품 번호
	private String buyer_memberId; // 구매자 ID
	private String review_score; //리뷰 점수
	private String review_title; // 리뷰 제목
	private String review_content; // 리뷰 내용
	private Date review_date; // 리뷰 작성날짜
	private String flea_code; // 플리마켓 코드 - 플리마켓경우만 있음 // 중고경매 /플리마켓 구분
	
	public String getSeller_memberId() {
		return seller_memberId;
	}
	public void setSeller_memberId(String seller_memberId) {
		this.seller_memberId = seller_memberId;
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
	public String getBuyer_memberId() {
		return buyer_memberId;
	}
	public void setBuyer_memberId(String buyer_memberId) {
		this.buyer_memberId = buyer_memberId;
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
	
