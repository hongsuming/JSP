package com.controller.member;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.MemberDTO;
import com.service.MemberService;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("userid");
		String pw = request.getParameter("passwd");

		HashMap<String, String> map = new HashMap<String, String>();
		map.put("userid", id);
		map.put("passwd", pw);
		
		MemberService service = new MemberService();
		MemberDTO dto = service.login(map);
		
		String nextPage = null;
		if(dto!=null) {
			nextPage = "Main";
			HttpSession session = request.getSession();
			session.setAttribute("login", dto);
			session.setMaxInactiveInterval(60*60); // 1시간 지정
		} else {
			nextPage = "LoginUIServlet";
		}
		
		response.sendRedirect(nextPage);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
