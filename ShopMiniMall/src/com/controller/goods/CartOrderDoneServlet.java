package com.controller.goods;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.MemberDTO;
import com.dto.OrderDTO;
import com.service.OrderService;

@WebServlet("/CartOrderDoneServlet")
public class CartOrderDoneServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO)session.getAttribute("login");
		
		String nextPage = "";
		if(member!=null) {
			String userid = member.getUserid();
			String gCode = request.getParameter("gCode");
			String gName = request.getParameter("gName");
			String gPrice = request.getParameter("gPrice");
			String gSize = request.getParameter("gSize");
			String gColor = request.getParameter("gColor");
			String gAmount = request.getParameter("gAmount");
			String gImage = request.getParameter("gImage");
			String orderName = request.getParameter("orderName");
			String post = request.getParameter("post");
			String addr1 = request.getParameter("addr1");
			String addr2 = request.getParameter("addr2");
			String phone = request.getParameter("phone");
			String payMethod = request.getParameter("payMethod");
			String num = request.getParameter("num");
			
			OrderDTO order = new OrderDTO();
			order.setUserid(userid);
			order.setgCode(gCode);
			order.setgName(gName);
			order.setgPrice(Integer.parseInt(gPrice));
			order.setgSize(gSize);
			order.setgColor(gColor);
			order.setgAmount(Integer.parseInt(gAmount));
			order.setgImage(gImage);
			order.setOrderName(orderName);
			order.setPost(post);
			order.setAddr1(addr1);
			order.setAddr2(addr2);
			order.setPhone(phone);
			order.setPayMethod(payMethod);
			
			
			System.out.println(order);
			System.out.println(num);
			
			OrderService service = new OrderService();
			int n = service.orderDone(order, num);
			System.out.println(n+"개 행이 삽입, 삭제되었습니다.");
			
			request.setAttribute("orderDTO", order);
			nextPage = "orderDone.jsp";
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
