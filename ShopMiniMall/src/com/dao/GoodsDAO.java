package com.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dto.GoodsDTO;

public class GoodsDAO {

	public List<GoodsDTO> goodsList(SqlSession session, String string) {
		return session.selectList("goodsList", string);
	}

	public GoodsDTO goodsRetrieve(SqlSession session, String gCode) {
		return session.selectOne("goodsRetrieve", gCode);
	}

}
