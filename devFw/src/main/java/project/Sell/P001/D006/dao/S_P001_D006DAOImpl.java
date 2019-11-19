package project.Sell.P001.D006.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Repository("S_P001_D006DAO")
public class S_P001_D006DAOImpl implements S_P001_D006DAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insertBid(Map<String, Object> datahMap) throws DataAccessException {
		sqlSession.update("Sell.p001_d006.insertBid", datahMap);
	}
	
	@Override
	public void updateProduct(Map<String, Object> datahMap) throws DataAccessException {
		sqlSession.update("Sell.p001_d006.updateProduct", datahMap);
	}
}
