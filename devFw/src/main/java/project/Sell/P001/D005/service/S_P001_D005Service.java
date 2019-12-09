package project.Sell.P001.D005.service;

import java.util.Map;

public interface S_P001_D005Service {
	//상품 수정
	public void updateTag(Map<String, Object> datahMap) throws Exception;
	public void updateProduct(Map<String, Object> datahMap) throws Exception;
	
	//상품 삭제
	public void deleteProduct(Map<String, Object> datahMap) throws Exception;
	
}
