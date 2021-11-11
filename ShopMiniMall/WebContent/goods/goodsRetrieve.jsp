<%@page import="com.dto.GoodsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	GoodsDTO dto = (GoodsDTO) request.getAttribute("goodsRetrieve");	

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
	function reqCheck(a){
		var size = document.getElementById("gSize").value;
		var color = document.getElementById("gColor").value;
		if(size=="사이즈선택"){
			alert("사이즈를 선택해주세요.");
			event.preventDefault();
		}else if(color=="색상선택"){
			alert("색상을 선택해주세요.");
			event.preventDefault();
		}
		
		if(a=="cart"){
			$("form").attr("action", "GoodsCartServlet");
		} else if(a=="order"){
			$("form").attr("action", "");
		}
	}
	function upF(){
		var gAmount = document.getElementById("gAmount").value;
		document.getElementById("gAmount").value = parseInt(gAmount) + 1;
	}
	function downF(){
		var gAmount = document.getElementById("gAmount").value;
		if(gAmount>1){
			document.getElementById("gAmount").value = parseInt(gAmount) - 1;
		}
	}
</script>
<form name="goodRetrieveForm" method="GET" action="">
<input type="hidden" name="gCode" value="<%=dto.getgCode()%>"/>
<input type="hidden" name="gName" value="<%=dto.getgName()%>"/>
<input type="hidden" name="gPrice" value="<%=dto.getgPrice()%>"/>
<input type="hidden" name="gImage" value="<%=dto.getgImage() %>"/>
	<table width="100%" cellspacing="0" cellpadding="0" align="center">
		<tr>
			<td height="30">
		</tr>
		<tr>
			<td>
				<table align="center" width="710" cellspacing="0" cellpadding="0" border="0" style='margin-left: 30px'>
					<tr>
						<td class="td_default"><font size="5"><b>- 상품 정보 -</b></font>
							&nbsp;</td>
					</tr>
					<tr>
						<td height="5"></td>
					</tr>
					<tr>
						<td height="1" colspan="8" bgcolor="CECECE"></td>
					</tr>
					<tr>
						<td height="10"></td>
					</tr>

					<tr>
						<td align="center" rowspan="7"><img src="images/items/<%=dto.getgImage() %>.gif" border="0" width="300" /></td>
						<td class="td_title">제품코드</td>
						<td class="td_default" colspan="2" style='padding-left: 30px'><%=dto.getgCode() %></td>
					</tr>
					<tr>
						<td class="td_title">상품명</td>
						<td class="td_default" colspan="2" style='padding-left: 30px'><%=dto.getgName() %></td>
					</tr>
					<tr>
						<td class="td_title">가격</td>
						<td class="td_red" colspan="2" style='padding-left: 30px'><%=dto.getgPrice() %></td>
					</tr>
					<tr>
						<td class="td_title">배송비</td>
						<td colspan="2"><font color="#2e56a9" size="2"
							style='padding-left: 30px'><b> 무료배송</b> </font> <font size="2">(도서
								산간지역 별도 배송비 추가)</font></td>
					</tr>
					<tr>
						<td class="td_title" rowspan="2">상품옵션</td>
						<td colspan="2" style='padding-left: 30px'>
							<select class="select_change" size="1" name="gSize" id="gSize">
								<option selected value="사이즈선택">사이즈선택</option>
								<option value="L">L</option>
								<option value="M">M</option>
								<option value="S">S</option>
							</select>
						</td>
					</tr>
					<tr>
						<td colspan="2" style='padding-left: 30px'><select
							class="select_change" size="1" name="gColor" id="gColor">
								<option selected value="색상선택">색상선택</option>
								<option value="navy">navy</option>
								<option value="black">black</option>
								<option value="ivory">ivory</option>
								<option value="white">white</option>
								<option value="gray">gray</option>
						</select></td>
					</tr>

					<tr>
						<td class="td_title">주문수량</td>
						<td style="padding-left: 30px">
							<input type="text" name="gAmount" value="1" id="gAmount" style="text-align: right; height: 18px"> 
							<img src="images/up.PNG" id="up" onclick="upF()"> <img src="images/down.PNG" id="down" onclick="downF()">
						</td>
					</tr>
				</table>

			</td>
		</tr>
	</table>

	<br>
	<button onclick="reqCheck('order')">구매</button>
	&nbsp;&nbsp;
	<button onclick="reqCheck('cart')">장바구니</button>
</form>
