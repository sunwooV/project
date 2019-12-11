package project.Buy.P001.D004.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("B_P001_D004VO")
public class B_P001_D004VO {
	//3테이블 공통사용
	private String order_num; 
	
	//order
	private String seller_memberid;
	private String buyer_memberid;
	private Date order_date;
	private String total_price;
	private String order_fix_yn;
	private String order_state;
	private String order_want;
	
	//orderitems
	private String prod_number;
	private	String quantity;
	private String item_price;
	private String get_method;
	
	//pay 
	private String pay_method;
	private String pay_price;
	private String pay_group;
	private Date pay_date;
	
	public B_P001_D004VO() {
		System.out.println("B_P001_D004VO 생성자호출!!!!");
	}

	public String getOrder_num() {
		return order_num;
	}

	public void setOrder_num(String order_num) {
		this.order_num = order_num;
	}

	public String getSeller_memberid() {
		return seller_memberid;
	}

	public void setSeller_memberid(String seller_memberid) {
		this.seller_memberid = seller_memberid;
	}

	public String getBuyer_memberid() {
		return buyer_memberid;
	}

	public void setBuyer_memberid(String buyer_memberid) {
		this.buyer_memberid = buyer_memberid;
	}

	public Date getOrder_date() {
		return order_date;
	}

	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}

	public String getTotal_price() {
		return total_price;
	}

	public void setTotal_price(String total_price) {
		this.total_price = total_price;
	}

	public String getOrder_fix_yn() {
		return order_fix_yn;
	}

	public void setOrder_fix_yn(String order_fix_yn) {
		this.order_fix_yn = order_fix_yn;
	}

	public String getOrder_state() {
		return order_state;
	}

	public void setOrder_state(String order_state) {
		this.order_state = order_state;
	}

	public String getOrder_want() {
		return order_want;
	}

	public void setOrder_want(String order_want) {
		this.order_want = order_want;
	}

	public String getProd_number() {
		return prod_number;
	}

	public void setProd_number(String prod_number) {
		this.prod_number = prod_number;
	}

	public String getQuantity() {
		return quantity;
	}

	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}

	public String getItem_price() {
		return item_price;
	}

	public void setItem_price(String item_price) {
		this.item_price = item_price;
	}

	public String getGet_method() {
		return get_method;
	}

	public void setGet_method(String get_method) {
		this.get_method = get_method;
	}

	public String getPay_method() {
		return pay_method;
	}

	public void setPay_method(String pay_method) {
		this.pay_method = pay_method;
	}

	public String getPay_price() {
		return pay_price;
	}

	public void setPay_price(String pay_price) {
		this.pay_price = pay_price;
	}

	public String getPay_group() {
		return pay_group;
	}

	public void setPay_group(String pay_group) {
		this.pay_group = pay_group;
	}

	public Date getPay_date() {
		return pay_date;
	}

	public void setPay_date(Date pay_date) {
		this.pay_date = pay_date;
	}
	
	
	
	
}
	
