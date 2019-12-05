package project.Sell.P001.D001.vo;

import org.springframework.stereotype.Component;

@Component("S_P001_D001VO")
public class S_P001_D001VO {
	private String category_code="";
	private String category_name="";
	private String high_category="";
	private String flea_code="";
	private String flea_name="";

	public String getCategory_code() {
		return category_code;
	}
	public void setCategory_code(String category_code) {
		this.category_code = category_code;
	}
	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	public String getHigh_category() {
		return high_category;
	}
	public void setHigh_category(String high_category) {
		this.high_category = high_category;
	}
	public String getFlea_code() {
		return flea_code;
	}
	public void setFlea_code(String flea_code) {
		this.flea_code = flea_code;
	}
	public String getFlea_name() {
		return flea_name;
	}
	public void setFlea_name(String flea_name) {
		this.flea_name = flea_name;
	}

	
}
