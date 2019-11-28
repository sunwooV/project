package project.Customers.P002.D014.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.Customers.P002.D014.vo.C_P002_D014VO;

@Repository("C_P002_D014DAO")
public class C_P002_D014DAOImpl implements C_P002_D014DAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<C_P002_D014VO> myLikeProd(Map<String, Object> searchMap) throws DataAccessException {
		List<C_P002_D014VO> list = sqlSession.selectList("Customers.p002_d014.myLikeProd", searchMap);
		return list;
	}
}
