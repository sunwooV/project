package project.FleaMarket.P001.D002.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import project.FleaMarket.P001.D002.dao.F_P001_D002DAO;
import project.FleaMarket.P001.D002.vo.F_P001_D002VO;
import project.Sell.P001.D008.vo.S_P001_D008VO;

@Service("F_P001_D002Service")
@Transactional(propagation = Propagation.REQUIRED)
public class F_P001_D002ServiceImpl implements F_P001_D002Service {
	@Autowired
	private F_P001_D002DAO d002DAO;

	@Override
	public List<F_P001_D002VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<F_P001_D002VO> list =  d002DAO.searchList(searchMap); 
		return list;
	}

	@Override
	public List<F_P001_D002VO> recruit_date_check() throws DataAccessException {
		List<F_P001_D002VO> list =  d002DAO.recruit_yn(); 
		return list;
	}

	
	@Override
	public List<F_P001_D002VO> searchMod(Map<String, Object> searchMap) throws DataAccessException {
		List<F_P001_D002VO> list = d002DAO.searchMod(searchMap);
		return list;
	}

	@Override
	public List<F_P001_D002VO> searchAdd() throws DataAccessException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateMember(Map<String, Object> datahMap) throws Exception {
		d002DAO.updateMember(datahMap);
	}

	@Override
	public void insertMember(Map<String, Object> datahMap) throws Exception {
		d002DAO.insertMember(datahMap);
	}

	@Override
	public void deleteMember(Map<String, Object> datahMap) throws Exception {
		d002DAO.deleteMember(datahMap);
	}
	
	@Override
	public void updateRecruit(Map<String, Object> datahMap) throws Exception {
		d002DAO.updateRecruit(datahMap);
	}

}
