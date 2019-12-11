package project.CS.P001.D002.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.CS.P001.D002.vo.CS_P001_D002VO;

@Repository("CS_P001_D002DAO")
public class CS_P001_D002DAOImpl implements CS_P001_D002DAO {

	@Autowired
	private SqlSession sqlSession;



	@Override
	public List detailAllrefuList() throws DataAccessException {
		List<CS_P001_D002VO> refuList = null;
		refuList = sqlSession.selectList("CS.P001.D002.detailAllrefuList");/* xml 아이디값.select id 값 */
		System.out.println("refuList" + refuList);
		return refuList;
	}
	
	@Override
	public List detailAllfaqList() throws DataAccessException {
		List<CS_P001_D002VO> faqList = null;
		faqList = sqlSession.selectList("CS.P001.D002.detailAllfaqList");/* xml 아이디값.select id 값 */
		System.out.println("faqList" + faqList);
		return faqList;
	}
	
	@Override
	public List detailAlldelivList() throws DataAccessException {
		List<CS_P001_D002VO> delivList = null;
		delivList = sqlSession.selectList("CS.P001.D002.detailAlldelivList");/* xml 아이디값.select id 값 */
		System.out.println("delivList" + delivList);
		return delivList;
	}
	
	@Override
	public List detailAllcouponList() throws DataAccessException {
		List<CS_P001_D002VO> couponList = null;
		couponList = sqlSession.selectList("CS.P001.D002.detailAllcouponList");/* xml 아이디값.select id 값 */
		System.out.println("couponList" + couponList);
		return couponList;
	}
	
	@Override
	public List detailAllpayList() throws DataAccessException {
		List<CS_P001_D002VO> payList = null;
		payList = sqlSession.selectList("CS.P001.D002.detailAllpayList");/* xml 아이디값.select id 값 */
		System.out.println("payList" + payList);
		return payList;
	}
}