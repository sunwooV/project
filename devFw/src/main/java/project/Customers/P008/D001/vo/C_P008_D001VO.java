package project.Customers.P008.D001.vo;

import org.springframework.stereotype.Component;

@Component("C_P008_D001VO")
public class C_P008_D001VO {
	
	private String rank_code;
	private String rank_group;
	private String grade_photo;
	private String rank_score;
	
	
	
	public String getRank_code() {
		return rank_code;
	}
	public void setRank_code(String rank_code) {
		this.rank_code = rank_code;
	}
	public String getRank_group() {
		return rank_group;
	}
	public void setRank_group(String rank_group) {
		this.rank_group = rank_group;
	}
	public String getGrade_photo() {
		return grade_photo;
	}
	public void setGrade_photo(String grade_photo) {
		this.grade_photo = grade_photo;
	}
	public String getRank_score() {
		return rank_score;
	}
	public void setRank_score(String rank_score) {
		this.rank_score = rank_score;
	}


}
