package project.Buy.P001.D004.vo;

import org.springframework.stereotype.Component;

@Component("B_P001_D004VO")
public class B_P001_D004VO {
	
	//pay DB컬럼명과 일치!
	private String orderNum;
	private String payMethod;
	private int payPrice;
	private String payGroup;
	private String accountTransferYN;
		
	public B_P001_D004VO() {
		System.out.println("B_P001_D004VO 생성자호출!!!!");
	}
	public String getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
	}
	public String getPayMethod() {
		return payMethod;
	}
	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}
	public int getPayPrice() {
		return payPrice;
	}
	public void setPayPrice(int payPrice) {
		this.payPrice = payPrice;
	}
	public String getPayGroup() {
		return payGroup;
	}
	public void setPayGroup(String payGroup) {
		this.payGroup = payGroup;
	}
	public String getAccountTransferYN() {
		return accountTransferYN;
	}
	public void setAccountTransferYN(String accountTransferYN) {
		this.accountTransferYN = accountTransferYN;
	}	
	
}
	
