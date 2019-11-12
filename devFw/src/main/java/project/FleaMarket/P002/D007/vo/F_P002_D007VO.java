package project.FleaMarket.P002.D007.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component("F_P002_D007VO")
public class F_P002_D007VO {
	private String memberid = "";
	private String flea_code = "";
	private String together_yn = "";
	private Date together_request_date;
	private Date together_approve_date;

	public F_P002_D007VO() {
		System.out.println("MemberVO 호출");
	}

	public String getMemberid() {
		return memberid;
	}

	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}

	public String getFlea_code() {
		return flea_code;
	}

	public void setFlea_code(String flea_code) {
		this.flea_code = flea_code;
	}

	public String getTogether_yn() {
		return together_yn;
	}

	public void setTogether_yn(String together_yn) {
		this.together_yn = together_yn;
	}

	public Date getTogether_request_date() {
		return together_request_date;
	}

	public void setTogether_request_date(Date together_request_date) {
		this.together_request_date = together_request_date;
	}

	public Date getTogether_approve_date() {
		return together_approve_date;
	}

	public void setTogether_approve_date(Date together_approve_date) {
		this.together_approve_date = together_approve_date;
	}


}
