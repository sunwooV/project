package project.Buy.P003.D001.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("B_P003_D001VO")
public class B_P003_D001VO {

	private String return_number;
	private String order_number;
	private String return_reason;
	private Date return_date;
	private String return_approve_yn;
	
	public B_P003_D001VO() {
		System.out.println("B_P003_D001VO 생성자 호출 - 반품사유");
	}
	
	public String getReturn_number() {
		return return_number;
	}
	public void setReturn_number(String return_number) {
		this.return_number = return_number;
	}
	public String getOrder_number() {
		return order_number;
	}
	public void setOrder_number(String order_number) {
		this.order_number = order_number;
	}
	public String getReturn_reason() {
		return return_reason;
	}
	public void setReturn_reason(String return_reason) {
		this.return_reason = return_reason;
	}
	public Date getReturn_date() {
		return return_date;
	}
	public void setReturn_date(Date return_date) {
		this.return_date = return_date;
	}
	public String getReturn_approve_yn() {
		return return_approve_yn;
	}
	public void setReturn_approve_yn(String return_approve_yn) {
		this.return_approve_yn = return_approve_yn;
	}
	
}
