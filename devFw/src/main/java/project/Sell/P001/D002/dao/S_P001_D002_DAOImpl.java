package project.Sell.P001.D002.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.Sell.P001.D001.vo.S_P001_D001_VO;
import project.Sell.P001.D002.vo.S_P001_D002_VO;

@Repository("S_P001_D002_DAO")
public class S_P001_D002_DAOImpl implements S_P001_D002_DAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<S_P001_D002_VO> detailProduct(Map<String, Object> searchMap) throws DataAccessException {
		List<S_P001_D002_VO> list = sqlSession.selectList("Sell.detail.detailProduct", searchMap);
		System.out.println("dao¿¡¼­ list \n " + list);
		return list;
	}
	
	@Override
	public List<S_P001_D001_VO> high_category(Map<String, Object> searchMap2) throws DataAccessException {
		List<S_P001_D001_VO> high_category = sqlSession.selectList("Sell.detail.high_category", searchMap2);
		return high_category;
	}

	@Override
	public List<S_P001_D001_VO> middle_category(Map<String, Object> searchMap2) throws DataAccessException {
		List<S_P001_D001_VO> middle_category = sqlSession.selectList("Sell.detail.middle_category", searchMap2);
		return middle_category;
	}
}
