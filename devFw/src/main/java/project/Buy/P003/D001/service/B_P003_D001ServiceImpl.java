package project.Buy.P003.D001.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import project.Buy.P003.D001.dao.B_P003_D001DAO;




@Service("B_P003_D001Service")
@Transactional(propagation = Propagation.REQUIRED)
public class B_P003_D001ServiceImpl implements B_P003_D001Service{
	@Autowired
	private B_P003_D001DAO b_p003_d001DAO;

	//쓴 리뷰 내용 DB insert
	@Override
	public void insertChangeReason(Map<String, Object> searchMap) throws DataAccessException {
		b_p003_d001DAO.insertChangeReason(searchMap);
	
	}

	
}
