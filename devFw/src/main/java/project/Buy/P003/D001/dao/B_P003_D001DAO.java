package project.Buy.P003.D001.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;




public interface B_P003_D001DAO {
	 public void insertChangeReason(Map<String, Object> searchMap) throws DataAccessException;
//	 public List<B_P001_D003VO> searchMod(Map<String, Object> searchMap) throws DataAccessException;
//	 public List<B_P001_D003VO> searchAdd() throws DataAccessException;

}
