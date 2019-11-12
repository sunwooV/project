package project.Customers.P004.D001.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.Customers.P004.D001.vo.C_P004_D001VO;

@Repository("C_P004_D001DAO")
public class C_P004_D001DAOImpl implements C_P004_D001DAO {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<C_P004_D001VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<C_P004_D001VO> list = sqlSession.selectList("Customers.black.searchList",searchMap);
		return list;
	}


	@Override
	public void updateData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("Customers.black.updateData",row);
		
	}

	@Override
	public void deleteData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("Customers.black.deleteData",row);
	}
	
	
}
