package com.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dto.CartDTO;

public class CartDAO {

	public int cartAdd(SqlSession session, CartDTO cart) {
		return session.insert("cartAdd", cart);
	}

	public List<CartDTO> cartList(SqlSession session, String userid) {
		return session.selectList("cartList", userid);
	}

	public int cartDel(SqlSession session, int num) {
		return session.delete("cartDel", num);
	}

	public int cartUpdate(SqlSession session, HashMap<String, Integer> map) {
		return session.update("cartUpdate", map);
	}

	public int cartAllDel(SqlSession session, List<String> list) {
		return session.delete("cartAllDel", list);
	}

	public CartDTO cartByNum(SqlSession session, String num) {
		return session.selectOne("cartByNum", num);
	}

}
