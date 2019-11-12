package project.Customers.P007.D001.vo;

import org.springframework.stereotype.Component;

@Component("C_P007_D001VO")
public class C_P007_D001VO {
	
	private String point_group;
	private String point_code;
	private String point_content;
	private int point_score;

	
	
	public String getPoint_group() {
		return point_group;
	}
	public void setPoint_group(String point_group) {
		this.point_group = point_group;
	}
	public String getPoint_code() {
		return point_code;
	}
	public void setPoint_code(String point_code) {
		this.point_code = point_code;
	}
	public String getPoint_content() {
		return point_content;
	}
	public void setPoint_content(String point_content) {
		this.point_content = point_content;
	}
	public int getPoint_score() {
		return point_score;
	}
	public void setPoint_score(int point_score) {
		this.point_score = point_score;
	}
	
}
