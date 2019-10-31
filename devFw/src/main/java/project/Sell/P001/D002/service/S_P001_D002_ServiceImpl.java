package project.Sell.P001.D002.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import project.Sell.P001.D002.dao.S_P001_D002_DAO;
import project.Sell.P001.D002.vo.S_P001_D002_VO;

@Service("S_P001_D002_Service")
@Transactional(propagation = Propagation.REQUIRED)
public class S_P001_D002_ServiceImpl implements S_P001_D002_Service {
	@Autowired
	private S_P001_D002_DAO S_P001_D002_DAO;
	
	@Override
	public List<S_P001_D002_VO> detailProduct(Map<String, Object> searchMap) throws DataAccessException {
		List<S_P001_D002_VO> list =  S_P001_D002_DAO.detailProduct(searchMap); 
		return list;
	}
}
