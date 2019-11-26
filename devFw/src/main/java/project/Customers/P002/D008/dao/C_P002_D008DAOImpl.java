package project.Customers.P002.D008.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import project.Customers.P002.D008.vo.C_P002_D008VO;

@Repository("C_P002_D008DAO")
public class C_P002_D008DAOImpl implements C_P002_D008DAO{
	@Autowired
	SqlSession sqlsession = null;
	
	@Transactional
	public C_P002_D008VO point_check(String memberid) throws Exception{
		System.out.println("dao");
		System.out.println("dao입니다만========"+memberid);
		return sqlsession.selectOne("Customers.memberpoint.point_check", memberid);
	}

}
