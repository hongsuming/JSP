package com.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dao.CartDAO;
import com.dto.CartDTO;

public class CartService {
	CartDAO dao;

	public CartService() {
		dao = new CartDAO();
	}

	public int cartAdd(CartDTO cart) {
		SqlSession session = MySqlSessionFactory.getSqlSession();
		int n = 0;
		try {
			n = dao.cartAdd(session, cart);
			session.commit();
		}finally {
			session.close();
		}
		return n;
	}

	public List<CartDTO> cartList(String userid) {
		SqlSession session = MySqlSessionFactory.getSqlSession();
		List<CartDTO> list = null;
		try {
			list = dao.cartList(session, userid);
		}finally {
			session.close();
		}
		return list;
	}

	public int cartDel(int num) {
		SqlSession session = MySqlSessionFactory.getSqlSession();
		int n = 0;
		try {
			n = dao.cartDel(session, num);
			session.commit();
		}finally {
			session.close();
		}
		return n;
	}

	public int cartUpdate(HashMap<String, Integer> map) {
		SqlSession session = MySqlSessionFactory.getSqlSession();
		int n = 0;
		try{
			n = dao.cartUpdate(session, map);
			session.commit();
		}finally {
			session.close();
		}
		return n;
	}

	public int cartAllDel(List<String> list) {
		SqlSession session = MySqlSessionFactory.getSqlSession();
		int n = 0;
		try {
			n = dao.cartAllDel(session, list);
			session.commit();
		}finally {
			session.close();
		}
		return n;
	}

	public CartDTO cartByNum(String num) {
		SqlSession session = MySqlSessionFactory.getSqlSession();
		CartDTO dto = null;
		try {
			dto = dao.cartByNum(session, num);
		}finally {
			session.close();
		}
		return dto;
	}
	
}
