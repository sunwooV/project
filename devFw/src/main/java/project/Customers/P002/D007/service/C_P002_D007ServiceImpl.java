package project.Customers.P002.D007.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import project.Customers.P002.D007.dao.C_P002_D007DAO;

@Service("C_P002_D007Service")
@Transactional(propagation = Propagation.REQUIRED)
public class C_P002_D007ServiceImpl implements C_P002_D007Service {
	@Autowired
	private C_P002_D007DAO c_p002_d007DAO;

	@Override
	public List listreview(String memberid) {
		List reviewList = null;
		reviewList = c_p002_d007DAO.selectAllreviewList(memberid);
		return reviewList;
	}
	
	@Override
	public List<Map<String, Object>> selectAllreviewList(Map<String, Object> dataMap) throws DataAccessException {
		// TODO Auto-generated method stub
		return null;
	}

}
