package project.CS.P001.D001.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.CS.P001.D001.vo.CS_P001_D001VO;
import project.CS.P001.D001.vo.PagingVO;

@Repository("CS_P001_D001DAO")
public class CS_P001_D001DAOImpl implements CS_P001_D001DAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List selectAllEventList(PagingVO vo) throws DataAccessException {
		List<CS_P001_D001VO> eventList = null;
		eventList = sqlSession.selectList("CS.P001.D001.selectAllEventList");
		System.out.println("eventList" + eventList);
		return eventList;
	}

	@Override
	public void updateCNT(Map<String, Object> dataMap) {
		sqlSession.update("CS.P001.D001.updateCnt", dataMap);
	}

	@Override
	public List selectBoardDetail(Map<String, Object> dataMap) {
		List dataList = null;
		dataList = sqlSession.selectList("CS.P001.D001.selectBoardDetail", dataMap);
		System.out.println("da0333333333333333333333333333333333" + dataList);
		return dataList;
	}

//	@Override
//	public List selectdeliveryDetail(Map<String, Object> dataMap) {
//		List dataList = null;
//		dataList = sqlSession.selectList("CS.P001.D001.selectdeliveryDetail", dataMap);
//		System.out.println("da0333333333333333333333333333333333" + dataList);
//		return dataList;
//	}

	@Override
	public int countBoard() {
		return sqlSession.selectOne("CS.P001.D001.countBoard");
	}

	@Override
	public List selectAlldeliveryList() throws DataAccessException {
		List<CS_P001_D001VO> deliveryList = null;
		deliveryList = sqlSession.selectList("CS.P001.D001.selectAlldeliveryList");/* xml 아이디값.select id 값 */
		System.out.println("deliveryList" + deliveryList);
		return deliveryList;
	}

	@Override
	public List selectAllrefundList() throws DataAccessException {
		List<CS_P001_D001VO> refundList = null;
		refundList = sqlSession.selectList("CS.P001.D001.selectAllrefundList");/* xml 아이디값.select id 값 */
		System.out.println("refundList" + refundList);
		return refundList;
	}

	@Override
	public List selectAlltopList() throws DataAccessException {
		List<CS_P001_D001VO> topList = null;
		topList = sqlSession.selectList("CS.P001.D001.selectAlltopList");/* xml 아이디값.select id 값 */
		System.out.println("topList" + topList);
		return topList;
	}

	@Override
	public List selectAllnoticeList() throws DataAccessException {
		List<CS_P001_D001VO> noticeList = null;
		noticeList = sqlSession.selectList("CS.P001.D001.selectAllnoticeList");/* xml 아이디값.select id 값 */
		System.out.println("noticeList" + noticeList);
		return noticeList;
	}
}