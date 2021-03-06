package project.FleaMarket.P002.D006.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import project.FleaMarket.P002.D006.dao.F_P002_D006DAO;
import project.FleaMarket.P002.D006.vo.F_P002_D006VO;

@Service("F_P002_D006Service")
@Transactional(propagation = Propagation.REQUIRED)
public class F_P002_D006ServiceImpl implements F_P002_D006Service {
	@Autowired
	private F_P002_D006DAO d006DAO;

	@Override
	public List<F_P002_D006VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<F_P002_D006VO> list =  d006DAO.searchList(searchMap); 
		return list;
	}

	@Override
	public List<F_P002_D006VO> searchMod(Map<String, Object> searchMap) throws DataAccessException {
		List<F_P002_D006VO> list =  d006DAO.searchMod(searchMap);
		return list;
	}

	@Override
	public List<F_P002_D006VO> searchAdd() throws DataAccessException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateMember(Map<String, Object> datahMap) throws Exception {
		d006DAO.updateMember(datahMap);
	}

	@Override
	public void insertMember(Map<String, Object> datahMap) throws Exception {
		d006DAO.insertMember(datahMap);
	}

	@Override
	public void deleteMember(Map<String, Object> datahMap) throws Exception {
		d006DAO.deleteMember(datahMap);
	}

}
