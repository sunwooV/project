package project.Sell.P001.D008.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.Customers.P001.D001.vo.C_P001_D001VO;
import project.Sell.P001.D008.vo.S_P001_D008VO;

@Repository("S_P001_D008DAO")
public class S_P001_D008DAOImpl implements S_P001_D008DAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<S_P001_D008VO> auction_date_check() throws DataAccessException {
		List<S_P001_D008VO> auction_date = sqlSession.selectList("Sell.p001_d008.auction_date_check");
		return auction_date;
	}
	@Override
	public void failAuction(Map<String, Object> datahMap) throws DataAccessException {
		sqlSession.update("Sell.p001_d008.failAuction", datahMap);
	}
	@Override
	public void winAuction(Map<String, Object> datahMap) throws DataAccessException {
		sqlSession.update("Sell.p001_d008.winAuction", datahMap);
	}
	@Override
	public String winAuctionMember(Map<String, Object> datahMap) throws DataAccessException {
		String memberId = sqlSession.selectOne("Sell.p001_d008.winAuctionMember", datahMap);
		return memberId;
	}
	@Override
	public String memberEmail(Map<String, Object> datahMap) throws DataAccessException {
		String member = sqlSession.selectOne("Sell.p001_d008.memberEmail", datahMap);
		return member;
	}
	@Override
	public String prodTitle(Map<String, Object> datahMap) throws DataAccessException {
		String prodTitle = sqlSession.selectOne("Sell.p001_d008.prodTitle", datahMap);
		return prodTitle;
	}
}
