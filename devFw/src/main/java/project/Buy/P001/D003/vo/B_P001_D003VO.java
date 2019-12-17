package project.Buy.P001.D003.vo;

import org.springframework.stereotype.Component;

@Component("B_P001_D003VO")
public class B_P001_D003VO {


	private String represent_image; // prodphoto
	private String prod_title;//
	private int prod_price;
	
	// cart Info
	private String member_ID;
	private String prod_number;
	private int cart_count;
	private int option_number;
	private int cart_list_number;
	private int real_prod_price;
	private int prod_amount;
	
	
	
	
	
	
	public int getProd_amount() {
		return prod_amount;
	}

	public void setProd_amount(int prod_amount) {
		this.prod_amount = prod_amount;
	}

	public int getReal_prod_price() {
		return real_prod_price;
	}

	public void setReal_prod_price(int real_prod_price) {
		this.real_prod_price = real_prod_price;
	}

	public B_P001_D003VO() {
		System.out.println("B_P001_D003VO 호출");
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

	public String getMember_ID() {
		return member_ID;
	}
	public void setMember_ID(String member_ID) {
		this.member_ID = member_ID;
	}
	public String getProd_number() {
		return prod_number;
	}
	public void setProd_number(String prod_number) {
		this.prod_number = prod_number;
	}
	public int getOption_number() {
		return option_number;
	}
	public void setOption_number(int option_number) {
		this.option_number = option_number;
	}
	public int getCart_list_number() {
		return cart_list_number;
	}
	public void setCart_list_number(int cart_list_number) {
		this.cart_list_number = cart_list_number;
	}
	public int getCart_count() {
		return cart_count;
	}
	public void setCart_count(int cart_count) {
		this.cart_count = cart_count;
	}

	public int getProd_price() {
		return prod_price;
	}

	public void setProd_price(int prod_price) {
		this.prod_price = prod_price;
	}
	
}
	
