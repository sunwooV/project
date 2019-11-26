package project.Product.P001.D001.vo;

import org.springframework.stereotype.Component;

@Component("P_P001_D001VO")
public class P_P001_D001VO {
	private String prod_number;
	private String prod_amount;
	private String reused_yn;
	private String auction_yn;
	private String flea_yn;
	private String memberId;
	private String prod_price;
	private String prod_title;
	private String sale_percent;
	private String direct_area;
	private String auction_bid;
	private String represent_image;
	private String auction_price;
	private String category_code;
	private String category_name;
	private String high_category;
	private String b_cnt;
	private String m_cnt;
	
	public P_P001_D001VO(){
		System.out.println("P_P001_D001_VO 호출");
	}
	public String getProd_number() {
		return prod_number;
	}
	public void setProd_number(String prod_number) {
		this.prod_number = prod_number;
	}
	
	public String getProd_amount() {
		return prod_amount;
	}
	public void setProd_amount(String prod_amount) {
		this.prod_amount = prod_amount;
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
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getProd_price() {
		return prod_price;
	}
	public void setProd_price(String prod_price) {
		this.prod_price = prod_price;
	}
	public String getProd_title() {
		return prod_title;
	}
	public void setProd_title(String prod_title) {
		this.prod_title = prod_title;
	}
	public String getSale_percent() {
		return sale_percent;
	}
	public void setSale_percent(String sale_percent) {
		this.sale_percent = sale_percent;
	}
	public String getDirect_area() {
		return direct_area;
	}
	public void setDirect_area(String direct_area) {
		this.direct_area = direct_area;
	}
	public String getAuction_bid() {
		return auction_bid;
	}
	public void setAuction_bid(String aution_bid) {
		this.auction_bid = aution_bid;
	}

	public String getRepresent_image() {
		return represent_image;
	}
	public void setRepresent_image(String represent_image) {
		this.represent_image = represent_image;
	}
	public String getAuction_price() {
		return auction_price;
	}
	public void setAuction_price(String auction_price) {
		this.auction_price = auction_price;
	}
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
	public String getHigh_category() {
		return high_category;
	}
	public void setHigh_category(String high_category) {
		this.high_category = high_category;
	}
	public String getB_cnt() {
		return b_cnt;
	}
	public void setB_cnt(String b_cnt) {
		this.b_cnt = b_cnt;
	}
	public String getM_cnt() {
		return m_cnt;
	}
	public void setM_cnt(String m_cnt) {
		this.m_cnt = m_cnt;
	}
}
