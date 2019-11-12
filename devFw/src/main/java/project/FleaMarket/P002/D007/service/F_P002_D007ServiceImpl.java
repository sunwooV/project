package project.FleaMarket.P002.D007.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import project.FleaMarket.P002.D007.dao.F_P002_D007DAO;
import project.FleaMarket.P002.D007.vo.F_P002_D007VO;

@Service("F_P002_D007Service")
@Transactional(propagation = Propagation.REQUIRED)
public class F_P002_D007ServiceImpl implements F_P002_D007Service {
	@Autowired
	private F_P002_D007DAO d007DAO;

	@Override
	public List<F_P002_D007VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<F_P002_D007VO> list =  d007DAO.searchList(searchMap); 
		return list;
	}

	@Override
	public List<F_P002_D007VO> searchMod(Map<String, Object> searchMap) throws DataAccessException {
		List<F_P002_D007VO> list =  d007DAO.searchMod(searchMap);
		return list;
	}

	@Override
	public List<F_P002_D007VO> searchAdd() throws DataAccessException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateMember(Map<String, Object> datahMap) throws Exception {
		d007DAO.updateMember(datahMap);
	}

	@Override
	public void insertMember(Map<String, Object> datahMap) throws Exception {
		d007DAO.insertMember(datahMap);
	}

	@Override
	public void deleteMember(Map<String, Object> datahMap) throws Exception {
		d007DAO.deleteMember(datahMap);
	}

}
