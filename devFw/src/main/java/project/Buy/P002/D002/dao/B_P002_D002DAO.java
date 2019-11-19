package project.Buy.P002.D002.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.Buy.P001.D003.vo.B_P001_D003VO;

public interface B_P002_D002DAO {
	 public List<B_P001_D003VO> selectCart(Map<String, Object> searchMap) throws DataAccessException;
//	 public List<B_P001_D003VO> searchMod(Map<String, Object> searchMap) throws DataAccessException;
//	 public List<B_P001_D003VO> searchAdd() throws DataAccessException;

}
