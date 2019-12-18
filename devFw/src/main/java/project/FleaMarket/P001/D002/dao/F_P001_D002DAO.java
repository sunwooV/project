package project.FleaMarket.P001.D002.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;
import project.FleaMarket.P001.D002.vo.F_P001_D002VO;

public interface F_P001_D002DAO {
	 public List<F_P001_D002VO> searchList(Map<String, Object> searchMap) throws DataAccessException;
	 public List<F_P001_D002VO> searchMod(Map<String, Object> searchMap) throws DataAccessException;
	 public List<F_P001_D002VO> searchAdd() throws DataAccessException;
	 public List<F_P001_D002VO> recruit_yn() throws DataAccessException;
	 public String likeFlea(Map<String, Object> searchMap) throws DataAccessException;
	 public String marketCnt(Map<String, Object> searchMap) throws DataAccessException;
     public String recruitCnt(Map<String, Object> searchMap) throws DataAccessException;
	
	 public void updateRecruit(Map<String, Object> datahMap) throws DataAccessException;
	 public void updateMember(Map<String, Object> datahMap) throws DataAccessException;
	 public void insertMember(Map<String, Object> datahMap) throws DataAccessException;
	 public void deleteMember(Map<String, Object> datahMap) throws DataAccessException;
	 public String heart(Map<String, Object> searchMap) throws DataAccessException;
	 public void insertLikeFlea(Map<String, Object> datahMap) throws DataAccessException;
	 public void deleteLikeFlea(Map<String, Object> datahMap) throws DataAccessException;
	 public void updateHeart(Map<String, Object> datahMap) throws DataAccessException;	 
}
