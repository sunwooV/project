package project.FleaMarket.P002.D004.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.FleaMarket.P002.D004.vo.F_P002_D004VO;


@Repository("F_P002_D004DAO")
public class F_P002_D004DAOImpl implements F_P002_D004DAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<F_P002_D004VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<F_P002_D004VO> list = sqlSession.selectList("FleaMarket.p002_d004.searchList", searchMap);
		for(int i = 0; i < list.size(); i++)
		{
			System.out.println(list.get(i));
		}
		return list;
	}
	
	@Override
	public List<F_P002_D004VO> searchMod(Map<String, Object> searchMap) throws DataAccessException {
		List<F_P002_D004VO> list = sqlSession.selectList("hm.F_P002_D004.searchMod", searchMap);
		return list;
	}

	@Override
	public List<F_P002_D004VO> searchAdd() throws DataAccessException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateMember(Map<String, Object> datahMap) throws DataAccessException {
		sqlSession.update("hm.F_P002_D004.updateMember", datahMap);
	}

	@Override
	public void insertMember(Map<String, Object> datahMap) throws DataAccessException {
		sqlSession.update("hm.F_P002_D004.insertMember", datahMap);
	}

	@Override
	public void deleteMember(Map<String, Object> datahMap) throws DataAccessException {
		sqlSession.update("hm.F_P002_D004.deleteMember", datahMap);
	}

}
