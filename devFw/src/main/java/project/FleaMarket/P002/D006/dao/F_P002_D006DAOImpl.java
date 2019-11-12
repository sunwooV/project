package project.FleaMarket.P002.D006.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.FleaMarket.P002.D006.vo.F_P002_D006VO;


@Repository("F_P002_D006DAO")
public class F_P002_D006DAOImpl implements F_P002_D006DAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<F_P002_D006VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<F_P002_D006VO> list = sqlSession.selectList("FleaMarket.p002_d006.searchList", searchMap);
		for(int i = 0; i < list.size(); i++)
		{
			System.out.println(list.get(i));
		}
		return list;
	}
	
	@Override
	public List<F_P002_D006VO> searchMod(Map<String, Object> searchMap) throws DataAccessException {
		List<F_P002_D006VO> list = sqlSession.selectList("FleaMarket.p002_d006.searchMod", searchMap);
		return list;
	}

	@Override
	public List<F_P002_D006VO> searchAdd() throws DataAccessException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateMember(Map<String, Object> datahMap) throws DataAccessException {
		sqlSession.update("FleaMarket.p002_d006.updateMember", datahMap);
	}

	@Override
	public void insertMember(Map<String, Object> datahMap) throws DataAccessException {
		sqlSession.update("FleaMarket.p002_d006.insertMember", datahMap);
	}

	@Override
	public void deleteMember(Map<String, Object> datahMap) throws DataAccessException {
		sqlSession.update("hm.F_P002_D006.deleteMember", datahMap);
	}

}
