package project.CS.P001.D002.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.Buy.P001.D003.vo.B_P001_D003VO;
import project.CS.P001.D001.vo.CS_P001_D001VO;
import project.CS.P001.D001.vo.PagingVO;

public interface CS_P001_D002DAO {
	 public List detailAllrefuList() throws DataAccessException;
	 public List detailAllfaqList() throws DataAccessException;
	 public List detailAlldelivList() throws DataAccessException;
	 public List detailAllcouponList() throws DataAccessException;
	 public	List detailAllpayList() throws DataAccessException;
	 
	


}
