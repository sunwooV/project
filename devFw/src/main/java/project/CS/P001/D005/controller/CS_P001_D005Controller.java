package project.CS.P001.D005.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface CS_P001_D005Controller {

	

	ModelAndView csWriteComplete(HttpServletRequest request, HttpServletResponse response, String board_num)
			throws Exception;


}
