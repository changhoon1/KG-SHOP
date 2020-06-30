package com.care.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.care.DAO.MemberDAO;
import com.care.DTO.MemberDTO;
import com.care.DTO.ProductnameDTO;

@Service
public class MemberService {
	
	@Autowired
	private MemberDAO dao;
	
	public void execute(MemberDTO dto) throws SQLException {
		dao.updatedata(dto);
	}

	public void savedata(MemberDTO dto) {
		dao.savedata(dto);
	}

	public MemberDTO logincheck(MemberDTO dto) throws Exception{		
		return dao.logincheck(dto);
	}

	public int idChk(MemberDTO dto) throws Exception{
		int result = dao.idChk(dto);
		return result;
	}

	public MemberDTO list(String id) throws Exception{
		return dao.list(id);		
	}

	public List<ProductnameDTO> bestView(){
		return dao.bestView();
	}


}
