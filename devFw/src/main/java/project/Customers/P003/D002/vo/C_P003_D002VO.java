package project.Customers.P003.D002.vo;

import org.springframework.stereotype.Component;

@Component("C_P003_D002VO")
public class C_P003_D002VO {
	private String category_code;
	private String category_name;
	private String highCategory;
	private String category_cnt;
	private String prod_number;
	private String prod_title;
	private String prod_price;
	private String sale_percent;
	private String auction_bid;
	private String reused_yn;
	private String auction_yn;
	private String flea_yn;
	private String represent_image;
	
	public String getCategory_code() {
		return category_code;
	}
	public void setCategory_code(String category_code) {
		this.category_code = category_code;
	}
	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	public String getHighCategory() {
		return highCategory;
	}
	public void setHighCategory(String highCategory) {
		this.highCategory = highCategory;
	}
	public String getCategory_cnt() {
		return category_cnt;
	}
	public void setCategory_cnt(String category_cnt) {
		this.category_cnt = category_cnt;
	}
	public String getProd_number() {
		return prod_number;
	}
	public void setProd_number(String prod_number) {
		this.prod_number = prod_number;
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
	public String getSale_percent() {
		return sale_percent;
	}
	public void setSale_percent(String sale_percent) {
		this.sale_percent = sale_percent;
	}
	public String getAuction_bid() {
		return auction_bid;
	}
	public void setAuction_bid(String auction_bid) {
		this.auction_bid = auction_bid;
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
	public String getRepresent_image() {
		return represent_image;
	}
	public void setRepresent_image(String represent_image) {
		this.represent_image = represent_image;
	}
	
	
}
