package project.FleaMarket.P002.D004.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import project.FleaMarket.P002.D004.vo.F_P002_D004VO;

public interface F_P002_D004Service {
	 public List<F_P002_D004VO> searchList(Map<String, Object> searchMap) throws DataAccessException;
	 public List<F_P002_D004VO> searchMod(Map<String, Object> searchMap) throws DataAccessException;
	 public List<F_P002_D004VO> searchAdd() throws DataAccessException;
	 
	 public void updateMember(Map<String, Object> datahMap) throws Exception;
	 public void insertMember(Map<String, Object> datahMap) throws Exception;
	 public void deleteMember(Map<String, Object> datahMap) throws Exception;
}
