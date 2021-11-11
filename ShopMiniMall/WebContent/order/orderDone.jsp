<%@page import="com.dto.OrderDTO"%>
<%@page import="com.dto.MemberDTO"%>
<%@page import="com.dto.CartDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
<script>
$(document).ready(function(){
	
		
});
</script>
<%
	OrderDTO order = (OrderDTO)request.getAttribute("orderDTO");
%>
<table width="70%" cellspacing="0" cellpadding="0">

	<tr>
		<td height="30">
		</td>
	</tr>

	<tr>
		<td><b>주문완료</b>
		</td>
	</tr>

	<tr>
		<td height="30">
		</td>
	</tr>

	<tr>
		<td align="center"><b>주문해주셔서 감사합니다.</b>
		</td>
	</tr>

	<tr>
		<td height="7">
		</td>
	</tr>

	<tr>
		<td class="td_default" align="center"><b></b> 
			<%=order.getOrderName() %>님의 주문이 안전하게 처리되었습니다.
		</td>
	</tr>

	<tr>
		<td height="40">
		</td>
	</tr>

	<tr>
		<td class="td_default"><b>상품 및 배송정보</b>
		</td>
	</tr>

	<tr>
		<td height="15">
		</td>
	</tr>

	<tr>
		<td>
			<table width="100%" border="1" style="border-collapse: collapse" bordercolor="#CCCCCC">
				<tr>
					<td class="td_default" width="150" height="35"> 
						받으시는 분
					</td>
					<td class="td_default" height="35">
						<%=order.getOrderName() %>
					</td>
				</tr>
				<tr>
					<td class="td_default" height="35"> 
						주소
					</td>
					<td class="td_default" height="35"> (<%=order.getPost() %>)<br>
						<%=order.getAddr1()+ order.getAddr2() %>
					</td>
				</tr>
				
				<tr>
					<td class="td_default" height="35"> 
						휴대전화
					</td>
					<td class="td_default" height="35"> 
						<%=order.getPhone() %>
					</td>
				</tr>
			</table>
		</td>
	</tr>

	<tr>
		<td height="20">
		</td>
	</tr>

	<tr>
		<td>
			<table width="100%" border="1" style="border-collapse: collapse" bordercolor="#CCCCCC">
				<tr>
					<td width="250" class="td_default" height="35" align="center">
						<strong>상품명</strong>
					</td>
					<td width="100" class="td_default" height="35" align="center">
						<strong>판매가</strong>
					</td>
					<td class="td_default" width="50" height="35" align="center">
						<strong>수량</strong>
					</td>
					<td class="td_default" width="100" height="35" align="center">
						<strong>합계</strong>
					</td>
				</tr>

				
				
				<tr>
					<td height="35" class="td_default">
						<span class="a_default"><%=order.getgName() %></span>
					</td>
					<td height="35" class="td_default" align="center">
						<span id = "price1"><%=order.getgPrice() %></span>원
					</td>
					<td height="35" class="td_default" align="center">
						<span id = "num1"><%=order.getgAmount() %></span>권
					</td>
					<td height="35" class="td_default" align="center">
						<span><%=order.getgPrice()*order.getgAmount() %></span>원
					</td>
				</tr>
			</table>
		</td>
	</tr>

	<tr>
		<td height="40">
		</td>
	</tr>

	<tr>
		<td class="td_default"><b>결제정보</b>
		</td>
	</tr>

	<tr>
		<td height="15">
		</td>
	</tr>

	<tr>
		<td>
			<table width="100%" border="1" style="border-collapse: collapse" bordercolor="#CCCCCC">
				<tr>
					<td class="td_default" width="150" height="35"> 
						결제금액
					</td>
					<td class="td_default" height="35" align = 'right'> 
						<input type='text' id='total' value='<%=order.getgPrice()*order.getgAmount() %>' readonly>원
					</td>
				</tr>
				<tr>
					<td class="td_default" width="150" height="35"> 
						결제수단
					</td>
					<td class="td_default" height="35" align = 'right'> 
						<span><%=order.getPayMethod() %></span>
					</td>
				</tr>
			</table>
		</td>
	</tr>

	<tr>
		<td height="40">
		</td>
	</tr>

	

	<tr>
		<td height="40">
		</td>
	</tr>

	<tr>
		<!-- <td class="td_default" align="center"><a class="a_default"
			href="OrderListDetailServlet?mem_id=guest">주문조회 페이지로 이동</a></td> -->
		<td class="td_default" align="center">
			<a class="a_default" href="">주문조회 페이지로 이동</a>
		</td>
	</tr>

	<tr>
		<td height="30">
		</td>
	</tr>

</table>
