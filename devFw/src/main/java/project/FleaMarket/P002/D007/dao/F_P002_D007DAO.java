package project.FleaMarket.P002.D007.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;
import project.FleaMarket.P002.D007.vo.F_P002_D007VO;

public interface F_P002_D007DAO {
	 public List<F_P002_D007VO> searchList(Map<String, Object> searchMap) throws DataAccessException;
	 public List<F_P002_D007VO> searchMod(Map<String, Object> searchMap) throws DataAccessException;
	 public List<F_P002_D007VO> searchAdd() throws DataAccessException;
	 
	 public void updateMember(Map<String, Object> datahMap) throws DataAccessException;
	 public void insertMember(Map<String, Object> datahMap) throws DataAccessException;
	 public void deleteMember(Map<String, Object> datahMap) throws DataAccessException;
	 
}
