package project.Buy.P002.D002.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import project.Buy.P002.D002.dao.B_P002_D002DAO;
import project.Buy.P002.D002.vo.B_P002_D002VO;

@Service("B_P002_D002Service")
@Transactional(propagation = Propagation.REQUIRED)
public class B_P002_D002ServiceImpl implements B_P002_D002Service{
	@Autowired
	private B_P002_D002DAO b_p002_d003DAO;

	@Override
	public List<B_P002_D002VO> selectCart(Map<String, Object> searchMap) throws DataAccessException {
		// TODO Auto-generated method stub
		return null;
	}

	
}
