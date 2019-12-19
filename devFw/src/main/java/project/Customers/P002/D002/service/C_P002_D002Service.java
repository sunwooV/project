package project.Customers.P002.D002.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.Buy.P001.D005.vo.B_P001_D005VO;
import project.Customers.P002.D002.vo.C_P002_D002VO;

public interface C_P002_D002Service {
	public List<C_P002_D002VO> myBidList(Map<String, Object> searchMap) throws DataAccessException;
	//public String progressChk(Map<String, Object> searchMap) throws DataAccessException;
	public List<B_P001_D005VO> myBuyerList(Map<String, Object> searchMap) throws DataAccessException;
}
