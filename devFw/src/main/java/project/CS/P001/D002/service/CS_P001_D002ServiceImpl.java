package project.CS.P001.D002.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import project.CS.P001.D001.dao.CS_P001_D001DAO;
import project.CS.P001.D001.vo.CS_P001_D001VO;
import project.CS.P001.D001.vo.PagingVO;
import project.CS.P001.D002.dao.CS_P001_D002DAO;

@Service("CS_P001_D002Service")
@Transactional(propagation = Propagation.REQUIRED)
public class CS_P001_D002ServiceImpl implements CS_P001_D002Service {
	@Autowired
	private CS_P001_D002DAO cs_p001_d002DAO;

	@Override
	public List listRefu() {
		List refuList = null;
		refuList = cs_p001_d002DAO.detailAllrefuList();
		return refuList;
	}

	@Override
	public List<Map<String, Object>> detailAllrefuList(Map<String, Object> dataMap) throws DataAccessException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List listFaq() {
		List faqList = null;
		faqList = cs_p001_d002DAO.detailAllfaqList();
		return faqList;
	}

	@Override
	public List<Map<String, Object>> detailAllfaqList(Map<String, Object> dataMap) throws DataAccessException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List listDeliv() {
		List delivList = null;
		delivList = cs_p001_d002DAO.detailAlldelivList();
		return delivList;
	}

	@Override
	public List<Map<String, Object>> detailAlldelivList(Map<String, Object> dataMap) throws DataAccessException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List listCoupon() {
		List couponList= cs_p001_d002DAO.detailAllcouponList();
		return couponList;
	}

	@Override
	public List<Map<String, Object>> detailAllcouponList(Map<String, Object> dataMap) throws DataAccessException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List listPay() {
		List safeList = null;
		safeList = cs_p001_d002DAO.detailAllpayList();
		return safeList;
	}

	@Override
	public List<Map<String, Object>> detailAllpayList(Map<String, Object> dataMap) throws DataAccessException {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
	
	
	
	

}
