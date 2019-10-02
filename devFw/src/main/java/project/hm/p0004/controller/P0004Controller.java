package project.hm.p0004.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.servlet.ModelAndView;

public interface P0004Controller {
	public ModelAndView searchInit(HttpServletRequest request, HttpServletResponse response) throws Exception;	
	public Map<String, Object> searchMember(String p_id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView searchInsert(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public Map<String, Object> updateMember(HttpServletRequest request, HttpServletResponse response) throws Exception;
}