package project.Customers.P003.D001.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("C_P003_D001DAO")
public class C_P003_D001DAOImpl implements C_P003_D001DAO {
	@Autowired
	private SqlSession sqlSession;
}
