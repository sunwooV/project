package project.FleaMarket.P002.D002.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import project.FleaMarket.P002.D002.dao.F_P002_D002DAO;
import project.FleaMarket.P002.D002.vo.F_P002_D002VO;

@Service("F_P002_D002Service")
@Transactional(propagation = Propagation.REQUIRED)
public class F_P002_D002ServiceImpl implements F_P002_D002Service {
	@Autowired
	private F_P002_D002DAO d002DAO;

	@Override
	public List<F_P002_D002VO> reviewList(Map<String, Object> searchMap) throws DataAccessException {
		List<F_P002_D002VO> list =  d002DAO.reviewList(searchMap); 
		System.out.println("reviewList Service 확인!!!");
		return list;
	}

	@Override
	public List<F_P002_D002VO> searchMod(Map<String, Object> searchMap) throws DataAccessException {
		List<F_P002_D002VO> list =  d002DAO.searchMod(searchMap);
		return list;
	}

	@Override
	public List<F_P002_D002VO> searchAdd() throws DataAccessException {
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

}
