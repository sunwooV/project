package project.Sell.P001.D007.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.Sell.P001.D007.vo.S_P001_D007VO;

@Repository("S_P001_D007DAO")
public class S_P001_D007FDAOImpl implements S_P001_D007DAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<S_P001_D007VO> selectBidRecord(Map<String, Object> searchMap) throws DataAccessException {
		List<S_P001_D007VO> bidRecord = sqlSession.selectList("Sell.p001_d007.bidRecord", searchMap);
		return bidRecord;
	}
}
