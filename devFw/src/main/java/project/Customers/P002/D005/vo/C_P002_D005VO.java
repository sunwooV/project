package project.Customers.P002.D005.vo;

import java.util.Date;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

@Component("C_P002_D005VO")
@Scope("prototype")
public class C_P002_D005VO {
	
	private int chat_no;
	private String sender;
	private String receiver;
	private String contents;
	private Date send_date;
	private String me_at;
	private String prod_number;
	
	

	public int getChat_no() {
		return chat_no;
	}
	public void setChat_no(int chat_no) {
		this.chat_no = chat_no;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Date getSend_date() {
		return send_date;
	}
	public void setSend_date(Date send_date) {
		this.send_date = send_date;
	}
	public String getMe_at() {
		return me_at;
	}
	public void setMe_at(String me_at) {
		this.me_at = me_at;
	}
	public String getProd_number() {
		return prod_number;
	}
	public void setProd_number(String prod_number) {
		this.prod_number = prod_number;
	}
	
	
}