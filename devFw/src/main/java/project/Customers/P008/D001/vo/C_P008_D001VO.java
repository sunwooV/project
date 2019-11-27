package project.Customers.P008.D001.vo;

import org.springframework.stereotype.Component;

@Component("C_P008_D001VO")
public class C_P008_D001VO {
	private String rank_group;
	private String grade_photo;
	private int rank_score;
	
	
	
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
	public int getRank_score() {
		return rank_score;
	}
	public void setRank_score(int rank_score) {
		this.rank_score = rank_score;
	}


}
