package com.controller.goods;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.MemberDTO;
import com.service.CartService;

@WebServlet("/CartUpdateServlet")
public class CartUpdateServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num"));
		int gAmount = Integer.parseInt(request.getParameter("gAmount"));
		
		HttpSession session = request.getSession();
		MemberDTO dto = (MemberDTO)session.getAttribute("login");
		
		if(dto!=null) {
			HashMap<String, Integer> map = new HashMap<String, Integer>();
			map.put("num", num);
			map.put("gAmount", gAmount);
			
			CartService service = new CartService();
			int n = service.cartUpdate(map);
			System.out.println(n+"개 행이 수정되었습니다.");
		} else {
			  session.setAttribute("msg", "로그인 후 이용해주세요.");
			  response.sendRedirect("LoginUIServlet");
		  }
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
