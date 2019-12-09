package project.Main.P001.D002.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import project.Main.P001.D001.vo.M_P001_D001VO;
import project.Main.P001.D002.dao.M_P001_D002DAO;
import project.Main.P001.D002.vo.M_P001_D002VO;
import project.Sell.P001.D001.dao.S_P001_D001DAO;
import project.Sell.P001.D001.vo.S_P001_D001VO;
import project.Customers.P002.D001.dao.C_P002_D001DAO;
import project.Customers.P002.D001.service.C_P002_D001Service;
import project.Main.P001.D001.dao.M_P001_D001DAO;

@Service("M_P001_D002Service")
@Transactional(propagation = Propagation.REQUIRED)
public class M_P001_D002ServiceImpl implements M_P001_D002Service{
	@Autowired
	private M_P001_D002DAO M_P001_D002DAO;

	
	@Override
	public List<M_P001_D002VO> reusedList(Map<String, Object> searchMap) throws DataAccessException {
		List<M_P001_D002VO> reusedList =  M_P001_D002DAO.reusedList(searchMap); 
		return reusedList;
	}
	
	@Override
	public List<M_P001_D002VO> auctionList(Map<String, Object> searchMap) throws DataAccessException {
		List<M_P001_D002VO> auctionList =  M_P001_D002DAO.auctionList(searchMap); 
		return auctionList;
	}
}