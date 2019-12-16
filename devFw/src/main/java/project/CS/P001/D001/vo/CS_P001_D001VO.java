package project.CS.P001.D001.vo;

import java.util.Date;

import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestParam;

@Component("CS_P001_D001VO")
public class CS_P001_D001VO {
	private String no_number;
	private String no_title;
	private String no_contents;
	private String no_writer;
	private Date no_writedate;
	private String no_view_cnt;
	private String division;
	private String title;
	private String contents;

	public String getNo_number() {
		return no_number;
	}

	public void setNo_number(String no_number) {
		this.no_number = no_number;
	}

	public String getNo_title() {
		return no_title;
	}

	public void setNo_title(String no_title) {
		this.no_title = no_title;
	}

	public String getNo_contents() {
		return no_contents;
	}

	public void setNo_contents(String no_contents) {
		this.no_contents = no_contents;
	}

	public String getNo_writer() {
		return no_writer;
	}

	public void setNo_writer(String no_writer) {
		this.no_writer = no_writer;
	}

	public Date getNo_writedate() {
		return no_writedate;
	}

	public void setNo_writedate(Date no_writedate) {
		this.no_writedate = no_writedate;
	}

	public String getNo_view_cnt() {
		return no_view_cnt;
	}

	public void setNo_view_cnt(String no_view_cnt) {
		this.no_view_cnt = no_view_cnt;
	}

	public String getDivision() {
		return division;
	}

	public void setDivision(String division) {
		this.division = division;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	@Override
	public String toString() {
		return "CS_P001_D001VO [no_writer=" + no_writer + ", no_writedate=" + no_writedate + "]";
	}


}