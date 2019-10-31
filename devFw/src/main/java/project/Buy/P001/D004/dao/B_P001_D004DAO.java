package project.Buy.P001.D004.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.Buy.P001.D004.vo.B_P001_D004VO;

public interface B_P001_D004DAO {
	 public List<B_P001_D004VO> insertPaymentInfo(Map<String, Object> searchMap) throws DataAccessException;

}
