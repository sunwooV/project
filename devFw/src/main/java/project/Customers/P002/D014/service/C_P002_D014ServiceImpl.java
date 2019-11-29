package project.Customers.P002.D014.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import project.Customers.P002.D014.vo.C_P002_D014VO;
import project.Customers.P002.D014.dao.C_P002_D014DAO;

@Service("C_P002_D014Service")
@Transactional(propagation = Propagation.REQUIRED)
public class C_P002_D014ServiceImpl implements C_P002_D014Service {
	@Autowired
	private C_P002_D014DAO C_P002_D014DAO;

	@Override
	public List<C_P002_D014VO> myLikeProd(Map<String, Object> searchMap) throws DataAccessException {
		List<C_P002_D014VO> list =  C_P002_D014DAO.myLikeProd(searchMap); 
		return list;
	}

}
