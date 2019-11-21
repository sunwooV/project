package project.Customers.P006.D001.vo;

import java.util.Date;

import org.springframework.stereotype.Component;


@Component("C_P006_D001VO")
public class C_P006_D001VO {
	private String memberid;
	private String pw;
	private String email;
	private String name;
	private String birth;
	private String phonenumber;
	private Date reg_date;
	private Date log_date;
	private Date out_member_date;
	private String approval_status;
	private String member_group;
	private String seller_group;
	private String flea_seller_group;
	private String blacklist_yn;
	private String verify;
	public String getMemberid() {
		return memberid;
	}
	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getPhonenumber() {
		return phonenumber;
	}
	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public Date getLog_date() {
		return log_date;
	}
	public void setLog_date(Date log_date) {
		this.log_date = log_date;
	}
	public String getApproval_status() {
		return approval_status;
	}
	public void setApproval_status(String approval_status) {
		this.approval_status = approval_status;
	}
	public String getMember_group() {
		return member_group;
	}
	public void setMember_group(String member_group) {
		this.member_group = member_group;
	}
	public String getSeller_group() {
		return seller_group;
	}
	public void setSeller_group(String seller_group) {
		this.seller_group = seller_group;
	}
	public String getFlea_seller_group() {
		return flea_seller_group;
	}
	public void setFlea_seller_group(String flea_seller_group) {
		this.flea_seller_group = flea_seller_group;
	}
	public String getBlacklist_yn() {
		return blacklist_yn;
	}
	public void setBlacklist_yn(String blacklist_yn) {
		this.blacklist_yn = blacklist_yn;
	}
	public String getVerify() {
		return verify;
	}
	public void setVerify(String verify) {
		this.verify = verify;
	}
	public Date getOut_member_date() {
		return out_member_date;
	}
	public void setOut_member_date(Date out_member_date) {
		this.out_member_date = out_member_date;
	}
	
	
	


}
