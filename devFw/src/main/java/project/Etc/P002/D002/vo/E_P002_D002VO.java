package project.Etc.P002.D002.vo;

import org.springframework.stereotype.Component;

@Component("E_P002_D002VO")
public class E_P002_D002VO {
	private String board_num;
	private String board_name;
	private String board_use;
	
	public String getBoard_num() {
		return board_num;
	}
	public void setBoard_num(String board_num) {
		this.board_num = board_num;
	}

	public String getBoard_name() {
		return board_name;
	}
	public void setBoard_name(String board_name) {
		this.board_name = board_name;
	}
	public String getBoard_use() {
		return board_use;
	}
	public void setBoard_use(String board_use) {
		this.board_use = board_use;
	}

}
