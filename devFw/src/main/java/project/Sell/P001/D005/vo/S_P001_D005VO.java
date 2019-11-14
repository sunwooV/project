package project.Sell.P001.D005.vo;

import org.springframework.stereotype.Component;

@Component("S_P001_D005VO")
public class S_P001_D005VO {
	private String prod_number;
	private String reused_yn;
	private String auction_yn;
	private String flea_yn;
	private String prod_category_code;
	private String memberId;
	private String prod_price;
	private String prod_amount;
	private String prod_title;
	private String send_way;
	private String post_date;
	private String edit_date;
	private String sale_percent;
	private String buy_price;
	private String direct_area;
	private String auction_area;
	private String auction_bid;
	private String auction_start_date;
	private String auction_end_date;
	private String auction_date;
	private String editor;
	private String tag1;
	private String tag2;
	private String tag3;
	private String tag4;
	private String tag5;
	private String represent_image;
	private String auction_price;
	private String heart;
	private String left_day;
	private String left_hour;
	private String left_min;
	private String left_second;
	
	public S_P001_D005VO(){
		System.out.println("S_P001_D005_VO 호출");
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
	public String getProd_category_code() {
		return prod_category_code;
	}
	public void setProd_category_code(String prod_category_code) {
		this.prod_category_code = prod_category_code;
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
	public String getProd_amount() {
		return prod_amount;
	}
	public void setProd_amount(String prod_amount) {
		this.prod_amount = prod_amount;
	}
	public String getProd_title() {
		return prod_title;
	}
	public void setProd_title(String prod_title) {
		this.prod_title = prod_title;
	}
	public String getSend_way() {
		return send_way;
	}
	public void setSend_way(String send_way) {
		this.send_way = send_way;
	}
	public String getPost_date() {
		return post_date;
	}
	public void setPost_date(String post_date) {
		this.post_date = post_date;
	}
	public String getEdit_date() {
		return edit_date;
	}
	public void setEdit_date(String edit_date) {
		this.edit_date = edit_date;
	}
	public String getSale_percent() {
		return sale_percent;
	}
	public void setSale_percent(String sale_percent) {
		this.sale_percent = sale_percent;
	}
	public String getBuy_price() {
		return buy_price;
	}
	public void setBuy_price(String buy_price) {
		this.buy_price = buy_price;
	}
	public String getDirect_area() {
		return direct_area;
	}
	public void setDirect_area(String direct_area) {
		this.direct_area = direct_area;
	}
	public String getAuction_area() {
		return auction_area;
	}
	public void setAuction_area(String auction_area) {
		this.auction_area = auction_area;
	}
	public String getAuction_bid() {
		return auction_bid;
	}
	public void setAuction_bid(String aution_bid) {
		this.auction_bid = aution_bid;
	}
	public String getAuction_start_date() {
		return auction_start_date;
	}
	public void setAuction_start_date(String aution_start_date) {
		this.auction_start_date = aution_start_date;
	}
	public String getAuction_end_date() {
		return auction_end_date;
	}
	public void setAuction_end_date(String aution_end_date) {
		this.auction_end_date = aution_end_date;
	}
	
	public String getEditor() {
		return editor;
	}
	public void setEditor(String editor) {
		this.editor = editor;
	}

	public String getTag1() {
		return tag1;
	}
	public void setTag1(String tag1) {
		this.tag1 = tag1;
	}
	public String getTag2() {
		return tag2;
	}
	public void setTag2(String tag2) {
		this.tag2 = tag2;
	}
	public String getTag3() {
		return tag3;
	}
	public void setTag3(String tag3) {
		this.tag3 = tag3;
	}
	public String getTag4() {
		return tag4;
	}
	public void setTag4(String tag4) {
		this.tag4 = tag4;
	}
	public String getTag5() {
		return tag5;
	}
	public void setTag5(String tag5) {
		this.tag5 = tag5;
	}
	public String getRepresent_image() {
		return represent_image;
	}
	public void setRepresent_image(String represent_image) {
		this.represent_image = represent_image;
	}
	public String getAuction_date() {
		return auction_date;
	}
	public void setAuction_date(String auction_date) {
		this.auction_date = auction_date;
	}
	public String getAuction_price() {
		return auction_price;
	}
	public void setAuction_price(String auction_price) {
		this.auction_price = auction_price;
	}

	public String getHeart() {
		return heart;
	}
	public void setHeart(String heart) {
		this.heart = heart;
	}
	public String getLeft_day() {
		return left_day;
	}
	public void setLeft_day(String left_day) {
		this.left_day = left_day;
	}
	public String getLeft_hour() {
		return left_hour;
	}
	public void setLeft_hour(String left_hour) {
		this.left_hour = left_hour;
	}
	public String getLeft_min() {
		return left_min;
	}
	public void setLeft_min(String left_min) {
		this.left_min = left_min;
	}
	public String getLeft_second() {
		return left_second;
	}
	public void setLeft_second(String left_second) {
		this.left_second = left_second;
	}
	
}
