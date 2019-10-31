package project.FleaMarket.P001.D003.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component("F_P001_D003VO")
public class F_P001_D003VO {
	private String join_code = "";
	private String join_name = "";
	private String join_phonenumber = "";
	private String join_email = "";
	private String join_companynumber = "";
	private String join_product = "";
	private String join_sns = "";
	private String join_etc = "";
	
	public F_P001_D003VO() {
		System.out.println("MemberVO 생성자 호출");
	}

	public String getJoin_code() {
		return join_code;
	}

	public void setJoin_code(String join_code) {
		this.join_code = join_code;
	}

	public String getJoin_name() {
		return join_name;
	}

	public void setJoin_name(String join_name) {
		this.join_name = join_name;
	}

	public String getJoin_phonenumber() {
		return join_phonenumber;
	}

	public void setJoin_phonenumber(String join_phonenumber) {
		this.join_phonenumber = join_phonenumber;
	}

	public String getJoin_email() {
		return join_email;
	}

	public void setJoin_email(String join_email) {
		this.join_email = join_email;
	}

	public String getJoin_companynumber() {
		return join_companynumber;
	}

	public void setJoin_companynumber(String join_companynumber) {
		this.join_companynumber = join_companynumber;
	}

	public String getJoin_product() {
		return join_product;
	}

	public void setJoin_product(String join_product) {
		this.join_product = join_product;
	}

	public String getJoin_sns() {
		return join_sns;
	}

	public void setJoin_sns(String join_sns) {
		this.join_sns = join_sns;
	}

	public String getJoin_etc() {
		return join_etc;
	}

	public void setJoin_etc(String join_etc) {
		this.join_etc = join_etc;
	}
	
	

	
	

	
}
