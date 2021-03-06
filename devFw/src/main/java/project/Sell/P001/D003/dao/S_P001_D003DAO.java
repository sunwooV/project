package project.Sell.P001.D003.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.Sell.P001.D003.vo.S_P001_D003VO;

public interface S_P001_D003DAO {
	public void insertQnA(Map<String, Object> datahMap) throws DataAccessException;
	public void deleteQnA(Map<String, Object> datahMap) throws DataAccessException;
	public void insertAnswer(Map<String, Object> datahMap) throws DataAccessException;
	public void deleteAnswer(Map<String, Object> datahMap) throws DataAccessException;
	
	public List<S_P001_D003VO> selectQnA(Map<String, Object> searchMap) throws DataAccessException;
	public List<S_P001_D003VO> selectAnswer(Map<String, Object> searchMap) throws DataAccessException;
}
