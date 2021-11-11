package com.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dao.GoodsDAO;
import com.dto.GoodsDTO;

public class GoodsService {
	GoodsDAO dao;

	public GoodsService() {
		dao = new GoodsDAO();
	}

	public List<GoodsDTO> goodsList(String string) {
		SqlSession session = MySqlSessionFactory.getSqlSession();
		List<GoodsDTO> list = null;
		try {
			list = dao.goodsList(session, string);
		}finally {
			session.close();
		}
		return list;
	}

	public GoodsDTO goodsRetrieve(String gCode) {
		SqlSession session = MySqlSessionFactory.getSqlSession();
		GoodsDTO dto = null;
		try {
			dto = dao.goodsRetrieve(session, gCode);
		}finally {
			session.close();
		}
		return dto;
	}
	
}
