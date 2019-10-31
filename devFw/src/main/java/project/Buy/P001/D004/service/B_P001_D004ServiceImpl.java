package project.Buy.P001.D004.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import project.Buy.P001.D004.dao.B_P001_D004DAO;
import project.Buy.P001.D004.vo.B_P001_D004VO;



@Service("B_P001_D004Service")
@Transactional(propagation = Propagation.REQUIRED)
public class B_P001_D004ServiceImpl implements B_P001_D004Service{
	@Autowired
	private B_P001_D004DAO b_p001_d004DAO;

	@Override
	public List<B_P001_D004VO> insertPaymentInfo(Map<String, Object> searchMap) throws DataAccessException {
		System.out.println("Buy P001 D004 Service ´ç");
		List<B_P001_D004VO> list = b_p001_d004DAO.insertPaymentInfo(searchMap);
		return list;
	}
}
