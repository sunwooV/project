package project.FleaMarket.P002.D003.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;
import project.FleaMarket.P002.D003.vo.F_P002_D003VO;

public interface F_P002_D003DAO {
	 public List<F_P002_D003VO> searchList(Map<String, Object> searchMap) throws DataAccessException;
	 public List<F_P002_D003VO> searchMod(Map<String, Object> searchMap) throws DataAccessException;
	 public List<F_P002_D003VO> searchAdd() throws DataAccessException;
	 
	 public void updateMember(Map<String, Object> datahMap) throws DataAccessException;
	 public void insertMember(Map<String, Object> datahMap) throws DataAccessException;
	 public void deleteMember(Map<String, Object> datahMap) throws DataAccessException;
	 
}
