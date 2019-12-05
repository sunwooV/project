package project.Sell.P001.D001.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.Sell.P001.D001.vo.S_P001_D001VO;
import project.Sell.P001.D002.vo.S_P001_D002VO;
import project.hm.p0001.vo.P0001VO;
import project.hm.s0002.vo.S0002VO;

public interface S_P001_D001DAO {
	
	public List<S_P001_D001VO> high_category(Map<String, Object> searchMap) throws DataAccessException;
	public List<S_P001_D001VO> middle_category(Map<String, Object> searchMap) throws DataAccessException;
	public List<S_P001_D001VO> partFlea(Map<String, Object> searchMap) throws DataAccessException;
	public String selectProdNumber() throws DataAccessException;
	public String checkSeller(Map<String, Object> searchMap) throws DataAccessException;
	
	public void insertProduct(Map<String, Object> datahMap) throws DataAccessException;
	public void insertTag(Map<String, Object> datahMap) throws DataAccessException;
}
