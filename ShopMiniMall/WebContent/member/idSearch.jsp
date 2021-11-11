<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String msg = (String) request.getAttribute("msg");
	if(msg!=null){
%> 
<script>
	alert('<%=msg%>');
</script>
<%
	}
%>
<script type="text/javascript">

</script>
<form action="MemberIdSearchServlet" method="get" align="center">
  이름<input type="text" name="username"><br>
 휴대폰<select name="phone1">
       <option value="011">011</option>
       <option value="010">010</option>
     </select>-
      <input type="text" name="phone2" maxlength="4">-
      <input type="text" name="phone3" maxlength="4"><br>
이메일<input type="text"  name="email1">@
     <input type="text"  name="email2" id="email2" placeholder="직접 입력">
   <input type="submit" value="메일 보내기">  
</form>

