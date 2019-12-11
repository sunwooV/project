package project.Customers.P002.D006.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import project.FleaMarket.P001.D001.vo.F_P001_D001VO;

public interface C_P002_D006Service {
	public List listQna(String memberid) throws DataAccessException;
    public List<Map<String, Object>> selectAllqnaList(Map<String, Object> dataMap) throws DataAccessException;
	
    public void deleteQna(Map<String, Object> datahMap) throws Exception;
}
