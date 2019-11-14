package project.Sell.P001.D005.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Repository("S_P001_D005DAO")
public class S_P001_D005DAOImpl implements S_P001_D005DAO{
	@Autowired
	private SqlSession sqlSession;
	
	
	@Override
	public void updateProduct(Map<String, Object> datahMap) throws DataAccessException {
		sqlSession.update("Sell.p001_d005.updateProduct", datahMap);
	}

	@Override
	public void updateTag(Map<String, Object> datahMap) throws DataAccessException {
		sqlSession.update("Sell.p001_d005.updateTag", datahMap);
	}
}
