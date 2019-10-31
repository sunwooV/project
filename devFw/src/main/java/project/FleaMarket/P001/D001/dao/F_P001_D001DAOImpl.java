package project.FleaMarket.P001.D001.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.FleaMarket.P001.D001.vo.F_P001_D001VO;


@Repository("F_P001_D001DAO")
public class F_P001_D001DAOImpl implements F_P001_D001DAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<F_P001_D001VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<F_P001_D001VO> list = sqlSession.selectList("hm.F_P001_D001.searchList", searchMap);
		System.out.println("dao 데이터 확인");
		for(int i = 0; i < list.size(); i++)
		{
			System.out.println(list.get(i));
		}
		return list;
	}
	
	@Override
	public List<F_P001_D001VO> searchMod(Map<String, Object> searchMap) throws DataAccessException {
		List<F_P001_D001VO> list = sqlSession.selectList("hm.p0001.searchMod", searchMap);
		return list;
	}

	@Override
	public List<F_P001_D001VO> searchAdd() throws DataAccessException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateMember(Map<String, Object> datahMap) throws DataAccessException {
		sqlSession.update("hm.F_P001_D001.updateMember", datahMap);
	}

	@Override
	public void insertMember(Map<String, Object> datahMap) throws DataAccessException {
		sqlSession.update("hm.F_P001_D001.insertMember", datahMap);
	}

	@Override
	public void deleteMember(Map<String, Object> datahMap) throws DataAccessException {
		sqlSession.update("hm.F_P001_D001.deleteMember", datahMap);
	}

}
