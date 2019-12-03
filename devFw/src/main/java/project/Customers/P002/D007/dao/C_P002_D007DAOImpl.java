package project.Customers.P002.D007.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.Customers.P002.D006.vo.C_P002_D006VO;
import project.Customers.P002.D007.vo.C_P002_D007VO;



@Repository("C_P002_D007DAO")
public class C_P002_D007DAOImpl implements C_P002_D007DAO {
	
	
	@Autowired
	private SqlSession sqlSession;


	@Override
	public List selectAllreviewList(String memberid) throws DataAccessException {
		List<C_P002_D007VO> reviewList = null;
		reviewList = sqlSession.selectList("C_P002_D007.selectAllreviewList", memberid);/* xml 아이디값.select id 값*/
		System.out.println("마이페이지reviewList" + reviewList);
		return reviewList
				;
	}

	
	
	
	

}
