package project.Customers.P003.D001.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Repository("C_P003_D001DAO")
public class C_P003_D001DAOImpl implements C_P003_D001DAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void changeSeller(Map<String, Object> datahMap) throws DataAccessException {
		sqlSession.update("Customers.p003_d001.updateSeller", datahMap);
		sqlSession.update("Customers.p003_d001.insertSellerInfo", datahMap);
		
	}
	
	@Override
	public void fleaUpdateSeller(Map<String, Object> datahMap) throws DataAccessException {
		sqlSession.update("Customers.p003_d001.fleaUpdateSeller", datahMap);
	}


}
