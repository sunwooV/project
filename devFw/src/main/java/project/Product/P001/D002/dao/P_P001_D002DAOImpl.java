package project.Product.P001.D002.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.Product.P001.D002.vo.P_P001_D002VO;

@Repository("P_P001_D002DAO")
public class P_P001_D002DAOImpl implements P_P001_D002DAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<P_P001_D002VO> searchProduct(Map<String, Object> searchMap) throws DataAccessException {
		List<P_P001_D002VO> list = sqlSession.selectList("Product.p001_d002.searchProduct", searchMap);
		return list;
	}
	
	@Override
	public List<P_P001_D002VO> searchHighCategory(Map<String, Object> searchMap) throws DataAccessException {
		List<P_P001_D002VO> list = sqlSession.selectList("Product.p001_d002.searchHighCategory", searchMap);
		return list;
	}
	
	@Override
	public List<P_P001_D002VO> searchMiddleCategory(Map<String, Object> searchMap) throws DataAccessException {
		List<P_P001_D002VO> list = sqlSession.selectList("Product.p001_d002.searchMiddleCategory", searchMap);
		return list;
	}
}
