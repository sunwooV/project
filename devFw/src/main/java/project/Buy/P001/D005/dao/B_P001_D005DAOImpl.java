package project.Buy.P001.D005.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.Buy.P001.D004.vo.B_P001_D004VO;
import project.Buy.P001.D005.vo.B_P001_D005VO;
import javax.net.ssl.HttpsURLConnection;
import java.io.*;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import com.fasterxml.jackson.databind.ObjectMapper;
//import com.google.gson.Gson;





@Repository("B_P001_D005DAO")
public class B_P001_D005DAOImpl implements B_P001_D005DAO {
	@Autowired
	private SqlSession sqlSession;


	@Override
	public void insertOrders(Map<String, Object> dataMap) {
		System.out.println("insert order dao 타고가닝?");
		sqlSession.insert("Buy.P001.D005.insertOrder",dataMap);
		
	}

	@Override
	public void insertDest(Map<String, Object> dataMap) {
		System.out.println(" insertDest dao 타고가닝?");
		sqlSession.insert("Buy.P001.D005.InsertDestination",dataMap);
		
	}

	
}
