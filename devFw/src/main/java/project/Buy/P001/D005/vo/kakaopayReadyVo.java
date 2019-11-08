package project.Buy.P001.D005.vo;

import java.util.Date;

public class kakaopayReadyVo {

	
	//response
    private String tid, next_redirect_pc_url;
    private Date created_at;
    
    
	public kakaopayReadyVo() {
		System.out.println("kakappayReadyVO 생성자 호출");
		System.out.println("B_P001_D005VO 끝");
	}
	public String getTid() {
		return tid;
	}
	public void setTid(String tid) {
		this.tid = tid;
	}
	public String getNext_redirect_pc_url() {
		return next_redirect_pc_url;
	}
	public void setNext_redirect_pc_url(String next_redirect_pc_url) {
		this.next_redirect_pc_url = next_redirect_pc_url;
	}
	public Date getCreated_at() {
		return created_at;
	}
	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
    
}
