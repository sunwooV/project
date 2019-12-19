package project.Customers.P002.D002.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.Buy.P001.D003.vo.B_P001_D003VO;
import project.Buy.P001.D005.vo.B_P001_D005VO;
import project.Customers.P002.D002.vo.C_P002_D002VO;

public interface C_P002_D002DAO {
	public List<C_P002_D002VO> myBidList(Map<String, Object> datahMap) throws DataAccessException;
	//public String progressCh(Map<String, Object> datahMap) throws DataAccessException;
	public List<B_P001_D005VO> myBuyerList(Map<String, Object> datahMap) throws DataAccessException;
}
