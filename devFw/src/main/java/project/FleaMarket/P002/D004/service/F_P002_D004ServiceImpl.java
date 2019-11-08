package project.FleaMarket.P002.D004.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import project.FleaMarket.P002.D004.dao.F_P002_D004DAO;
import project.FleaMarket.P002.D004.vo.F_P002_D004VO;

@Service("F_P002_D004Service")
@Transactional(propagation = Propagation.REQUIRED)
public class F_P002_D004ServiceImpl implements F_P002_D004Service {
	@Autowired
	private F_P002_D004DAO d004DAO;

	@Override
	public List<F_P002_D004VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<F_P002_D004VO> list =  d004DAO.searchList(searchMap); 
		return list;
	}

	@Override
	public List<F_P002_D004VO> searchMod(Map<String, Object> searchMap) throws DataAccessException {
		List<F_P002_D004VO> list =  d004DAO.searchMod(searchMap);
		return list;
	}

	@Override
	public List<F_P002_D004VO> searchAdd() throws DataAccessException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateMember(Map<String, Object> datahMap) throws Exception {
		d004DAO.updateMember(datahMap);
	}

	@Override
	public void insertMember(Map<String, Object> datahMap) throws Exception {
		d004DAO.insertMember(datahMap);
	}

	@Override
	public void deleteMember(Map<String, Object> datahMap) throws Exception {
		d004DAO.deleteMember(datahMap);
	}

}
