package project.Sell.P001.D001.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.Sell.P001.D001.vo.S_P001_D001VO;
import project.Sell.P001.D002.vo.S_P001_D002VO;
import project.hm.p0001.vo.P0001VO;
import project.hm.s0002.vo.S0002VO;


@Repository("S_P001_D001DAO")
public class S_P001_D001DAOImpl implements S_P001_D001DAO {
	@Autowired
	private SqlSession sqlSession;

	
	@Override
	public List<S_P001_D001VO> high_category(Map<String, Object> searchMap) throws DataAccessException {
		List<S_P001_D001VO> high_category = sqlSession.selectList("Sell.p001_d001.high_category", searchMap);
		return high_category;
	}

	@Override
	public List<S_P001_D001VO> middle_category(Map<String, Object> searchMap) throws DataAccessException {
		List<S_P001_D001VO> middle_category = sqlSession.selectList("Sell.p001_d001.middle_category", searchMap);
		return middle_category;
	}
	
	@Override
	public List<S_P001_D001VO> searchAdd() throws DataAccessException {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public void insertProduct(Map<String, Object> datahMap) throws DataAccessException {
		sqlSession.update("Sell.p001_d001.enrollProduct", datahMap);
	}
	
	

}
