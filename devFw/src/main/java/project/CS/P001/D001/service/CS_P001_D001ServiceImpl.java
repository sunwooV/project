package project.CS.P001.D001.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import project.Buy.P001.D003.dao.B_P001_D003DAO;
import project.Buy.P001.D003.vo.B_P001_D003VO;
import project.CS.P001.D001.dao.CS_P001_D001DAO;

@Service("CS_P001_D001Service")
@Transactional(propagation = Propagation.REQUIRED)
public class CS_P001_D001ServiceImpl implements CS_P001_D001Service{
	@Autowired
	private CS_P001_D001DAO cs_p001_d001DAO;

	}
