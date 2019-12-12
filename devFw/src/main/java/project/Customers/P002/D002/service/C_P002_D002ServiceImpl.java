package project.Customers.P002.D002.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import project.Customers.P002.D002.vo.C_P002_D002VO;
import project.Customers.P002.D002.dao.C_P002_D002DAO;

@Service("C_P002_D002Service")
@Transactional(propagation = Propagation.REQUIRED)
public class C_P002_D002ServiceImpl implements C_P002_D002Service{
	@Autowired
	C_P002_D002DAO C_P002_D002DAO;
	
	@Override
	public List<C_P002_D002VO> myBidList(Map<String, Object> searchMap) throws DataAccessException {
		List<C_P002_D002VO> myBidList =  C_P002_D002DAO.myBidList(searchMap); 
		return myBidList;
	}

//	@Override
//	public String progressChk(Map<String, Object> searchMap) throws DataAccessException {
//		String progressChk =  C_P002_D002DAO.progressChk(searchMap); 
//		return progressChk;
//	}

}
