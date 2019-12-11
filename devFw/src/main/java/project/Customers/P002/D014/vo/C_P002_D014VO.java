package project.Customers.P002.D014.vo;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

@Component("C_P002_D014VO")
@Scope("prototype")
public class C_P002_D014VO {
	private String prod_number;
	private String reused_yn;
	private String auction_yn;
	private String flea_yn;
	private String send_way;
	private String represent_image;
	private String prod_title;
	private String prod_price;
	private String auction_bid;
	private String sale_percent;
	private String prod_amount;
	
	public String getProd_amount() {
		return prod_amount;
	}
	public void setProd_amount(String prod_amount) {
		this.prod_amount = prod_amount;
	}
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
	public String getAuction_yn() {
		return auction_yn;
	}
	public void setAuction_yn(String auction_yn) {
		this.auction_yn = auction_yn;
	}
	public String getFlea_yn() {
		return flea_yn;
	}
	public void setFlea_yn(String flea_yn) {
		this.flea_yn = flea_yn;
	}
	public String getSend_way() {
		return send_way;
	}
	public void setSend_way(String send_way) {
		this.send_way = send_way;
	}
	public String getRepresent_image() {
		return represent_image;
	}
	public void setRepresent_image(String represent_image) {
		this.represent_image = represent_image;
	}
	public String getProd_title() {
		return prod_title;
	}
	public void setProd_title(String prod_title) {
		this.prod_title = prod_title;
	}
	public String getProd_price() {
		return prod_price;
	}
	public void setProd_price(String prod_price) {
		this.prod_price = prod_price;
	}
	public String getAuction_bid() {
		return auction_bid;
	}
	public void setAuction_bid(String auction_bid) {
		this.auction_bid = auction_bid;
	}
	public String getSale_percent() {
		return sale_percent;
	}
	public void setSale_percent(String sale_percent) {
		this.sale_percent = sale_percent;
	}
	
	
}
