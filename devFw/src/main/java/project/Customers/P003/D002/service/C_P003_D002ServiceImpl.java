package project.Customers.P003.D002.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import project.Customers.P003.D002.dao.C_P003_D002DAO;
import project.Customers.P003.D002.vo.C_P003_D002VO;
import project.Sell.P001.D001.vo.S_P001_D001VO;

@Service("C_P003_D002Service")
@Transactional(propagation = Propagation.REQUIRED)
public class C_P003_D002ServiceImpl implements C_P003_D002Service {
	@Autowired
	private C_P003_D002DAO C_P003_D002DAO;

	@Override
	public List<C_P003_D002VO> miuCategory(Map<String, Object> searchMap) throws DataAccessException {
		List<C_P003_D002VO> miuCategory =  C_P003_D002DAO.miuCategory(searchMap); 
		return miuCategory;
	}

	@Override
	public List<C_P003_D002VO> sellerProduct(Map<String, Object> searchMap) throws DataAccessException {
		List<C_P003_D002VO> sellerProduct =  C_P003_D002DAO.sellerProduct(searchMap); 
		return sellerProduct;
	}

}
