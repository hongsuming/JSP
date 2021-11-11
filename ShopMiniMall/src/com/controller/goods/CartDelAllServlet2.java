package com.controller.goods;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.MemberDTO;
import com.service.CartService;

@WebServlet("/CartDelAllServlet2")
public class CartDelAllServlet2 extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberDTO dto  = (MemberDTO)session.getAttribute("login");
		
		String nextPage = null;
		if(dto!=null) {
			String check[] = request.getParameterValues("check");
			List<String> list = Arrays.asList(check);
			CartService service = new CartService();
			int n = service.cartAllDel(list);
			System.out.println(n+"개 행이 삭제되었습니다.");
			
			nextPage = "CartListServlet";
		} else {
			session.setAttribute("msg", "로그인 후 이용해주세요.");
			nextPage = "LoginUIServlet";
		}
		RequestDispatcher dis = request.getRequestDispatcher(nextPage);
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
