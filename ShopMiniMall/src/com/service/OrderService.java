package com.service;

import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dao.OrderDAO;
import com.dto.OrderDTO;

public class OrderService {
	OrderDAO dao;

	public OrderService() {
		dao = new OrderDAO();
	}

	public int orderDone(OrderDTO order, String orderNum) {
		SqlSession session = MySqlSessionFactory.getSqlSession();
		int n = 0;
		try {
			n = dao.orderDone(session, order);
			n = dao.cartDel(session, Integer.parseInt(orderNum));
			session.commit();
		} catch (Exception e) {
			session.rollback();
			System.out.println("rollback 됨" + e);
		}finally {
			session.close();
		}
		return n;
	}

}
