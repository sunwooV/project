package project.Sell.P001.D006.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("S_P001_D006DAO")
public class S_P001_D006DAOImpl implements S_P001_D006DAO {
	@Autowired
	private SqlSession sqlSession;
	
	
}
