package com.config;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MySqlSessionFactory {// DAO에서 사용할 connection과 같은 SqlSession 객체 생성
	//Configuration.xml을 이용해서 SqlSessionFactory 이용  SqlSession 객체 생성하고 리턴 시켜주는 클래스 
	static SqlSessionFactory sqlSessionFactory= null;
	static {//초기화
		String resource = "com/config/Configuration.xml";   //Configuration.xml의 경로와 파일이름 지정
		//경로와 파일 이름 변경시 15라인 수정
		InputStream inputStream= null;
		try {
			inputStream = Resources.getResourceAsStream(resource);
			//IOException  발생 : 파일 경로, 이름이 잘 못 된경우 
			System.out.println("CONFIGURATION.XML 읽기 성공");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		 //configuration.xml에 모든 정보가 설정완료 및 로딩이 되면 아래 문구 출력 
		 System.out.println("SqlSessionFactory 생성 성공");
	}//end static
	
	//SqlSession 반환
	public static SqlSession getSqlSession() {//dao, service사용할 함수 SqlSession반환
		SqlSession session = sqlSessionFactory.openSession();
		return session;   //Connection 대신 SqlSession 사용 
	}
	
}
