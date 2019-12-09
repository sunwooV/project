package project.Sell.P001.D005.dao;

import java.util.Map;

import org.springframework.dao.DataAccessException;

public interface S_P001_D005DAO {
	//상품 수정
	public void updateTag(Map<String, Object> datahMap) throws DataAccessException;
	public void updateProduct(Map<String, Object> datahMap) throws DataAccessException;
	
	//상품 삭제
	public void deleteBid(Map<String, Object> datahMap) throws DataAccessException;;
	public void deleteTag(Map<String, Object> datahMap) throws DataAccessException;
	public void deleteProduct(Map<String, Object> datahMap) throws DataAccessException;
}
