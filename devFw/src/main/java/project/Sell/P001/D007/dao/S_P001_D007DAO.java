package project.Sell.P001.D007.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.Sell.P001.D007.vo.S_P001_D007VO;

public interface S_P001_D007DAO {
	public List<S_P001_D007VO> selectBidRecord(Map<String, Object> searchMap) throws DataAccessException;
}
