package project.Customers.P002.D008.vo;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component("C_P002_D008VO")
public class C_P002_D008VO {
	private String member_point_code;
	private String memberid;
	private int point_number;
	private int useable_point;
	private int disappear_point;
	private int use_point;
	private int total_point;
	private Date point_start;
	private Date disappear_point_date;
	private Date use_point_date;
	private String point_content;
	
	
	public String getMember_point_code() {
		return member_point_code;
	}
	public void setMember_point_code(String member_point_code) {
		this.member_point_code = member_point_code;
	}
	public String getMemberid() {
		return memberid;
	}

	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}
	public int getPoint_number() {
		return point_number;
	}
	public void setPoint_number(int point_number) {
		this.point_number = point_number;
	}
	public int getUseable_point() {
		return useable_point;
	}
	public void setUseable_point(int useable_point) {
		this.useable_point = useable_point;
	}
	public int getDisappear_point() {
		return disappear_point;
	}
	public void setDisappear_point(int disappear_point) {
		this.disappear_point = disappear_point;
	}
	public int getUse_point() {
		return use_point;
	}
	public void setUse_point(int use_point) {
		this.use_point = use_point;
	}
	public int getTotal_point() {
		return total_point;
	}
	public void setTotal_point(int total_point) {
		this.total_point = total_point;
	}
	public Date getPoint_start() {
		return point_start;
	}
	public void setPoint_start(Date point_start) {
		this.point_start = point_start;
	}
	public Date getDisappear_point_date() {
		return disappear_point_date;
	}
	public void setDisappear_point_date(Date disappear_point_date) {
		this.disappear_point_date = disappear_point_date;
	}
	public Date getUse_point_date() {
		return use_point_date;
	}
	public void setUse_point_date(Date use_point_date) {
		this.use_point_date = use_point_date;
	}
	public String getPoint_content() {
		return point_content;
	}
	public void setPoint_content(String point_content) {
		this.point_content = point_content;
	}
	
	
	
}
