package project.Main.P001.D002.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface M_P001_D002Controller {

	public ModelAndView autionList(HttpServletRequest request, HttpServletResponse response) throws Exception ;

	public ModelAndView auctionMain(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
