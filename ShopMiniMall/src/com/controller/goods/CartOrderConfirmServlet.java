package com.controller.goods;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.CartDTO;
import com.dto.MemberDTO;
import com.service.CartService;
import com.service.MemberService;

@WebServlet("/CartOrderConfirmServlet")
public class CartOrderConfirmServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO)session.getAttribute("login");
		
		String nextPage = null;
		if(member!=null) {
			String num = request.getParameter("num");
			CartService service = new CartService();
			MemberService service2 = new MemberService();
			CartDTO dto = service.cartByNum(num);
			MemberDTO dto2 = service2.mypage(dto.getUserid());
			
			request.setAttribute("cDTO", dto);
			request.setAttribute("mDTO", dto2);
			
			nextPage = "orderConfirm.jsp";
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
