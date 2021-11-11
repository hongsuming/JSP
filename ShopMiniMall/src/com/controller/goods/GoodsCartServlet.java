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

@WebServlet("/GoodsCartServlet")
public class GoodsCartServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String gCode = request.getParameter("gCode");
		String gName = request.getParameter("gName");
		int gPrice = Integer.parseInt(request.getParameter("gPrice"));
		String gSize = request.getParameter("gSize");
		String gColor = request.getParameter("gColor");
		int gAmount = Integer.parseInt(request.getParameter("gAmount"));
		String gImage = request.getParameter("gImage");
		
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO)session.getAttribute("login"); // LoginServlet에서 로그인 완료 후 꽂아둔 session
		if(member!=null) { // 회원인 경우
			CartDTO cart = new CartDTO();
			cart.setUserid(member.getUserid());
			cart.setgCode(gCode);
			cart.setgName(gName);
			cart.setgPrice(gPrice);
			cart.setgSize(gSize);
			cart.setgColor(gColor);
			cart.setgAmount(gAmount);
			cart.setgImage(gImage);

			CartService service = new CartService();
			int n = service.cartAdd(cart);
			System.out.println(n+"개 행이 삽입되었습니다.");
			
			session.setAttribute("msg", gName+"을(를) 장바구니에 저장하였습니다.");
			response.sendRedirect("GoodsRetrieveServlet?gCode="+gCode);
		} else { // 회원이 아닌 경우
			session.setAttribute("msg", "로그인 후 이용하시기 바랍니다.");
			response.sendRedirect("LoginUIServlet");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
