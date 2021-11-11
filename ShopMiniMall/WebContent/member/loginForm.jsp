<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String msg = (String)session.getAttribute("msg");
	if(msg!=null){
%>
<script type="text/javascript">
		alert("<%=msg%>");
</script>
<%
	session.removeAttribute("msg");
	}
%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function (){
		$("form").submit(function (event){
			var userid = $("#userid").val();
			var userpw = $("#passwd").val();
			if(userid.length==0){
				alert("아이디를 입력하세요.");
				$("#userid").focus();
				event.preventDefault();
			} else if(userpw.length==0){
				alert("비밀번호를 입력하세요.");
				$("#passwd").focus();
				event.preventDefault();
			}
		});
	});
</script>
<form action="LoginServlet" align="center">
	아이디 : <input type="text" name="userid" id="userid"><br>
	비밀번호 : <input type="password" name="passwd" id="passwd"><br>
	<input type="submit" value="로그인"> <input type="reset" value="취소">
	<a href="MemberIdSearchUIServlet">아이디 찾기</a><br>
</form>
