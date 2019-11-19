package project.Sell.P001.D007.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import project.Sell.P001.D007.vo.S_P001_D007VO;
import project.Sell.P001.D007.dao.S_P001_D007DAO;

@Service("S_P001_D007Service")
public class S_P001_D007ServiceImpl implements S_P001_D007Service {
	@Autowired
	private S_P001_D007DAO S_P001_D007DAO;
	
	@Override
	public List<S_P001_D007VO> selectBidRecord(Map<String, Object> searchMap) throws DataAccessException {
		List<S_P001_D007VO> bidRecord =  S_P001_D007DAO.selectBidRecord(searchMap); 
		return bidRecord;
	}
}
