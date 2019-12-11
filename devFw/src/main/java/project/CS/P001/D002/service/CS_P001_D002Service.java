package project.CS.P001.D002.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.CS.P001.D001.vo.CS_P001_D001VO;
import project.CS.P001.D001.vo.PagingVO;

public interface CS_P001_D002Service {
	
    public List listRefu();
    public List<Map<String, Object>> detailAllrefuList(Map<String, Object> dataMap) throws DataAccessException;
	public List listFaq();
    public List<Map<String, Object>> detailAllfaqList(Map<String, Object> dataMap) throws DataAccessException;
	public List listDeliv();
    public List<Map<String, Object>> detailAlldelivList(Map<String, Object> dataMap) throws DataAccessException;
	public List listCoupon();
    public List<Map<String, Object>> detailAllcouponList(Map<String, Object> dataMap) throws DataAccessException;
	public List listPay();
    public List<Map<String, Object>> detailAllpayList(Map<String, Object> dataMap) throws DataAccessException;

}
