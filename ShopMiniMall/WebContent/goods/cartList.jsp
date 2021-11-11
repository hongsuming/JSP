<%@page import="com.dto.CartDTO"%>
<%@page import="com.dto.GoodsDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function (){
		$(".delBtn").click(function (){
			var num = $(this).attr("delNum");
			location.href="CartDelServlet?num="+num;
		});
		
		$(".up").click(function (){
			var num = $(this).attr("updUP");
			var gAmount = $("#updAmount"+num).val();
			$("#updAmount"+num).val(parseInt(gAmount)+1);
		});
		
		$(".down").click(function (){
			var num = $(this).attr("updDOWN");
			var gAmount = $("#updAmount"+num).val();
			if(gAmount>1){
				$("#updAmount"+num).val(parseInt(gAmount)-1);
			}
		});
		
		$(".updBtn").click(function (){
			var num = $(this).attr("updNum");
			var gAmount = $("#updAmount"+num).val();
			var gPrice = $(this).attr("updPrice");

			$.ajax({
				type : "GET",
				url : "CartUpdateServlet",
				dataType : "text",
				data : {
					num:num,
					gAmount:gAmount
				},
				success : function(responseData, status, xhr) {
					var sum = gAmount*gPrice;
				    $("#sum"+num).text(sum);
				},
				error : function(xhr, status, error) {
					console.log("error");
				}
			});
		});
		
		$("#allCheck").click(function (){
			var result = this.checked;
			$(".check").each(function (idx, data){
				this.checked = result;
			});
		});
		
		
/*  		$("#CartDelAll").click(function (){
			var num = [];
			$("input:checkbox[name='check']:checked").each(function (idx, ele){
				num.push($(this).val());
			});
			console.log(num);
		});  */
 		
  		$("#CartDelAll").click(function (){
			var num = [];
			$(".check:checked").each(function (idx, ele){
				num.push($(this).val());
			});
			location.href="CartDelAllServlet?data="+num;
		});  
		
 		$("#CartDelAll2").click(function (){
			$("form").attr("action", "CartDelAllServlet2");
			$("form").submit();
		}); 
 		
 		// 주문번호
 		$(".orderBtn").click(function (){
			var num = $(this).attr("data-num");
			location.href="CartOrderConfirmServlet?num="+num;
 		});

	});
</script>

<table width="70%" cellspacing="0" cellpadding="0" border="0" align="center">

	<tr>
		<td height="30">
	</tr>

	<tr>
		<td colspan="10" class="td_default" align="center">&nbsp;&nbsp;&nbsp; 
			<font size="5"><b>cart</b></font> &nbsp;
		</td>
	</tr>

	<tr>
		<td height="15">
	</tr>

	<tr>
		<td colspan="10">
			<hr size="1" color="CCCCCC">
		</td>
	</tr>

	<tr>
		<td height="7">
	</tr>

	<tr>
		<td class="td_default" align="center" width="100">
			<input type="checkbox" name="allCheck" id="allCheck"> 
			<strong>전체선택</strong>
		</td>
		<td class="td_default" align="center">
			<strong>주문번호</strong>
		</td>
		<td class="td_default" align="center" colspan="2">
			<strong>상품정보</strong>
		</td>
		<td class="td_default" align="center">
			<strong>판매가</strong>
		</td>
		<td class="td_default" align="center" colspan="2">
			<strong>수량</strong>
		</td>
		<td class="td_default" align="center">
			<strong>합계</strong>
		</td>
		<td>
		</td>
	</tr>
	<tr>
		<td height="7">
	</tr>
	<tr>
		<td colspan="10">
			<hr size="1" color="CCCCCC">
		</td>
	</tr>


<form name="myForm">	    
<%
	List<CartDTO> list = (List<CartDTO>) request.getAttribute("cartList");  
	for(CartDTO dto : list){
%>	  
	<!-- hidden부분 설정부분 	  
	<input type="text" name="num81" value="81" id="num81">
	<input type="text" name="gImage81" value="bottom1" id="gImage81">
	<input type="text" name="gName81" value="제나 레이스 스커트" id="gName81">
	<input type="text" name="gSize81" value="L" id="gSize81">
	<input type="text" name="gColor81" value="navy" id="gColor81"> 
	<input type="text" name="gPrice81" value="9800" id="gPrice81"> -->

	<tr>
		<td class="td_default" width="80">
		<!-- checkbox는 체크된 값만 서블릿으로 넘어간다. 따라서 value에 삭제할 num값을 설정한다. -->
			<input type="checkbox" name="check" class="check" id="check<%=dto.getNum() %>" value="<%=dto.getNum()%>">
		</td>
		<td class="td_default" width="100" align="center"><%=dto.getNum() %>
		</td>
		<td class="td_default" width="80" align="center"><img src="images/items/<%=dto.getgImage() %>.gif" border="0" width="80" />
		</td>
		<td class="td_default" width="300" style='padding-left: 30px'><%=dto.getgName() %><br> 
			<font size="2" color="#665b5f">[옵션 : 사이즈(<%=dto.getgSize() %>), 색상(<%=dto.getgColor() %>)]</font>
		</td>
		<td align="center" width="110"><%=dto.getgPrice() %>
		</td>
		<td class="td_default" align="center" width="300" colspan="2">
			<img src="images/up.PNG" class="up" updUP="<%=dto.getNum() %>">
			<input id="updAmount<%=dto.getNum() %>" type="text" name="cartAmount" style="text-align: right" maxlength="3"size="2" value="<%=dto.getgAmount()%>"/>
			<img src="images/down.PNG" class="down" updDOWN="<%=dto.getNum() %>">
			<input type="button" value="수정" class="updBtn" updNum="<%=dto.getNum()%>" updPrice="<%=dto.getgPrice()%>"/>
		</td>
		<td class="td_default" align="center" width="80" style='padding-left: 5px'>
			<span id="sum<%=dto.getNum()%>"><%=dto.getgPrice()*dto.getgAmount() %></span>
		</td>
		<td>
			<input type="button" value="주문" class="orderBtn" data-num="<%=dto.getNum()%>">
		</td>
		<td class="td_default" align="center" width="30" style='padding-left: 10px'>
			<input type="button" value="삭제" class="delBtn" delNum="<%=dto.getNum() %>">
		</td>
		<td height="10">
		</td>
	</tr>

<%
	}
%>

</form>
	<tr>
		<td colspan="10">
			<hr size="1" color="CCCCCC">
		</td>
	</tr>
	<tr>
		<td height="30">
	</tr>

	<tr>
		<td align="right" colspan="10">
			<a class="a_black" href="#"> 전체 주문하기 </a>&nbsp;&nbsp;&nbsp;&nbsp; 
			<a class="a_black" id="CartDelAll" href="#"> 선택 항목 삭제하기 </a>&nbsp;&nbsp;&nbsp;&nbsp;
			<a class="a_black" id="CartDelAll2" href="#"> 선택 항목 삭제하기2 </a>&nbsp;&nbsp;&nbsp;&nbsp;
			<a class="a_black" href="GoodsListServlet"> 계속 쇼핑하기 </a>&nbsp;&nbsp;&nbsp;&nbsp;
		</td>
	</tr>
	<tr>
		<td height="20">
	</tr>

</table>
    