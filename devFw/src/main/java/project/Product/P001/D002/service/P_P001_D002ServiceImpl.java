package project.Product.P001.D002.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import project.Product.P001.D002.dao.P_P001_D002DAO;
import project.Product.P001.D002.vo.P_P001_D002VO;

@Service("P_P001_D002Service")
@Transactional(propagation = Propagation.REQUIRED)
public class P_P001_D002ServiceImpl implements P_P001_D002Service {
	@Autowired
	private P_P001_D002DAO P_P001_D002DAO;
	
	@Override
	public List<P_P001_D002VO> searchProduct(Map<String, Object> searchMap) throws DataAccessException {
		List<P_P001_D002VO> list =  P_P001_D002DAO.searchProduct(searchMap); 
		return list;
	}
	
	@Override
	public List<P_P001_D002VO> searchHighCategory(Map<String, Object> searchMap) throws DataAccessException {
		List<P_P001_D002VO> list =  P_P001_D002DAO.searchHighCategory(searchMap); 
		return list;
	}
	
	@Override
	public List<P_P001_D002VO> searchMiddleCategory(Map<String, Object> searchMap) throws DataAccessException {
		List<P_P001_D002VO> list =  P_P001_D002DAO.searchMiddleCategory(searchMap); 
		return list;
	}
}
