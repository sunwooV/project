package project.FleaMarket.P003.D002.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;
import project.FleaMarket.P003.D001.vo.F_P003_D001VO;

public interface F_P003_D002DAO {
	 public List<F_P003_D001VO> searchList(Map<String, Object> searchMap) throws DataAccessException;
	 public List<F_P003_D001VO> searchMod(Map<String, Object> searchMap) throws DataAccessException;
	 public List<F_P003_D001VO> searchAdd() throws DataAccessException;
	 
	 public void updateMember(Map<String, Object> datahMap) throws DataAccessException;
	 public void insertMember(Map<String, Object> datahMap) throws DataAccessException;
	 public void deleteMember(Map<String, Object> datahMap) throws DataAccessException;
	 
}
