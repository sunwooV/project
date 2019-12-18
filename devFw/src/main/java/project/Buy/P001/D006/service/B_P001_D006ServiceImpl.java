package project.Buy.P001.D006.service;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import project.Buy.P001.D005.dao.B_P001_D005DAO;
import project.Buy.P001.D005.vo.B_P001_D005VO;




@Service("B_P001_D006Service")
@Transactional(propagation = Propagation.REQUIRED)
public class B_P001_D006ServiceImpl implements B_P001_D006Service{
	
	private static final String HOST ="https://kapi.kakao.com";
	
	@Autowired
	private B_P001_D005DAO b_p001_d005DAO;
	
	private B_P001_D005VO b_p001_d005vo;
	

	
	}

