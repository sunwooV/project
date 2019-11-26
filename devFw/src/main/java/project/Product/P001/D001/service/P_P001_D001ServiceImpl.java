package project.Product.P001.D001.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import project.Product.P001.D001.dao.P_P001_D001DAO;
import project.Product.P001.D001.vo.P_P001_D001VO;

@Service("P_P001_D001Service")
@Transactional(propagation = Propagation.REQUIRED)
public class P_P001_D001ServiceImpl implements P_P001_D001Service {
	@Autowired
	private P_P001_D001DAO P_P001_D001DAO;
	
	@Override
	public List<P_P001_D001VO> searchProduct(Map<String, Object> searchMap) throws DataAccessException {
		List<P_P001_D001VO> list =  P_P001_D001DAO.searchProduct(searchMap); 
		return list;
	}
	
	@Override
	public List<P_P001_D001VO> searchHighCategory(Map<String, Object> searchMap) throws DataAccessException {
		List<P_P001_D001VO> list =  P_P001_D001DAO.searchHighCategory(searchMap); 
		return list;
	}
	
	@Override
	public List<P_P001_D001VO> searchMiddleCategory(Map<String, Object> searchMap) throws DataAccessException {
		List<P_P001_D001VO> list =  P_P001_D001DAO.searchMiddleCategory(searchMap); 
		return list;
	}
}
