package project.CS.P001.D003.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.CS.P001.D001.vo.PagingVO;
import project.CS.P001.D003.vo.CS_P001_D003VO;


public interface CS_P001_D003DAO {
	
	public List privatelist(Map<String, Object> searchMap) throws DataAccessException;
	public int countBoard();
	public List selectBoardDetail(Map<String, Object> dataMap);
	void deletecomment(Map<String, Object> datahMap) throws DataAccessException;
	public void insertcomment(Map<String, Object> datahMap) throws DataAccessException;
	public List<CS_P001_D003VO> selectcomment(Map<String, Object> searchMap) throws DataAccessException;
	public List<CS_P001_D003VO> selectboard(Map<String, Object> searchMap) throws DataAccessException ;
	public void updateYN(Map<String, Object> dataMap);

}
