package project.FleaMarket.P001.D002.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component("F_P001_D002VO")
public class F_P001_D002VO {
	private String flea_code = "";
	private String memberid = "";
	private String flea_name = "";
	private String intro_cotent = "";
	private String flea_like_count = "";
	private String profile_photo = "";
	private String main_photo = "";
	private String flea_group = "";
	private Date join_offline_date;
	private String recruit_yn = "";
	private String join_offline_time = "";
	private String join_offline_location = "";
	private String join_prepayment_yn = "";
	private String date_check = "";
	
	public F_P001_D002VO() {
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

	public String getFlea_name() {
		return flea_name;
	}

	public void setFlea_name(String flea_name) {
		this.flea_name = flea_name;
	}

	public String getIntro_cotent() {
		return intro_cotent;
	}

	public void setIntro_cotent(String intro_cotent) {
		this.intro_cotent = intro_cotent;
	}

	public String getFlea_like_count() {
		return flea_like_count;
	}

	public void setFlea_like_count(String flea_like_count) {
		this.flea_like_count = flea_like_count;
	}

	public String getProfile_photo() {
		return profile_photo;
	}

	public void setProfile_photo(String profile_photo) {
		this.profile_photo = profile_photo;
	}

	public String getMain_photo() {
		return main_photo;
	}

	public void setMain_photo(String main_photo) {
		this.main_photo = main_photo;
	}

	public String getFlea_group() {
		return flea_group;
	}

	public void setFlea_group(String flea_group) {
		this.flea_group = flea_group;
	}

	public String getJoin_offline_time() {
		return join_offline_time;
	}

	public void setJoin_offline_time(String join_offline_time) {
		this.join_offline_time = join_offline_time;
	}

	public String getJoin_offline_location() {
		return join_offline_location;
	}

	public void setJoin_offline_location(String join_offline_location) {
		this.join_offline_location = join_offline_location;
	}

	public String getJoin_prepayment_yn() {
		return join_prepayment_yn;
	}

	public void setJoin_prepayment_yn(String join_prepayment_yn) {
		this.join_prepayment_yn = join_prepayment_yn;
	}

	public Date getJoin_offline_date() {
		return join_offline_date;
	}

	public void setJoin_offline_date(Date join_offline_date) {
		this.join_offline_date = join_offline_date;
	}

	public String getRecruit_yn() {
		return recruit_yn;
	}

	public void setRecruit_yn(String recruit_yn) {
		this.recruit_yn = recruit_yn;
	}

	public String getDate_check() {
		return date_check;
	}

	public void setDate_check(String date_check) {
		this.date_check = date_check;
	}

	
	
	
}
