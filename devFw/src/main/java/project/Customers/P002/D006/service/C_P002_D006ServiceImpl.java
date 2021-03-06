package project.Customers.P002.D006.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import project.CS.P001.D001.dao.CS_P001_D001DAO;
import project.Customers.P002.D006.dao.C_P002_D006DAO;

@Service("C_P002_D006Service")
@Transactional(propagation = Propagation.REQUIRED)
public class C_P002_D006ServiceImpl implements C_P002_D006Service {
	@Autowired
	private C_P002_D006DAO c_p002_d006DAO;

	@Override
	public List listQna(Map<String, Object> searchMap) {
		List qnaList = null;
		qnaList = c_p002_d006DAO.selectAllqnaList(searchMap);
		return qnaList;
	}
	
	@Override
	public List<Map<String, Object>> selectAllqnaList(Map<String, Object> dataMap) throws DataAccessException {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public void deleteQna(Map<String, Object> datahMap) throws Exception {
		c_p002_d006DAO.deleteQna(datahMap);
	}
	
	@Override
	public String qnaSize(Map<String, Object> searchMap) {
		String qnaSize = c_p002_d006DAO.qnaSize(searchMap);
		return qnaSize;
	}
	
}
