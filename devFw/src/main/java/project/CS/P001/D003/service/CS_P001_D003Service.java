package project.CS.P001.D003.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.CS.P001.D001.vo.PagingVO;
import project.CS.P001.D003.vo.CS_P001_D003VO;


public interface CS_P001_D003Service {
	public List privatelist(Map<String, Object> searchMap) throws DataAccessException;
	public int countBoard();
	public List selectBoardDetail(Map<String, Object> dataMap) throws DataAccessException;
	void insertcomment(Map<String, Object> datahMap) throws Exception;
	List<CS_P001_D003VO> selectcomment(Map<String, Object> searchMap) throws DataAccessException;
	void deletecomment(Map<String, Object> datahMap) throws Exception;
	List<CS_P001_D003VO> selectboard(Map<String, Object> datahMap) throws DataAccessException;


}
