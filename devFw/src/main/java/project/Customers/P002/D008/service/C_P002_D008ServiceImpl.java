package project.Customers.P002.D008.service;

import java.io.PrintWriter;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import project.Customers.P002.D008.dao.C_P002_D008DAO;
import project.Customers.P002.D008.vo.C_P002_D008VO;



@Service("C_P002_D008Service")
public class C_P002_D008ServiceImpl implements C_P002_D008Service{
	@Inject
	private C_P002_D008DAO c_p002_d008_DAO;
	
	@Override
	public C_P002_D008VO point_check(String memberid, HttpServletResponse response) throws Exception {
		return c_p002_d008_DAO.point_check(memberid);
//		System.out.println();
//		PrintWriter out = response.getWriter();
//		out.println(c_p002_d008_DAO.point_check(memberid));
//		out.close();
	}
	
	@Override
    public List<C_P002_D008VO> boardList(String memberid) throws Exception {
        return c_p002_d008_DAO.boardList(memberid); 
    }

}
