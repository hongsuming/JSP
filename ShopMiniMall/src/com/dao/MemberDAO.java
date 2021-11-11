package com.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.dto.MemberDTO;

public class MemberDAO {

	public int memberAdd(SqlSession session, MemberDTO member) {
		return session.insert("memberAdd", member);
	}

	public int idCheck(SqlSession session, String userid) {
		return session.selectOne("MemberMapper.idCheck", userid);
	}

	public MemberDTO login(SqlSession session, HashMap<String, String> map) {
		return session.selectOne("login", map);
	}

	public MemberDTO mypage(SqlSession session, String id) {
		return session.selectOne("mypage", id);
	}

	public int memberUpdate(SqlSession session, MemberDTO dto2) {
		return session.update("memberUpdate", dto2);
	}

	public String idSearch(SqlSession session, MemberDTO dto) {
		return session.selectOne("idSearch", dto);
	}
}
