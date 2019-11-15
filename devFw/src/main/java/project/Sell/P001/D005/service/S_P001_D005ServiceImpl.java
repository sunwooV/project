package project.Sell.P001.D005.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.Sell.P001.D005.dao.S_P001_D005DAO;

@Service("S_P001_D005Service")
public class S_P001_D005ServiceImpl implements S_P001_D005Service{
	@Autowired
	private S_P001_D005DAO S_P001_D005DAO;
	
	//상품 수정
	@Override
	public void updateTag(Map<String, Object> datahMap) throws Exception {
		S_P001_D005DAO.updateTag(datahMap);
	}
	
	@Override
	public void updateProduct(Map<String, Object> datahMap) throws Exception {
		S_P001_D005DAO.updateProduct(datahMap);
	}
	
	//상품 삭제
	@Override
	public void deleteTag(Map<String, Object> datahMap) throws Exception {
		S_P001_D005DAO.deleteTag(datahMap);
	}
	
	@Override
	public void deleteProduct(Map<String, Object> datahMap) throws Exception {
		S_P001_D005DAO.deleteProduct(datahMap);
	}

}
