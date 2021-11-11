package com.service;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dao.MemberDAO;
import com.dto.MemberDTO;

public class MemberService {

	MemberDAO dao;
	
	public MemberService() {
		dao = new MemberDAO();
	}

	public int memberAdd(MemberDTO member) {
		SqlSession session = MySqlSessionFactory.getSqlSession();
		int n = 0;
		try {
			n = dao.memberAdd(session, member);
			session.commit();
		}finally {
			session.close();
		}
		return n;
	}

	  public int idCheck(String userid) {
			SqlSession session = MySqlSessionFactory.getSqlSession();
			int count = 0;
			try {
				 MemberDAO dao = new MemberDAO();
				count = dao.idCheck(session, userid);
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				session.close();
			}
			return count;
		}//end idCheck

	public MemberDTO login(HashMap<String, String> map) {
		SqlSession session = MySqlSessionFactory.getSqlSession();
		MemberDTO dto = null;
		try {
			dto = dao.login(session, map);
		}finally {
			session.close();
		}
		return dto;
	}

	public MemberDTO mypage(String id) {
		SqlSession session = MySqlSessionFactory.getSqlSession();
		MemberDTO dto = null;
		try {
			dto = dao.mypage(session, id);
		}finally {
			session.close();
		}
		return dto;
	}

	public int memberUpdate(MemberDTO dto) {
		SqlSession session = MySqlSessionFactory.getSqlSession();
		int n = 0;
		try {
			n = dao.memberUpdate(session, dto);
			session.commit();
		}finally {
			session.close();
		}
		return n;
	}

	public String idSearch(MemberDTO dto) {
		SqlSession session = MySqlSessionFactory.getSqlSession();
		String userid = null;
		try {
			userid = dao.idSearch(session, dto);
		}finally {
			session.close();
		}
		return userid;
	}

}
