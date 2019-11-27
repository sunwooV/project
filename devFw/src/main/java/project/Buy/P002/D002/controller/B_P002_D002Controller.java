package project.Buy.P002.D002.controller;


import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.servlet.ModelAndView;

public interface B_P002_D002Controller {

		//리뷰 폼보이기
		public ModelAndView review(HttpServletRequest request) throws IOException;
		//쓴 리뷰 내용 DB insert
		public ResponseEntity insertReview(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
