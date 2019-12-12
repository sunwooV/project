package project.FleaMarket.P002.D003.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import project.FleaMarket.P002.D003.vo.F_P002_D003VO;

public interface F_P002_D003Service {
	 public List<F_P002_D003VO> searchList(Map<String, Object> searchMap) throws DataAccessException;
	 public List<F_P002_D003VO> storyList(Map<String, Object> searchMap) throws DataAccessException;
	 public List<F_P002_D003VO> searchMod(Map<String, Object> searchMap) throws DataAccessException;
	 public List<F_P002_D003VO> searchAdd() throws DataAccessException;
	 public List<F_P002_D003VO> selectStory(Map<String, Object> searchMap) throws DataAccessException;
	 public String storySize(Map<String, Object> searchMap) throws DataAccessException;

	 public void inserStoryComment(Map<String, Object> datahMap) throws Exception;
	 public void updateMember(Map<String, Object> datahMap) throws Exception;
	 public void insertMember(Map<String, Object> datahMap) throws Exception;
	 public void deleteMember(Map<String, Object> datahMap) throws Exception;
}
