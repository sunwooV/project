package project.Customers.P002.D008.vo;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component("C_P002_D008VO")
public class C_P002_D008VO {
	private String member_point_code;
	private String memberid;
	private int useable_point;
	private int disappear_point;
	private int use_point;
	private int total_point;
	private Date point_start;
	private Date disappear_point_date;
	private Date use_point_date;
	private String content;
	private int score;
	private String rank_code;
	private String rank_group;
	private String grade_photo;
	private String rank_score;
	

	
	
	public String getMember_point_code() {
		return member_point_code;
	}
	public void setMember_point_code(String member_point_code) {
		this.member_point_code = member_point_code;
	}
	public String getMemberid() {
		return memberid;
	}

	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}
	public int getUseable_point() {
		return useable_point;
	}
	public void setUseable_point(int useable_point) {
		this.useable_point = useable_point;
	}
	public int getDisappear_point() {
		return disappear_point;
	}
	public void setDisappear_point(int disappear_point) {
		this.disappear_point = disappear_point;
	}
	public int getUse_point() {
		return use_point;
	}
	public void setUse_point(int use_point) {
		this.use_point = use_point;
	}
	public int getTotal_point() {
		return total_point;
	}
	public void setTotal_point(int total_point) {
		this.total_point = total_point;
	}
	public Date getPoint_start() {
		return point_start;
	}
	public void setPoint_start(Date point_start) {
		this.point_start = point_start;
	}
	public Date getDisappear_point_date() {
		return disappear_point_date;
	}
	public void setDisappear_point_date(Date disappear_point_date) {
		this.disappear_point_date = disappear_point_date;
	}
	public Date getUse_point_date() {
		return use_point_date;
	}
	public void setUse_point_date(Date use_point_date) {
		this.use_point_date = use_point_date;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}	

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
	@Override
    public String toString() {
        return "C_P002_D008VO [point_start=" + point_start + ", content=" + content + ", score=" + score + " ]";
    }
 
}
