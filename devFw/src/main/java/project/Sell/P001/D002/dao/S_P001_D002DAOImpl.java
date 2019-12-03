package project.Sell.P001.D002.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.Sell.P001.D001.vo.S_P001_D001VO;
import project.Sell.P001.D002.vo.S_P001_D002VO;

@Repository("S_P001_D002DAO")
public class S_P001_D002DAOImpl implements S_P001_D002DAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<S_P001_D001VO> high_category(Map<String, Object> searchMap2) throws DataAccessException {
		List<S_P001_D001VO> high_category = sqlSession.selectList("Sell.p001_d002.high_category", searchMap2);
		return high_category;
	}

	@Override
	public List<S_P001_D001VO> middle_category(Map<String, Object> searchMap2) throws DataAccessException {
		List<S_P001_D001VO> middle_category = sqlSession.selectList("Sell.p001_d002.middle_category", searchMap2);
		return middle_category;
	}
	
	@Override
	public List<S_P001_D002VO> detailProduct(Map<String, Object> searchMap) throws DataAccessException {
		List<S_P001_D002VO> list = sqlSession.selectList("Sell.p001_d002.detailProduct", searchMap);
		System.out.println("dao list \n " + list);
		return list;
	}
	
	@Override
	public List<S_P001_D002VO> auction_left_date(Map<String, Object> searchMap) throws DataAccessException {
		List<S_P001_D002VO> auction_date = sqlSession.selectList("Sell.p001_d002.auction_left_date", searchMap);
		return auction_date;
	}

	
	@Override
	public List<S_P001_D002VO> tagList(Map<String, Object> searchMap) throws DataAccessException {
		List<S_P001_D002VO> tagList = sqlSession.selectList("Sell.p001_d002.tagList", searchMap);
		return tagList;
	}
	
	@Override
	public String likeProd(Map<String, Object> searchMap) throws DataAccessException {
		String likeProd = sqlSession.selectOne("Sell.p001_d002.likeProd", searchMap);
		return likeProd;
	}
	
	@Override
	public String heart(Map<String, Object> searchMap) throws DataAccessException {
		String heart = sqlSession.selectOne("Sell.p001_d002.heart", searchMap);
		return heart;
	}
	
	@Override
	public String fleaName(Map<String, Object> searchMap) throws DataAccessException {
		String fleaName = sqlSession.selectOne("Sell.p001_d002.fleaName", searchMap);
		System.out.println("fleaName이다~!~!~!~!~!" + fleaName);
		return fleaName;
	}
	
	@Override
	public void insertLikeProd(Map<String, Object> datahMap) throws DataAccessException {
		sqlSession.update("Sell.p001_d002.insertLikeProd", datahMap);
	}
	
	@Override
	public void deleteLikeProd(Map<String, Object> datahMap) throws DataAccessException {
		sqlSession.update("Sell.p001_d002.deleteLikeProd", datahMap);
	}
	
	@Override
	public void updateHeart(Map<String, Object> datahMap) throws DataAccessException {
		sqlSession.update("Sell.p001_d002.updateHeart", datahMap);
	}
	
}
