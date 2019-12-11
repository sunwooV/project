package project.Customers.P002.D006.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.Customers.P002.D006.vo.C_P002_D006VO;



@Repository("C_P002_D006DAO")
public class C_P002_D006DAOImpl implements C_P002_D006DAO {
	
	
	@Autowired
	private SqlSession sqlSession;


	@Override
	public List selectAllqnaList(String memberid) throws DataAccessException {
		List<C_P002_D006VO> qnaList = null;
		qnaList = sqlSession.selectList("C_P002_D006.selectAllqnaList", memberid);/* xml 아이디값.select id 값*/
		System.out.println("마이페이지qnaList" + qnaList);
		return qnaList;
	}

	@Override
	public void deleteQna(Map<String, Object> datahMap) throws DataAccessException {
		sqlSession.update("C_P002_D006.deleteQna", datahMap);
	}
	
	
	

}
