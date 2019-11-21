package project.Sell.P001.D008.vo;

import org.springframework.stereotype.Component;

@Component("S_P001_D008VO")
public class S_P001_D008VO {
	private String prod_number;
	private String reused_yn;
	private String flea_yn;
	private String date_check;
	private String auction_bid;
	private String auction_price;
	public String getProd_number() {
		return prod_number;
	}
	public void setProd_number(String prod_number) {
		this.prod_number = prod_number;
	}
	public String getReused_yn() {
		return reused_yn;
	}
	public void setReused_yn(String reused_yn) {
		this.reused_yn = reused_yn;
	}
	public String getFlea_yn() {
		return flea_yn;
	}
	public void setFlea_yn(String flea_yn) {
		this.flea_yn = flea_yn;
	}
	public String getDate_check() {
		return date_check;
	}
	public void setDate_check(String date_check) {
		this.date_check = date_check;
	}
	public String getAuction_bid() {
		return auction_bid;
	}
	public void setAuction_bid(String auction_bid) {
		this.auction_bid = auction_bid;
	}
	public String getAuction_price() {
		return auction_price;
	}
	public void setAuction_price(String auction_price) {
		this.auction_price = auction_price;
	}
	

}
