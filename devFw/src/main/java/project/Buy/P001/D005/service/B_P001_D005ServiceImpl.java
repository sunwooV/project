package project.Buy.P001.D005.service;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import project.Buy.P001.D005.dao.B_P001_D005DAO;
import project.Buy.P001.D005.vo.B_P001_D005VO;
import project.Buy.P001.D005.vo.kakaopayReadyVo;



@Service("B_P001_D005Service")
@Transactional(propagation = Propagation.REQUIRED)
public class B_P001_D005ServiceImpl implements B_P001_D005Service{
	
	private static final String HOST ="https://kapi.kakao.com";
	
	@Autowired
	private B_P001_D005DAO b_p001_d005DAO;
	
	private B_P001_D005VO b_p001_d005vo;
	private kakaopayReadyVo kakaoReady;

	@RequestMapping(value="/oauth", produces="application/json", method ={ RequestMethod.GET, RequestMethod.POST })
	//출처: https://alpreah.tistory.com/122?category=844976 [생각에 취하는날])
	@Override
	public String kakaopayReady(Map<String, Object> searchMap) throws DataAccessException {
	RestTemplate restTemplate = new RestTemplate();
		
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK"+"305bdc00595802bd6993fb67680f53eb");
		headers.add("Accept",MediaType.APPLICATION_JSON_VALUE);
		headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE+";charset=UTF-8");
		
		//서버로 요청할 Body
		MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
		params.add("cid", "TC0ONETIME");
		params.add("partner_order_id", "1001");
		params.add("partner_user_id", "gorany");
		params.add("item_name", "갤럭시S9");
		params.add("quantity", "1");
		params.add("total_amount", "2100");
		params.add("tax_free_amount", "100");
		params.add("approval_url", "http://localhost:8090/devFw/Buy/P001/D005/kakaopaySuccess.do");
		params.add("cancel_url", "http://localhost:8090/devFw/Buy/P001/D005/kakaopayCancle.do");
		params.add("fail_url", "http://localhost:8090/devFw/Buy/P001/D005/kakaopayFail.do");
		
		HttpEntity<MultiValueMap<String,String>> body = new HttpEntity<MultiValueMap<String,String>>(params,headers);
		
		try {
			kakaoReady = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body, kakaopayReadyVo.class);
			
			return kakaoReady.getNext_redirect_pc_url();
		}catch(RestClientException e){
			e.printStackTrace();
		}catch(URISyntaxException e){
			e.printStackTrace();
		}
		
		return null;
	}

	@Override
	public B_P001_D005VO kakaopayInfo(String pg_token) throws DataAccessException {
		System.out.println("kakaopayInfo-----------");
		
		RestTemplate restTemplate = new RestTemplate();
		
		//서버로 요청할 Header
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK" +"305bdc00595802bd6993fb67680f53eb");
		headers.add("Accept", MediaType.APPLICATION_JSON_VALUE);
		headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE+";charset=UTF-8");
		
		//서버로 요청할 Body
		MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
		params.add("cid", "TC0ONETIME");
		params.add("tid", kakaoReady.getTid());
		params.add("partner_order_id", "1001");
		params.add("partner_user_id", "gorany");
		params.add("item_name", "갤럭시S9");
		params.add("total_amount", "2100");
		
		HttpEntity<MultiValueMap<String,String>> body = new HttpEntity<MultiValueMap<String, String>>(params,headers);
		 
		try {
			b_p001_d005vo = restTemplate.postForObject(new URI(HOST + "/v1/payment/approve"), body, B_P001_D005VO.class);
	         System.out.println("B_P001_D005VO(kakaopay approval)-----------");
	          
	            return b_p001_d005vo;
	        
	        } catch (RestClientException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        } catch (URISyntaxException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }
	        
	        return null;
		
		
		
	}
	
	}

