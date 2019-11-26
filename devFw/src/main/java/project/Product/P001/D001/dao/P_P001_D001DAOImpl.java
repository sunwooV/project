package project.Product.P001.D001.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.Product.P001.D001.vo.P_P001_D001VO;

@Repository("P_P001_D001DAO")
public class P_P001_D001DAOImpl implements P_P001_D001DAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<P_P001_D001VO> searchProduct(Map<String, Object> searchMap) throws DataAccessException {
		List<P_P001_D001VO> list = sqlSession.selectList("Product.p001_d001.searchProduct", searchMap);
		return list;
	}
	
	@Override
	public List<P_P001_D001VO> searchHighCategory(Map<String, Object> searchMap) throws DataAccessException {
		List<P_P001_D001VO> list = sqlSession.selectList("Product.p001_d001.searchHighCategory", searchMap);
		return list;
	}
	
	@Override
	public List<P_P001_D001VO> searchMiddleCategory(Map<String, Object> searchMap) throws DataAccessException {
		List<P_P001_D001VO> list = sqlSession.selectList("Product.p001_d001.searchMiddleCategory", searchMap);
		return list;
	}
}
