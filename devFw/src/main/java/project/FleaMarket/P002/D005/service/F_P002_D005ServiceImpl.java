package project.FleaMarket.P002.D005.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import project.FleaMarket.P002.D005.dao.F_P002_D005DAO;
import project.FleaMarket.P002.D005.vo.F_P002_D005VO;

@Service("F_P002_D005Service")
@Transactional(propagation = Propagation.REQUIRED)
public class F_P002_D005ServiceImpl implements F_P002_D005Service {
	@Autowired
	private F_P002_D005DAO d005DAO;

	@Override
	public List<F_P002_D005VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<F_P002_D005VO> list =  d005DAO.searchList(searchMap); 
		return list;
	}

	@Override
	public List<F_P002_D005VO> searchMod(Map<String, Object> searchMap) throws DataAccessException {
		List<F_P002_D005VO> list =  d005DAO.searchMod(searchMap);
		return list;
	}

	@Override
	public List<F_P002_D005VO> searchAdd() throws DataAccessException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateMember(Map<String, Object> datahMap) throws Exception {
		d005DAO.updateMember(datahMap);
	}

	@Override
	public void insertMember(Map<String, Object> datahMap) throws Exception {
		d005DAO.insertMember(datahMap);
	}

	@Override
	public void deleteMember(Map<String, Object> datahMap) throws Exception {
		d005DAO.deleteMember(datahMap);
	}

}
