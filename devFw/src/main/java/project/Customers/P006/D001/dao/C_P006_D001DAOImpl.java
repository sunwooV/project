package project.Customers.P006.D001.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.Customers.P006.D001.vo.C_P006_D001VO;

@Repository("C_P006_D001DAO")
public class C_P006_D001DAOImpl implements C_P006_D001DAO{

		
		@Autowired
		private SqlSession sqlSession;

		@Override
		public List<C_P006_D001VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
			List<C_P006_D001VO> list = sqlSession.selectList("Customers.out.searchList",searchMap);
			return list;
		}


		@Override
		public void updateData(Map<String, String> row) throws DataAccessException {
			sqlSession.update("Customers.out.updateData",row);
			
		}

		@Override
		public void deleteData(Map<String, String> row) throws DataAccessException {
			sqlSession.update("Customers.out.deleteData",row);
		}
		
		@Override
		public void black_out_again(Map<String, String> row) throws DataAccessException {
			sqlSession.delete("Customers.out.black_out_again",row);
			
		}
		
		@Override
		public void member_again_insert(Map<String, String> row) throws DataAccessException {
			sqlSession.insert("Customers.out.member_again_insert",row);
		}
		
		
		
}
