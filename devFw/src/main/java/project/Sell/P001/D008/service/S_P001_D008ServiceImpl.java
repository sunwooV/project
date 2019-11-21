package project.Sell.P001.D008.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import project.Sell.P001.D008.dao.S_P001_D008DAO;
import project.Sell.P001.D008.vo.S_P001_D008VO;

@Service("S_P001_D008Service")
@Transactional(propagation = Propagation.REQUIRED)
public class S_P001_D008ServiceImpl implements S_P001_D008Service{
	@Autowired
	private S_P001_D008DAO S_P001_D008DAO;
	
	@Override
	public List<S_P001_D008VO> auction_date_check() throws DataAccessException {
		List<S_P001_D008VO> list =  S_P001_D008DAO.auction_date_check(); 
		return list;
	}
	
	@Override
	public void failAuction(Map<String, Object> datahMap) throws Exception {
		S_P001_D008DAO.failAuction(datahMap);
	}
	
	@Override
	public void winAuction(Map<String, Object> datahMap) throws Exception {
		S_P001_D008DAO.winAuction(datahMap);
	}
}
