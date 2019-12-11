package project.FleaMarket.P002.D003.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component("F_P002_D003VO")
public class F_P002_D003VO {
	private String flea_code = "";
	private String memberid = "";
	private String story_number = "";
	private String story_write_date = "";
	private String story_title = "";
	private String story_cotent = "";
	private String heart_count = "";
	private String secretMember;
	
	public F_P002_D003VO() {
		System.out.println("MemberVO 생성자 호출");
	}


	public String getFlea_code() {
		return flea_code;
	}


	public void setFlea_code(String flea_code) {
		this.flea_code = flea_code;
	}


	public String getMemberid() {
		return memberid;
	}


	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}


	public String getStory_number() {
		return story_number;
	}


	public void setStory_number(String story_number) {
		this.story_number = story_number;
	}


	public String getStory_write_date() {
		return story_write_date;
	}


	public void setStory_write_date(String story_write_date) {
		this.story_write_date = story_write_date;
	}


	public String getStory_title() {
		return story_title;
	}


	public void setStory_title(String story_title) {
		this.story_title = story_title;
	}


	public String getStory_cotent() {
		return story_cotent;
	}


	public void setStory_cotent(String story_cotent) {
		this.story_cotent = story_cotent;
	}


	public String getHeart_count() {
		return heart_count;
	}


	public void setHeart_count(String heart_count) {
		this.heart_count = heart_count;
	}


	public String getSecretMember() {
		return secretMember;
	}

	public void setSecretMember(String secretMember) {
		this.secretMember = secretMember;
	}


	
	
	

	
}
