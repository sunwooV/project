package project.FleaMarket.P002.D003.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import project.FleaMarket.P002.D003.dao.F_P002_D003DAO;
import project.FleaMarket.P002.D003.vo.F_P002_D003VO;
import project.Sell.P001.D003.vo.S_P001_D003VO;

@Service("F_P002_D003Service")
@Transactional(propagation = Propagation.REQUIRED)
public class F_P002_D003ServiceImpl implements F_P002_D003Service {
	@Autowired
	private F_P002_D003DAO d003DAO;

	@Override
	public List<F_P002_D003VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<F_P002_D003VO> list =  d003DAO.searchList(searchMap); 
		return list;
	}

	@Override
	public List<F_P002_D003VO> storyList(Map<String, Object> searchMap) throws DataAccessException {
		List<F_P002_D003VO> list =  d003DAO.storyList(searchMap); 
		return list;
	}

	@Override
	public void inserStoryComment(Map<String, Object> datahMap) throws Exception {
		d003DAO.insertStoryComment(datahMap);
	}
	
	@Override
	public List<F_P002_D003VO> selectStory(Map<String, Object> searchMap) throws DataAccessException {
		List<F_P002_D003VO> list =  d003DAO.selectStory(searchMap); 
		System.out.println(":::요기가 F_P002_D003Service::::");
		return list;
	}
	
	@Override
	public List<F_P002_D003VO> searchMod(Map<String, Object> searchMap) throws DataAccessException {
		List<F_P002_D003VO> list =  d003DAO.searchMod(searchMap);
		return list;
	}

	@Override
	public List<F_P002_D003VO> searchAdd() throws DataAccessException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateMember(Map<String, Object> datahMap) throws Exception {
		d003DAO.updateMember(datahMap);
	}

	@Override
	public void insertMember(Map<String, Object> datahMap) throws Exception {
		d003DAO.insertMember(datahMap);
	}

	@Override
	public void deleteMember(Map<String, Object> datahMap) throws Exception {
		d003DAO.deleteMember(datahMap);
	}

}
