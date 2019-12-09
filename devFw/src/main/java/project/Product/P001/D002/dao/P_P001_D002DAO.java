package project.Product.P001.D002.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.Product.P001.D002.vo.P_P001_D002VO;

public interface P_P001_D002DAO {
	public List<P_P001_D002VO> searchProduct(Map<String, Object> searchMap) throws DataAccessException;
	public List<P_P001_D002VO> searchHighCategory(Map<String, Object> searchMap) throws DataAccessException;
	public List<P_P001_D002VO> searchMiddleCategory(Map<String, Object> searchMap) throws DataAccessException;
}
