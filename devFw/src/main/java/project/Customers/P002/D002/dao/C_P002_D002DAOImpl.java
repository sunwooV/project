package project.Customers.P002.D002.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.Customers.P002.D002.vo.C_P002_D002VO;

@Repository("C_P002_D002DAO")
public class C_P002_D002DAOImpl implements C_P002_D002DAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<C_P002_D002VO> myBidList(Map<String, Object> datahMap) throws DataAccessException {
		List<C_P002_D002VO> myBidList = sqlSession.selectList("Customers.p002_d002.myBidList", datahMap);
		return myBidList;
	}

//	@Override
//	public String progressChk(Map<String, Object> datahMap) throws DataAccessException {
//		String progressChk = sqlSession.selectOne("Customers.p002_d002.progressChk", datahMap);
//		return progressChk;
//	}

}
