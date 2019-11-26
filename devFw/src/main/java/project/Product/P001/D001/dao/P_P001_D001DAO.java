package project.Product.P001.D001.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.Product.P001.D001.vo.P_P001_D001VO;

public interface P_P001_D001DAO {
	public List<P_P001_D001VO> searchProduct(Map<String, Object> searchMap) throws DataAccessException;
	public List<P_P001_D001VO> searchHighCategory(Map<String, Object> searchMap) throws DataAccessException;
	public List<P_P001_D001VO> searchMiddleCategory(Map<String, Object> searchMap) throws DataAccessException;
}
