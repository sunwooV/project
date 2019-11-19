package project.Buy.P002.D003.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import project.Buy.P002.D003.vo.B_P002_D003VO;

@Service("B_P002_D003Service")
@Transactional(propagation = Propagation.REQUIRED)
public class B_P002_D003ServiceImpl implements B_P002_D003Service{


	@Override
	public List<B_P002_D003VO> selectCart(Map<String, Object> searchMap) throws DataAccessException {
		// TODO Auto-generated method stub
		return null;
	}

	
}
