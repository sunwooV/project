package project.Sell.P001.D006.vo;

import org.springframework.stereotype.Component;

@Component("S_P001_D006VO")
public class S_P001_D006VO {
	private String prod_number;
	private String bid_number;
	private String bid_amount;
	private String bid_price;
	private String bid_date;
	private String bid_memberId;
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
	public String getBid_memberId() {
		return bid_memberId;
	}
	public void setBid_memberId(String bid_memberId) {
		this.bid_memberId = bid_memberId;
	}
	
	
}
