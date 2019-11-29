package project.Sell.P001.D002.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import project.Sell.P001.D001.dao.S_P001_D001DAO;
import project.Sell.P001.D001.vo.S_P001_D001VO;
import project.Sell.P001.D002.dao.S_P001_D002DAO;
import project.Sell.P001.D002.vo.S_P001_D002VO;

@Service("S_P001_D002Service")
@Transactional(propagation = Propagation.REQUIRED)
public class S_P001_D002ServiceImpl implements S_P001_D002Service {
	@Autowired
	private S_P001_D002DAO S_P001_D002DAO;

	@Override
	public List<S_P001_D001VO> high_category(Map<String, Object> searchMap2) throws DataAccessException {
		List<S_P001_D001VO> high_category =  S_P001_D002DAO.high_category(searchMap2); 
		return high_category;
	}
	
	@Override
	public List<S_P001_D001VO> middle_category(Map<String, Object> searchMap2) throws DataAccessException {
		List<S_P001_D001VO> middle_category =  S_P001_D002DAO.middle_category(searchMap2); 
		return middle_category;
	}
	
	@Override
	public List<S_P001_D002VO> detailProduct(Map<String, Object> searchMap) throws DataAccessException {
		List<S_P001_D002VO> list =  S_P001_D002DAO.detailProduct(searchMap); 
		return list;
	}
	
	@Override
	public List<S_P001_D002VO> auction_left_date(Map<String, Object> searchMap) throws DataAccessException {
		List<S_P001_D002VO> list =  S_P001_D002DAO.auction_left_date(searchMap); 
		return list;
	}

	@Override
	public List<S_P001_D002VO> tagList(Map<String, Object> searchMap) throws DataAccessException {
		List<S_P001_D002VO> list =  S_P001_D002DAO.tagList(searchMap); 
		return list;
	}
	
	@Override
	public String likeProd(Map<String, Object> searchMap) throws DataAccessException {
		String likeProd =  S_P001_D002DAO.likeProd(searchMap); 
		return likeProd;
	}
	
	@Override
	public String heart(Map<String, Object> searchMap) throws DataAccessException {
		String heart =  S_P001_D002DAO.heart(searchMap); 
		return heart;
	}
	
	@Override
	public void insertLikeProd(Map<String, Object> datahMap) throws Exception {
		S_P001_D002DAO.insertLikeProd(datahMap);
	}
	
	@Override
	public void deleteLikeProd(Map<String, Object> datahMap) throws Exception {
		S_P001_D002DAO.deleteLikeProd(datahMap);
	}
	
	@Override
	public void updateHeart(Map<String, Object> datahMap) throws Exception {
		System.out.println("updateHeart 해써용");
		S_P001_D002DAO.updateHeart(datahMap);
	}

}
