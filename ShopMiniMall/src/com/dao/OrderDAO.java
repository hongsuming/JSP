package com.dao;

import org.apache.ibatis.session.SqlSession;

import com.dto.OrderDTO;

public class OrderDAO {

	public int orderDone(SqlSession session, OrderDTO order) {
		return session.insert("orderDone", order);
	}

	public int cartDel(SqlSession session, int orderNum) {
		return session.delete("cartDel", orderNum);
	}

}
