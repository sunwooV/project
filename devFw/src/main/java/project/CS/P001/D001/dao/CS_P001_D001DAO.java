package project.CS.P001.D001.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.Buy.P001.D003.vo.B_P001_D003VO;
import project.CS.P001.D001.vo.CS_P001_D001VO;
import project.CS.P001.D001.vo.PagingVO;

public interface CS_P001_D001DAO {
	 public List selectAllEventList(PagingVO vo) throws DataAccessException;
	/*
	 * public List viewdelivery(PagingVO vo) throws DataAccessException;
	 */
	 public List selectBoardDetail(Map<String, Object> dataMap) throws DataAccessException;

	/*
	 * public List selectdeliveryDetail(Map<String, Object> dataMap) throws
	 * DataAccessException;
	 */
	 public List selectdeliveryList() throws DataAccessException;
	 public void updateCNT(Map<String, Object> dataMap) throws DataAccessException;
	 public int countBoard();



}
