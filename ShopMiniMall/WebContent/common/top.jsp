<%@page import="com.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div align="right">
<%
	MemberDTO dto = (MemberDTO)session.getAttribute("login");
	if(dto!=null){
%>
<a href="Main"><img src="images/house.png" style="width:20px; heigth:20px"/></a>
안녕하세요. <%=dto.getUsername() %>님
<a href="LogoutServlet">로그아웃</a> 
<a href="MyPageServlet">mypage</a>
<a href="CartListServlet">장바구니</a>
<%
	} else{
%>
<a href="LoginUIServlet">로그인</a>
<a href="MemberUIServlet">회원가입</a>
<%
	}
%>
</div>

