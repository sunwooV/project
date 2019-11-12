package project.Sell.P001.D003.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import project.Sell.P001.D003.vo.S_P001_D003VO;
import project.Sell.P001.D003.dao.S_P001_D003DAO;

@Service("S_P001_D003Service")
@Transactional(propagation = Propagation.REQUIRED)
public class S_P001_D003ServiceImpl implements S_P001_D003Service {
	@Autowired
	private S_P001_D003DAO S_P001_D003DAO;
	
	@Override
	public void insertQnA(Map<String, Object> datahMap) throws Exception {
		S_P001_D003DAO.insertQnA(datahMap);
	}
	
	
	@Override
	public List<S_P001_D003VO> selectQnA(Map<String, Object> searchMap) throws DataAccessException {
		List<S_P001_D003VO> list =  S_P001_D003DAO.selectQnA(searchMap); 
		return list;
	}
}
