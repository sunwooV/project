package project.Customers.P002.D002.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("C_P002_D002VO")
public class C_P002_D002VO {
	private String prod_number;
	private String bid_number;
	private String bid_amount;
	private String bid_price;
	private String bid_date;
	private String memberId;
	private String represent_image;
	private String auction_end_date;
	private String cnt;
	private String endChk;
	
	private Date order_date;
	private String order_number;
	private String prod_title;
	private String total_price;
	
	public Date getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}
	public String getOrder_number() {
		return order_number;
	}
	public void setOrder_number(String order_number) {
		this.order_number = order_number;
	}
	public String getProd_title() {
		return prod_title;
	}
	public void setProd_title(String prod_title) {
		this.prod_title = prod_title;
	}
	public String getTotal_price() {
		return total_price;
	}
	public void setTotal_price(String total_price) {
		this.total_price = total_price;
	}
	public String getProd_number() {
		return prod_number;
	}
	public void setProd_number(String prod_number) {
		this.prod_number = prod_number;
	}
	public String getBid_number() {
		return bid_number;
	}
	public void setBid_number(String bid_number) {
		this.bid_number = bid_number;
	}
	public String getBid_amount() {
		return bid_amount;
	}
	public void setBid_amount(String bid_amount) {
		this.bid_amount = bid_amount;
	}
	public String getBid_price() {
		return bid_price;
	}
	public void setBid_price(String bid_price) {
		this.bid_price = bid_price;
	}
	public String getBid_date() {
		return bid_date;
	}
	public void setBid_date(String bid_date) {
		this.bid_date = bid_date;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getRepresent_image() {
		return represent_image;
	}
	public void setRepresent_image(String represent_image) {
		this.represent_image = represent_image;
	}
	public String getAuction_end_date() {
		return auction_end_date;
	}
	public void setAuction_end_date(String auction_end_date) {
		this.auction_end_date = auction_end_date;
	}
	public String getCnt() {
		return cnt;
	}
	public void setCnt(String cnt) {
		this.cnt = cnt;
	}
	public String getEndChk() {
		return endChk;
	}
	public void setEndChk(String endChk) {
		this.endChk = endChk;
	}
	
	
	
	
}
	
