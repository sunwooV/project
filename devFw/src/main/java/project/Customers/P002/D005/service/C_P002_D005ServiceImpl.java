package project.Customers.P002.D005.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import project.Customers.P001.D001.vo.C_P001_D001VO;
import project.Customers.P002.D005.dao.C_P002_D005DAO;
import project.Customers.P002.D005.vo.C_P002_D005VO;

@Service("C_P002_D005Service")
public class C_P002_D005ServiceImpl implements C_P002_D005Service {
	@Inject
	private C_P002_D005DAO c_p002_d005_DAO;

	@Override
	public List<C_P002_D005VO> selectMessageList(C_P002_D005VO c_p002_d005vo) throws Exception {
		List<C_P002_D005VO> list=c_p002_d005_DAO.selectMessageList(c_p002_d005vo);
		return list;
	}

	@Override
	public void insertMessage(C_P002_D005VO c_p002_d005vo) throws Exception {
		c_p002_d005_DAO.insertMessage(c_p002_d005vo);
		
	}

	@Override
	public List<C_P001_D001VO> selectMemberList(String memberid) throws Exception {
		List<C_P001_D001VO> list=c_p002_d005_DAO.selectMemberList(memberid);		
		return list;
	}

	@Override
	public List<C_P001_D001VO> selectSearchList(Map<String, String> searchMap) throws Exception {
		List<C_P001_D001VO> list=c_p002_d005_DAO.selectSearchList(searchMap);		
		return list;
	}
}
