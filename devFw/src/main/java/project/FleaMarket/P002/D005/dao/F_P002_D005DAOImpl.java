package project.FleaMarket.P002.D005.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.FleaMarket.P002.D005.vo.F_P002_D005VO;


@Repository("F_P002_D005DAO")
public class F_P002_D005DAOImpl implements F_P002_D005DAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<F_P002_D005VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<F_P002_D005VO> list = sqlSession.selectList("FleaMarket.p002_d005.searchList", searchMap);
		for(int i = 0; i < list.size(); i++)
		{
			System.out.println(list.get(i));
		}
		return list;
	}
	
	@Override
	public List<F_P002_D005VO> searchMod(Map<String, Object> searchMap) throws DataAccessException {
		List<F_P002_D005VO> list = sqlSession.selectList("FleaMarket.p002_d005.searchMod", searchMap);
		return list;
	}

	@Override
	public List<F_P002_D005VO> searchAdd() throws DataAccessException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateMember(Map<String, Object> datahMap) throws DataAccessException {
		sqlSession.update("FleaMarket.p002_d005.updateMember", datahMap);
	}

	@Override
	public void insertMember(Map<String, Object> datahMap) throws DataAccessException {
		sqlSession.update("hm.F_P002_D005.insertMember", datahMap);
	}

	@Override
	public void deleteMember(Map<String, Object> datahMap) throws DataAccessException {
		sqlSession.update("hm.F_P002_D005.deleteMember", datahMap);
	}

}
