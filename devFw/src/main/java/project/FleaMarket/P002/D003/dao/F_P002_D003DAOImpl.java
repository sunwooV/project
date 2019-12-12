package project.FleaMarket.P002.D003.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.FleaMarket.P002.D003.vo.F_P002_D003VO;
import project.Sell.P001.D003.vo.S_P001_D003VO;


@Repository("F_P002_D003DAO")
public class F_P002_D003DAOImpl implements F_P002_D003DAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<F_P002_D003VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<F_P002_D003VO> list = sqlSession.selectList("FleaMarket.p002_d003.searchList", searchMap);
		for(int i = 0; i < list.size(); i++)
		{
			System.out.println(list.get(i));
		}
		return list;
	}
	
	@Override
	public List<F_P002_D003VO> storyList(Map<String, Object> searchMap) throws DataAccessException {
		List<F_P002_D003VO> list = sqlSession.selectList("FleaMarket.p002_d003.storyList", searchMap);
		for(int i = 0; i < list.size(); i++)
		{
			System.out.println(list.get(i));
		}
		return list;
	}
	
	@Override
	public void insertStoryComment(Map<String, Object> datahMap) throws DataAccessException {
		sqlSession.update("FleaMarket.p002_d003.insertStoryComment", datahMap);
	}
	
	
	@Override
	public List<F_P002_D003VO> searchMod(Map<String, Object> searchMap) throws DataAccessException {
		List<F_P002_D003VO> list = sqlSession.selectList("hm.F_P002_D003.searchMod", searchMap);
		return list;
	}

	@Override
	public List<F_P002_D003VO> searchAdd() throws DataAccessException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<F_P002_D003VO> selectStory(Map<String, Object> searchMap) throws DataAccessException {
		List<F_P002_D003VO> list = sqlSession.selectList("FleaMarket.p002_d003.selectStory", searchMap);
		System.out.println(":::요기가 F_P002_D003DAO 확인::::");
		return list;
	}
	
	@Override
	public String storySize(Map<String, Object> searchMap) throws DataAccessException {
		String list = sqlSession.selectOne("FleaMarket.p002_d003.storySize", searchMap);
		return list;
	}
	
	@Override
	public void updateMember(Map<String, Object> datahMap) throws DataAccessException {
		sqlSession.update("hm.F_P002_D003.updateMember", datahMap);
	}

	@Override
	public void insertMember(Map<String, Object> datahMap) throws DataAccessException {
		sqlSession.update("hm.F_P002_D003.insertMember", datahMap);
	}

	@Override
	public void deleteMember(Map<String, Object> datahMap) throws DataAccessException {
		sqlSession.update("hm.F_P002_D003.deleteMember", datahMap);
	}

}
