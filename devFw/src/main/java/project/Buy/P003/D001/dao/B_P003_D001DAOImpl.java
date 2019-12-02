package project.Buy.P003.D001.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;


import project.Buy.P002.D002.vo.B_P002_D002VO;







@Repository("B_P003_D001DAO")
public class B_P003_D001DAOImpl implements B_P003_D001DAO {
	@Autowired
	private SqlSession sqlSession;

	//쓴 리뷰 내용 DB insert
	@Override
	public void insertChangeReason(Map<String, Object> searchMap) throws DataAccessException {
		System.out.println("Buy P003 D001 DAO의 insertChangeReason");
		//sqlSession.selecList("mapping되는 xml.그 xml의 id",)
	 sqlSession.update("Buy.P003.D001.insertChangeReason", searchMap);
	}

}
