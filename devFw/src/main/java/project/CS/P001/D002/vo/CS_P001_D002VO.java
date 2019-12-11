package project.CS.P001.D002.vo;

import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestParam;

@Component("CS_P001_D002VO")
public class CS_P001_D002VO {
	private String division;
	private String title;
	private String contents;

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


	

}