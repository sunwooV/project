package project.FleaMarket.P003.D002.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import project.FleaMarket.P003.D001.dao.F_P003_D001DAO;
import project.FleaMarket.P003.D001.vo.F_P003_D001VO;

@Service("F_P003_D001Service")
@Transactional(propagation = Propagation.REQUIRED)
public class F_P003_D002ServiceImpl implements F_P003_D002Service {
	@Autowired
	private F_P003_D001DAO d001DAO;

	@Override
	public List<F_P003_D001VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<F_P003_D001VO> list =  d001DAO.searchList(searchMap); 
		return list;
	}

	@Override
	public List<F_P003_D001VO> searchMod(Map<String, Object> searchMap) throws DataAccessException {
		List<F_P003_D001VO> list =  d001DAO.searchMod(searchMap);
		return list;
	}

	@Override
	public List<F_P003_D001VO> searchAdd() throws DataAccessException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateMember(Map<String, Object> datahMap) throws Exception {
		d001DAO.updateMember(datahMap);
	}

	@Override
	public void insertMember(Map<String, Object> datahMap) throws Exception {
		d001DAO.insertMember(datahMap);
	}

	@Override
	public void deleteMember(Map<String, Object> datahMap) throws Exception {
		d001DAO.deleteMember(datahMap);
	}

}
