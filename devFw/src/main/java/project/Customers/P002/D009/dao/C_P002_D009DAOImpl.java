package project.Customers.P002.D009.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import project.Customers.P002.D009.vo.C_P002_D009VO;


@Repository("C_P002_D009DAO")

public class C_P002_D009DAOImpl implements C_P002_D009DAO {
   @Autowired
   SqlSession sqlsession = null;
   
   
         public C_P002_D009VO check(String memberid) throws Exception{
            return sqlsession.selectOne("Customers.modify.check", memberid);
         }
         
         // 마이페이지
         @Transactional
         public int update(C_P002_D009VO member) throws Exception{
        	 System.out.println("12313333333333333333333333333333333333333333333333333312=="+member.getNickname());
        	 System.out.println("12313333333333333333333333333333333333333333333333333312=77="+member.getMemberid());
            return sqlsession.update("Customers.modify.update", member);
         }
         
         // 비밀번호 변경
         @Transactional
         public int modify(C_P002_D009VO member) throws Exception{
            return sqlsession.update("Customers.modify.modify", member);
         }
         
         @Transactional
     	public int out(C_P002_D009VO member) throws Exception{
     		return sqlsession.delete("Customers.modify.out", member);
     	}
         
}


   