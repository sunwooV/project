package project.FleaMarket.P001.D003.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.FleaMarket.P001.D003.vo.F_P001_D003VO;


@Repository("F_P001_D003DAO")
public class F_P001_D003DAOImpl implements F_P001_D003DAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<F_P001_D003VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<F_P001_D003VO> list = sqlSession.selectList("hm.F_P001_D003.searchList", searchMap);
		System.out.println("dao 데이터 확인");
		for(int i = 0; i < list.size(); i++)
		{
			System.out.println(list.get(i));
		}
		return list;
	}
	
	@Override
	public List<F_P001_D003VO> searchMod(Map<String, Object> searchMap) throws DataAccessException {
		List<F_P001_D003VO> list = sqlSession.selectList("hm.p0001.searchMod", searchMap);
		return list;
	}

	@Override
	public List<F_P001_D003VO> searchAdd() throws DataAccessException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateMember(Map<String, Object> datahMap) throws DataAccessException {
		sqlSession.update("hm.F_P001_D003.updateMember", datahMap);
	}

	@Override
	public void insertMember(Map<String, Object> datahMap) throws DataAccessException {
		sqlSession.update("hm.F_P001_D003.insertMember", datahMap);
	}

	@Override
	public void deleteMember(Map<String, Object> datahMap) throws DataAccessException {
		sqlSession.update("hm.F_P001_D003.deleteMember", datahMap);
	}

}
