package project.FleaMarket.P002.D005.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import project.FleaMarket.P002.D005.dao.F_P002_D005DAO;
import project.FleaMarket.P002.D005.service.F_P002_D005Service;
import project.FleaMarket.P002.D005.vo.F_P002_D005VO;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

@Controller("F_P002_D005Controller")
public class F_P002_D005ControllerImpl implements F_P002_D005Controller {
	private static final Logger logger = LoggerFactory.getLogger(F_P002_D005ControllerImpl.class);
	private static final String CURR_IMAGE_REPO_PATH = "C:/Users/bitcamp/git/project/devFw/src/main/webapp/resources/photoUpload/";
	@Autowired
	F_P002_D005Service d005Service;
	@Autowired
	F_P002_D005VO d005VO;
	
	@RequestMapping(value="/form")
	public String form() {
		System.out.println("이미지 확인");
	    return "p002_d001_fleaMystore";
	  }

	@Override
	@RequestMapping(value="/fleaProfileEdit.do",method = RequestMethod.POST)
	public ModelAndView fleaProfileEdit(MultipartHttpServletRequest multipartRequest,HttpServletResponse response)
			  throws Exception{
				System.out.println("업로드 확인");
				multipartRequest.setCharacterEncoding("utf-8");
				Map map = new HashMap();
				Enumeration enu=multipartRequest.getParameterNames();
				while(enu.hasMoreElements()){
					String name=(String)enu.nextElement();
					String value=multipartRequest.getParameter(name);
					//System.out.println(name+", "+value);
					map.put(name,value);
				}
				
				List fileList= fileProcess(multipartRequest);
				map.put("fileList", fileList);
				ModelAndView mav = new ModelAndView("FleaMarket/p002_d005_fleaProfileEdit");
				mav.addObject("map", map);
				//mav.setViewName("hm/result");
				return mav;
		}
	@Override
	@RequestMapping(value = "/fleaProfileUpdate.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public ResponseEntity fleaProfileUpdate(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String flea_name = request.getParameter("flea_name");
		String intro_cotent = request.getParameter("intro_cotent");
		String flea_code = request.getParameter("flea_code");
		System.out.println(flea_code + "," + flea_name + "," + intro_cotent);
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		Enumeration enu = request.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = request.getParameter(name);
			dataMap.put(name, value);
		}
		
		System.out.println("dataMap::::::::::" + dataMap);
		
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders(); 
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");		
		try {
			d005Service.updateMember(dataMap);

			response.sendRedirect("/devFw/fleaMystore.do");
			/*RequestDispatcher dispatch = request.getRequestDispatcher("/FleaMarket/P002/D001/searchList.do");
			dispatch.forward(request, response);*/
		} catch (Exception e) {
			message = " <script>";
			message += " alert('오류가 발생하였습니다.');";
			message += " location.href='" + request.getContextPath() + "/devFw/fleaMystore.do'; ";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}		
		return resEnt;
	}
			
			private List<String> fileProcess(MultipartHttpServletRequest multipartRequest) throws Exception{
				List<String> fileList= new ArrayList<String>();
				Iterator<String> fileNames = multipartRequest.getFileNames();
				while(fileNames.hasNext()){
					String fileName = fileNames.next();
					MultipartFile mFile = multipartRequest.getFile(fileName);
					String originalFileName=mFile.getOriginalFilename();
					fileList.add(originalFileName);
					File file = new File(CURR_IMAGE_REPO_PATH +"\\"+ fileName);
					if(mFile.getSize()!=0){ //File Null Check
						if(! file.exists()){ //경로상에 파일이 존재하지 않을 경우
							if(file.getParentFile().mkdirs()){ //경로에 해당하는 디렉토리들을 생성
								file.createNewFile(); //이후 파일 생성
							}
						}
						mFile.transferTo(new File(CURR_IMAGE_REPO_PATH +"\\"+ originalFileName)); //임시로 저장된 multipartFile을 실제 파일로 전송
					}
				}
				return fileList;
			}	
			
			

}
