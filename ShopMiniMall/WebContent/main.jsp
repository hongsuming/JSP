<%@page import="com.dto.GoodsDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	String a = (String)session.getAttribute("memberAdd");

	if(a!=null){
%>
<script type="text/javascript">
	alert("<%=a%>");
</script>
<%
		session.removeAttribute("memberAdd");
	}
%>
</head>
<body>
<h1 align="center">Sumin's ShoppingMall</h1>
<jsp:include page="common/top.jsp" flush="true"/><br>
<jsp:include page="common/menu.jsp" flush="true"/>
<hr>
<jsp:include page="goods/goodsList.jsp" flush="true"/>
</body>
</html>