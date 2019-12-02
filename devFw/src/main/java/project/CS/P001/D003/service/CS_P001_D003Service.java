package project.CS.P001.D003.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.CS.P001.D001.vo.PagingVO;


public interface CS_P001_D003Service {
	public List privatelist(PagingVO vo) throws DataAccessException;
	public int countBoard();
	public List selectBoardDetail(Map<String, Object> dataMap) throws DataAccessException;


}
