package project.CS.P001.D001.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.CS.P001.D001.vo.PagingVO;

public interface CS_P001_D001Service {
	 public List listEvent(PagingVO vo) throws DataAccessException;
	 public List<Map<String,Object>> selectBoardDetail(Map<String, Object> dataMap) throws DataAccessException;
	 public int countBoard();

}

