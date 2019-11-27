package project.Buy.P003.D001.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.Buy.P002.D002.vo.B_P002_D002VO;

public interface B_P003_D001Service {
	 public void insertChangeReason(Map<String, Object> searchMap) throws DataAccessException;
}
