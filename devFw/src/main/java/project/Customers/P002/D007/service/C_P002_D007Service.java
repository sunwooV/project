package project.Customers.P002.D007.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import project.FleaMarket.P001.D001.vo.F_P001_D001VO;

public interface C_P002_D007Service {
	public List listreview(String memberid) throws DataAccessException;
    public List<Map<String, Object>> selectAllreviewList(Map<String, Object> dataMap) throws DataAccessException;
	
}
