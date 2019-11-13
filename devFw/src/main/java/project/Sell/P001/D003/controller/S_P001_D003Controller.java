package project.Sell.P001.D003.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ResponseBody;

import project.Sell.P001.D003.vo.S_P001_D003VO;

public interface S_P001_D003Controller {
	public void manageQnA(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public void manageAnswer(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
