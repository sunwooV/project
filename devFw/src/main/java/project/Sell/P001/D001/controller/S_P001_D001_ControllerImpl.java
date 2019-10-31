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
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import project.Sell.P001.D001.vo.S_P001_D001_VO;
import project.Sell.P001.D001.dao.S_P001_D001_DAO;


@Controller("S_P001_D001_Controller")
public class S_P001_D001_ControllerImpl implements S_P001_D001_Controller {
	private static final Logger logger = LoggerFactory.getLogger(S_P001_D001_ControllerImpl.class);
	@Autowired
	S_P001_D001_DAO S_P001_D001_Service;
	@Autowired
	S_P001_D001_VO S_P001_D001_VO;
	
	int cnt=0;
	
	@Override
	@RequestMapping(value = "/Sell/P001/D001/enroll.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public ModelAndView high_category(@RequestParam(value="category_name", required=false) String category_name, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("category_name", category_name);	 
		
		List high_category = S_P001_D001_Service.high_category(searchMap);
		List middle_category = S_P001_D001_Service.middle_category(searchMap);

	
		ModelAndView mav = new ModelAndView("sell/enroll");
		mav.addObject("high_category", high_category);
		mav.addObject("middle_category", middle_category);
		
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/Sell/P001/D001/searchList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView searchList(@RequestParam(value="searchWord", required=false) String searchWord, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("searchWord", searchWord);	 
		
		List list = S_P001_D001_Service.searchList(searchMap);
		
		ModelAndView mav = new ModelAndView("sell/main");
		mav.addObject("searchProduct", list);
		System.out.println("list có�� \n " + list);
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/Sell/P001/D001/searchInsert.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView searchInsert(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		ModelAndView mav = new ModelAndView("sell/enroll");
		mav.addObject("command", "addSearch");
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/Sell/P001/D001/insertMember.do", method = { RequestMethod.POST, RequestMethod.POST })
	@ResponseBody
	public ResponseEntity insertProduct(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> dataMap = new HashMap<String, Object>();
		Enumeration enu = request.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String)enu.nextElement();
			String value = request.getParameter(name);
			dataMap.put(name, value);
			System.out.println(dataMap);
		}
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders(); // ������� �� ���
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");		
		try {
			S_P001_D001_Service.insertProduct(dataMap);
			
			response.sendRedirect("/devFw/main.do");
			
//			RequestDispatcher dispatch = request.getRequestDispatcher("/Sell/P001/D001/searchList.do");
//			dispatch.forward(request, response);
		} catch (Exception e) {
			message = " <script>";
			message += " alert('������ �߻��߽��ϴ�. �ٽ� �õ��� �ּ���');";
			message += " location.href='" + request.getContextPath() + "/Sell/P001/D001/enroll.do'; ";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}		
		return resEnt;
	}	
	
	
	@RequestMapping(value = "/Sell/P001/D001/coding.do")
    public String coding() {
        return "coding";
    }
 
    @RequestMapping(value = "/Sell/P001/D001/insertBoard.do", method = RequestMethod.POST)
    public String insertBoard(String editor) {
        System.err.println("������ ���� : " + editor);
        return "redirect:/coding.do";
    }
 
    // �������Ͼ��ε�
    @RequestMapping(value = "/Sell/P001/D001/file_uploader_html5.do",
                  method = RequestMethod.POST)
    @ResponseBody
    public String multiplePhotoUpload(HttpServletRequest request) {
        // ��������
        StringBuffer sb = new StringBuffer();
        try {
            // ���ϸ��� �޴´� - �Ϲ� �������ϸ�
            String oldName = request.getHeader("file-name");
            // ���� �⺻��� _ �󼼰��
           
            String filePath = "C:/myProject/workspace/devFw/src/main/webapp/resources/photoUpload/";
            String saveName = sb.append(new SimpleDateFormat("yyyyMMddHHmmss")
                          .format(System.currentTimeMillis()))
                          .append(UUID.randomUUID().toString())
                          .append(oldName.substring(oldName.lastIndexOf("."))).toString();
            InputStream is = request.getInputStream();
            OutputStream os = new FileOutputStream(filePath + saveName);
            int numRead;
            byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
            while ((numRead = is.read(b, 0, b.length)) != -1) {
                os.write(b, 0, numRead);
            }
            os.flush();
            os.close();
            // ���� ���
            sb = new StringBuffer();
            sb.append("&bNewLine=true")
              .append("&sFileName=").append(oldName)
              .append("&sFileURL=").append("http://localhost:8090/devFw/resources/photoUpload/")
        .append(saveName);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return sb.toString();
    }

	@Override
	@RequestMapping(value = "/Sell/P001/D001/enrollSuccess.do", method = RequestMethod.POST)
	public ModelAndView test(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		ModelAndView mav = new ModelAndView("sell/enrollSuccess");
		mav.addObject("command", "addSearch");
		return mav;
	}
}