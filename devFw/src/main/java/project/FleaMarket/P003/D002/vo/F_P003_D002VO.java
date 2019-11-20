package project.FleaMarket.P003.D002.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component("F_P003_D001VO")
public class F_P003_D002VO {
	private String flea_code = "";
	private String offline_name = "";
	private String offline_date = "";
	private String offline_location = "";
	private String offline_time = "";
	private String map_code = "";
	
	public F_P003_D002VO() {
		System.out.println("MemberVO 생성자 호출");
	}

	public String getFlea_code() {
		return flea_code;
	}

	public void setFlea_code(String flea_code) {
		this.flea_code = flea_code;
	}

	public String getOffline_name() {
		return offline_name;
	}

	public void setOffline_name(String offline_name) {
		this.offline_name = offline_name;
	}

	public String getOffline_date() {
		return offline_date;
	}

	public void setOffline_date(String offline_date) {
		this.offline_date = offline_date;
	}

	public String getOffline_location() {
		return offline_location;
	}

	public void setOffline_location(String offline_location) {
		this.offline_location = offline_location;
	}

	public String getOffline_time() {
		return offline_time;
	}

	public void setOffline_time(String offline_time) {
		this.offline_time = offline_time;
	}

	public String getMap_code() {
		return map_code;
	}

	public void setMap_code(String map_code) {
		this.map_code = map_code;
	}
	
	
	

	
}
