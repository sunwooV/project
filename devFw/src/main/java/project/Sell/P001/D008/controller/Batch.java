package project.Sell.P001.D008.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import project.Sell.P001.D008.service.S_P001_D008Service;
import project.Sell.P001.D008.vo.S_P001_D008VO;

@Component
public class Batch {
	@Autowired
	S_P001_D008Service S_P001_D008Service;
	
	//1분마다 경매 시간 체크해서 시간 다 되면 => 낙찰 or 삭제
	@Scheduled(fixedRate = 10000)
	public void handle() throws Exception {
		System.out.println("=================");
		Map<String, Object> dataMap = new HashMap<String, Object>();
		String prod_number = null;
		String reused_yn = null;
		String flea_yn = null;
		String date_check = null;
		String auction_bid = null;
		String auction_price = null;
		
		List auction_date_check = S_P001_D008Service.auction_date_check();
		
		for(int i=0;i<auction_date_check.size();i++) {
			prod_number = ((S_P001_D008VO)auction_date_check.get(i)).getProd_number();
			reused_yn = ((S_P001_D008VO)auction_date_check.get(i)).getReused_yn();
			flea_yn = ((S_P001_D008VO)auction_date_check.get(i)).getFlea_yn();
			date_check = ((S_P001_D008VO)auction_date_check.get(i)).getDate_check();
			auction_bid = ((S_P001_D008VO)auction_date_check.get(i)).getAuction_bid();
			auction_price = ((S_P001_D008VO)auction_date_check.get(i)).getAuction_price();
			
			if(Integer.parseInt(date_check) <= 0) { //경매 시간이 끝났으면
				dataMap.put("prod_number", prod_number);
				
				if(Integer.parseInt(auction_bid) == Integer.parseInt(auction_price)) { //낙찰자가 없으면 (=입찰가랑 시작가가 같을 경우)		
					S_P001_D008Service.failAuction(dataMap);
					System.out.println("failAuction");
				} else { //낙찰자가 있으면
					S_P001_D008Service.winAuction(dataMap);
					System.out.println("winAuction");
				}
			}
			
		}
	}
}
