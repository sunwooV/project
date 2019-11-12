package project.FleaMarket.P002.D007.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.FleaMarket.P002.D007.vo.F_P002_D007VO;

@Repository("F_P002_D007DAO")
public class F_P002_D007DAOImpl implements F_P002_D007DAO {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<F_P002_D007VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<F_P002_D007VO> list = sqlSession.selectList("FleaMarket.p002_d007.searchList",searchMap);
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
