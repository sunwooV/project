package project.Main.P001.D002.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.Main.P001.D002.vo.M_P001_D002VO;

@Repository("M_P001_D002DAO")
public class M_P001_D002DAOImpl implements M_P001_D002DAO {
	@Autowired
	private SqlSession sqlSession;

	
	@Override
	public List<M_P001_D002VO> reusedList(Map<String, Object> searchMap) throws DataAccessException {
		List<M_P001_D002VO> reusedList = sqlSession.selectList("Main.p001_d002.reusedList", searchMap);
		return reusedList;
	}
	
	@Override
	public List<M_P001_D002VO> auctionList(Map<String, Object> searchMap) throws DataAccessException {
		List<M_P001_D002VO> auctionList = sqlSession.selectList("Main.p001_d002.auctionList", searchMap);
		return auctionList;
	}
}
