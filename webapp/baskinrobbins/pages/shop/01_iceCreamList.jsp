<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../layout/common.css" type="text/css">
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<style>
	table, tr, td{
	border: none;
	}
	#content-itemList{
		margin: 0 auto;
	}
	#title{
		text-align: center;
	}
	a {
	text-decoration: none;
	color: black;
	}
	.title {
	font-size: 90px;
	}
	.subtitle {
	margin-top: 30px;
	margin-bottom: 50px;
	font-size: 20px;
	}
</style>
</head>
<body>
<%
Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;

int[] iceCreamNumberList = new int[1000];
String[] iceCreamNameList = new String[1000];
int[] iceCreamPriceList = new int[1000];
int[] iceCreamStockList = new int[1000];
int[] iceCreamSoldList = new int[1000];
String[] iceCreamImageList = new String[1000];
String[] iceCreamContentImage1List = new String[1000];
String[] iceCreamContentImage2List = new String[1000];
String[] iceCreamContentImage3List = new String[1000];
int[] iceCreamInfoList1 = new int[1000];
int[] iceCreamInfoList2 = new int[1000];
int[] iceCreamInfoList3 = new int[1000];
int[] iceCreamInfoList4 = new int[1000];
int[] iceCreamInfoList5 = new int[1000];
int[] iceCreamInfoList6 = new int[1000];
String[] iceCreamInfoList7 = new String[1000];
String[] iceCreamRegDateList = new String[1000];

int iceCreamSize = 0;

try {
	String jdbcUrl = "jdbc:mysql://localhost:3306/project_baskin_mysql?serverTimezone=UTC&useSSL=false";
	String dbId = "root";
	String dbPw = "root";
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	con = DriverManager.getConnection(jdbcUrl,dbId,dbPw);
	
	String sql = "select * from product";
	ps = con.prepareStatement(sql);	
	rs = ps.executeQuery();
	
	while(rs.next()) {
		iceCreamNumberList[iceCreamSize] = rs.getInt(1) - 1;
		iceCreamNameList[iceCreamSize] = rs.getString(2);
		iceCreamStockList[iceCreamSize] = rs.getInt(3);
		iceCreamSoldList[iceCreamSize] = rs.getInt(4);
		iceCreamRegDateList[iceCreamSize] = rs.getString(5);
		
		iceCreamInfoList1[iceCreamSize] = rs.getInt(6);
		iceCreamInfoList2[iceCreamSize] = rs.getInt(7);
		iceCreamInfoList3[iceCreamSize] = rs.getInt(8);
		iceCreamInfoList4[iceCreamSize] = rs.getInt(9);
		iceCreamInfoList5[iceCreamSize] = rs.getInt(10);
		iceCreamInfoList6[iceCreamSize] = rs.getInt(11);
		iceCreamInfoList7[iceCreamSize] = rs.getString(12);
		
		iceCreamImageList[iceCreamSize] = rs.getString(13);
		iceCreamContentImage1List[iceCreamSize] = rs.getString(14);
		iceCreamContentImage2List[iceCreamSize] = rs.getString(15);
		iceCreamContentImage3List[iceCreamSize] = rs.getString(16);
		
		iceCreamSize += 1;
	}
	
}catch(Exception e){
	e.printStackTrace();
}finally {
	if(con != null) con.close();
	if(ps != null) ps.close();
	if(rs != null) rs.close();
}


%>

<jsp:include page="../../partials/header.jsp"></jsp:include>
<br><br><br><br><br>

<div align="center">
<h1 style="color:#F361A6" class="title">Ice Cream</h1>
<h4 style="color:#F361A6" class="subtitle">한 입에 물면 달콤하게 사르르 녹는 아이스크림.<br>
당신이 어떤 기분이든 그 아이스크림을 따라 당신의 기분은 아마 달콤해졌을 거예요.</h4>
<table id="content-itemList">
<%int index = 0; %>
<%while(index < iceCreamSize){ %> 
<tr align="center">
<%for(int i=0; i<4; i++){ %>
<%if(index + i >= iceCreamSize) break; %>
<td align="center">
<%if(iceCreamStockList[index+i] > 0) { %>
<a href="02_iceCreamInfo.jsp?iceCreamNumber=<%=iceCreamNumberList[index+i]%>"><img src="<%=iceCreamImageList[index+i]%>" width="300px"></a>
<%}else{ %>
<img src="<%=iceCreamImageList[index+i]%>" width="300px" style="border: 1px solid lightgray; opacity: 20%"> 
<%} %>
</td>
<%} %>
</tr>
<tr align="center">
<%for(int i=0; i<4; i++){ %>
<td>
<%if(iceCreamStockList[index+i] > 0) {%>
<a href="02_iceCreamInfo.jsp? <%=iceCreamNumberList[index+i]%>"><%=iceCreamNameList[index+i] %></a> 
<%}else{ %>
<%=iceCreamNameList[index+i] %>
<%} %>
</td>
<%} %>
</tr>
<tr align="center">
<%for(int i=0; i<4; i++){ %>
<%if(index + i >= iceCreamSize) break; %> 
<%if(iceCreamStockList[index+i] <= 0){ %>
<td style="color:gray"><p>품절</p></td>
<%}else{ %>
<td style="color:gray"><p>주문가능</p></td>
<%} %>
<%} %>
</tr>
<%index += 4; %>
<%} %>
</table>
</div>
<br><br><br><br><br><br>
  <jsp:include page="../../partials/footer.jsp"></jsp:include>


</body>
</html>