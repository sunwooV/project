package project.Sell.P001.D001.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import project.Sell.P001.D001.dao.S_P001_D001_DAO;
import project.Sell.P001.D001.vo.S_P001_D001_VO;
import project.Sell.P001.D002.vo.S_P001_D002_VO;
import project.hm.s0002.vo.S0002VO;

@Service("S_P001_D001_Service")
@Transactional(propagation = Propagation.REQUIRED)
public class S_P001_D001_ServiceImpl implements S_P001_D001_Service {
	@Autowired
	private S_P001_D001_DAO S_P001_D001_DAO;

	
	@Override
	public List<S_P001_D001_VO> high_category(Map<String, Object> searchMap) throws DataAccessException {
		List<S_P001_D001_VO> high_category =  S_P001_D001_DAO.high_category(searchMap); 
		return high_category;
	}
	
	@Override
	public List<S_P001_D001_VO> middle_category(Map<String, Object> searchMap) throws DataAccessException {
		List<S_P001_D001_VO> middle_category =  S_P001_D001_DAO.middle_category(searchMap); 
		return middle_category;
	}
	
	@Override
	public List<S_P001_D002_VO> searchAdd() throws DataAccessException {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public void insertProduct(Map<String, Object> datahMap) throws Exception {
		S_P001_D001_DAO.insertProduct(datahMap);
		
	}
	

}
