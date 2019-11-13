package project.Buy.P001.D006.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.Buy.P001.D005.vo.B_P001_D005VO;

public interface B_P001_D006DAO {
	 public String kakaopayReady(Map<String, Object> searchMap) throws DataAccessException;
	 public B_P001_D005VO kakaopayInfo(String pg_token) throws DataAccessException;
}
