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
		eventList = sqlSession.selectList("CS.P001.D001.selectAllEventList", vo);
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

	@Override
	public int countBoard() {
		return sqlSession.selectOne("CS.P001.D001.countBoard");
	}
	
	
}