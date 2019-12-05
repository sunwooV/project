package project.FleaMarket.P001.D002.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import project.FleaMarket.P001.D002.vo.F_P001_D002VO;

public interface F_P001_D002Service {
	 public List<F_P001_D002VO> searchList(Map<String, Object> searchMap) throws DataAccessException;
	 public List<F_P001_D002VO> searchMod(Map<String, Object> searchMap) throws DataAccessException;
	 public List<F_P001_D002VO> searchAdd() throws DataAccessException;
	 public List<F_P001_D002VO> recruit_date_check() throws DataAccessException;
	 
	 public void updateRecruit(Map<String, Object> datahMap) throws Exception;
	 public void updateMember(Map<String, Object> datahMap) throws Exception;
	 public void insertMember(Map<String, Object> datahMap) throws Exception;
	 public void deleteMember(Map<String, Object> datahMap) throws Exception;
}
