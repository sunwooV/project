package project.Sell.P001.D001.controller;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import project.Sell.P001.D001.service.S_P001_D001Service;
import project.Sell.P001.D002.vo.S_P001_D002VO;


@Controller("S_P001_D001Controller")
public class S_P001_D001ControllerImpl implements S_P001_D001Controller {
	private static final Logger logger = LoggerFactory.getLogger(S_P001_D001ControllerImpl.class);
	@Autowired
	S_P001_D001Service S_P001_D001Service;
	@Value("${uploadFilePath}")
	private String uploadFilePath;
	@Value("${downloadFilePath}")
	private String downloadFilePath;
	
	int cnt=0;
	
	@Override
	@RequestMapping(value = "/enroll.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public ModelAndView enroll(@RequestParam(value="category_name", required=false) String category_name, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("category_name", category_name);	 
		
		List high_category = S_P001_D001Service.high_category(searchMap);
		List middle_category = S_P001_D001Service.middle_category(searchMap);

		ModelAndView mav = new ModelAndView("Sell/p001_d001_enroll");
		mav.addObject("high_category", high_category);
		mav.addObject("middle_category", middle_category);
		
		return mav;
	}
	

	@Override
	@RequestMapping(value = "/searchInsert.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView searchInsert(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		ModelAndView mav = new ModelAndView("Sell/p001_d001_enroll");
		mav.addObject("command", "addSearch");
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/insertProduct.do", method = { RequestMethod.POST, RequestMethod.POST })
	@ResponseBody
	public ResponseEntity insertProduct(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> dataMap = new HashMap<String, Object>();
		Map<String, Object> searchMap = new HashMap<String, Object>();
		Enumeration enu = request.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String)enu.nextElement();
			String value = request.getParameter(name);
			dataMap.put(name, value);
			System.out.println(dataMap);
		}
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders(); // 헤더변경 시 사용
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");		
		try {
			S_P001_D001Service.insertProduct(dataMap);
			S_P001_D001Service.insertTag(dataMap);
			
			String prodNumber = S_P001_D001Service.selectProdNumber();
			
			System.out.println("prodNumber+++++++++++++++" + prodNumber);
			
			response.sendRedirect("/devFw/detail.do?prod_number="+ prodNumber);
			
//			RequestDispatcher dispatch = request.getRequestDispatcher("/Sell/P001/D001/searchList.do");
//			dispatch.forward(request, response);
		} catch (Exception e) {
			message = " <script>";
			message += " alert('오류가 발생했습니다. 다시 시도해 주세요');";
			message += " location.href='" + request.getContextPath() + "/enroll.do'; ";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}		
		return resEnt;
	}	
	
	
	@RequestMapping(value = "/coding.do")
    public String coding() {
        return "coding";
    }
 
    @RequestMapping(value = "/insertBoard.do", method = RequestMethod.POST)
    public String insertBoard(String editor) {
        System.err.println("저장할 내용 :  " + editor);
        return "redirect:/coding.do";
    }
 
    // 다중파일업로드
    @RequestMapping(value = "/file_uploader_html5.do",
                  method = RequestMethod.POST)
    @ResponseBody
    public String multiplePhotoUpload(HttpServletRequest request) {
    	// 파일정보
        StringBuffer sb = new StringBuffer();
        try {
        	// 파일명을 받는다 - 일반 원본파일명
            String oldName = request.getHeader("file-name");
            // 파일 기본경로 _ 상세경로
           
            //String filePath = uploadFilePath;
            
            String saveName = sb.append(new SimpleDateFormat("yyyyMMddHHmmss")
                          .format(System.currentTimeMillis()))
                          .append(UUID.randomUUID().toString())
                          .append(oldName.substring(oldName.lastIndexOf("."))).toString();
            InputStream is = request.getInputStream();
            OutputStream os = new FileOutputStream(uploadFilePath + saveName);
            int numRead;
            byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
            while ((numRead = is.read(b, 0, b.length)) != -1) {
                os.write(b, 0, numRead);
            }
            os.flush();
            os.close();
            // 정보 출력
            sb = new StringBuffer();
            sb.append("&bNewLine=true")
              .append("&sFileName=").append(oldName)
              .append("&sFileURL=").append(downloadFilePath)
              .append(saveName);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return sb.toString();
    }

}
