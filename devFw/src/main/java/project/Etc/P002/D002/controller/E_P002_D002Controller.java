package project.Etc.P002.D002.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface E_P002_D002Controller {

	Map boardsaveData(HttpServletRequest request, HttpServletResponse response) throws Exception;

	String boardsearchList2(HttpServletRequest request, HttpServletResponse response) throws Exception;

	Map boardsearchList(HttpServletRequest request, HttpServletResponse response) throws Exception;

	ModelAndView boardsearchInit(HttpServletRequest request, HttpServletResponse response) throws Exception;

}
