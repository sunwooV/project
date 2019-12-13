package project.Customers.P002.D005.service;

import java.util.List;
import java.util.Map;

import project.Customers.P001.D001.vo.C_P001_D001VO;
import project.Customers.P002.D005.vo.C_P002_D005VO;

public interface C_P002_D005Service {

	public List<C_P002_D005VO> selectMessageList(C_P002_D005VO c_p002_d005vo) throws Exception;
	public void insertMessage(C_P002_D005VO c_p002_d005vo) throws Exception;
	public List<C_P001_D001VO> selectMemberList(Map<String, Object> searchMap) throws Exception;
	public List<C_P001_D001VO> selectSearchList(Map<String, String> searchMap) throws Exception;
	public List<C_P001_D001VO> selectSeller(Map<String, Object> searchMap) throws Exception;
	
	public String sellerId(Map<String, Object> searchMap) throws Exception;
}
