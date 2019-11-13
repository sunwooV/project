package project.Sell.P001.D003.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.Sell.P001.D003.vo.S_P001_D003VO;

@Repository("S_P001_D003DAO")
public class S_P001_D003DAOImpl implements S_P001_D003DAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insertQnA(Map<String, Object> datahMap) throws DataAccessException {
		sqlSession.update("Sell.p001_d003.insertQnA", datahMap);
	}
	
	@Override
	public void insertAnswer(Map<String, Object> datahMap) throws DataAccessException {
		sqlSession.update("Sell.p001_d003.insertAnswer", datahMap);
	}
	
	@Override
	public List<S_P001_D003VO> selectQnA(Map<String, Object> searchMap) throws DataAccessException {
		List<S_P001_D003VO> list = sqlSession.selectList("Sell.p001_d003.selectQnA", searchMap);
		return list;
	}
	
	@Override
	public List<S_P001_D003VO> selectAnswer(Map<String, Object> searchMap) throws DataAccessException {
		List<S_P001_D003VO> list = sqlSession.selectList("Sell.p001_d003.selectAnswer", searchMap);
		return list;
	}
}
