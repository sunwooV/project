package project.Buy.P001.D004.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.Buy.P001.D004.vo.B_P001_D004VO;

public interface B_P001_D004Service {
	 public List<B_P001_D004VO> insertPaymentInfo(Map<String, Object> searchMap) throws DataAccessException;
}
