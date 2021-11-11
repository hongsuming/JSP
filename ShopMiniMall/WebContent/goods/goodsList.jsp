<%@page import="com.dto.GoodsDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<table width="100%" cellspacing="0" cellpadding="0">
	<tr>
		<td>
			<table align="center" width="710" cellspacing="0" cellpadding="0" border="0">
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
 <%
	List<GoodsDTO> list = (List<GoodsDTO>) request.getAttribute("goodsList");
 	for(int i=1; i<=list.size(); i++){
 %>
					<td>
						<table style='padding:15px'>
							<tr>
								<td align="center">
									<a href="GoodsRetrieveServlet?gCode=<%=list.get(i-1).getgCode() %>">
										<img src="images/items/<%=list.get(i-1).getgImage() %>.gif" border="0" width="200">
									</a>
								</td>
							</tr>
							<tr>
								<td height="10">
								</td>
							</tr>
							<tr>
								<td class= "td_default" align ="center">
									<a class= "a_black" href="GoodsRetrieveServlet?gCode=<%=list.get(i-1).getgCode() %>"><%=list.get(i-1).getgName() %><br></a>
										<font color="gray">
										 --------------------
										</font>
								</td>	
							</tr>
							<tr>
								<td height="10">
								</td>
							</tr>
							<tr>
								<td class="td_gray" align ="center"><%=list.get(i-1).getgContent() %>
								</td>
							</tr>
							<tr>
								<td height="10">
							</tr>
							<tr>
								<td class="td_red" align ="center"><font color="red"><strong><%=list.get(i-1).getgPrice() %>
								</strong></font></td>
							</tr>
						</table>
					</td>
					<!-- 한줄에 4개씩 보여주기 -->	
				<%
					if(i%4==0){
				%>
				<tr>
					<td height="10">
				</tr>
				<%
					}//end if
				%>		
						
<%
    }//end for
%>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td height="10">
	</tr>
</table>
    