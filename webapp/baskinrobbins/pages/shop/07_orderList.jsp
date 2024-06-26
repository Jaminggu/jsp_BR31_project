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
<style>
	table, tr, td{
	border: 1px solid lightgray;
	border-collapse: collapse;
	}
	h1 {
	color:#f986bd;
	font-size: 40px;
	margin-bottom: 30px;
	}
	#content-itemList{
		margin: 0 auto;
	}
	#title{
		text-align: center;
	}
	td {
	padding: 10px;
	text-align: center;
	}
</style>

</head>
<body>
<%
String log = (String)session.getAttribute("log");

Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;

%>
<%
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
	String jdbcUrl = "jdbc:mysql://localhost:3306/Project_Baskin_mysql?serverTimezone=UTC&useSSL=false";
	String dbId = "root";
	String dbPw = "root";
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	con = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
	
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
	
} catch(Exception e) {
	e.printStackTrace();
} finally {
	if(con != null) con.close();
	if(ps != null) ps.close();
	if(rs != null) rs.close();
}
%>

<%
int[] iceCreamMenuNumberList = new int[1000];
int[] iceCreamMenuSelectSizeList = new int[1000];
int[] iceCreamMenuPriceList = new int[1000];

int menuSize = 0;

try {
	String jdbcUrl = "jdbc:mysql://localhost:3306/Project_Baskin_mysql?serverTimezone=UTC&useSSL=false";
	String dbId = "root";
	String dbPw = "root";
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	con = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
	
	String sql = "select * from productMenu";
	ps = con.prepareStatement(sql);
	rs = ps.executeQuery();
	
	while(rs.next()) {
		iceCreamMenuNumberList[menuSize] = rs.getInt(1) - 1;
		iceCreamMenuSelectSizeList[menuSize] = rs.getInt(2);
		iceCreamMenuPriceList[menuSize] = rs.getInt(3);
				
		menuSize += 1;
	}
	
} catch(Exception e) {
	e.printStackTrace();
} finally {
	if(con != null) con.close();
	if(ps != null) ps.close();
	if(rs != null) rs.close();
}

%>

<%
int orderSize = 0;
int[] orderNumberList = new int[1000];
int[] orderDeliveryNumberList = new int[1000];
int[] orderIceCreamNumberList = new int[1000];
int[] orderSelectSizeList = new int[1000];
int[] orderBuyCountList = new int[1000];
String[] orderBuyerList = new String[1000];

try {
	String jdbcUrl = "jdbc:mysql://localhost:3306/project_baskin_mysql?serverTimezone=UTC&useSSL=false";
	String dbId = "root";
	String dbPw = "root";
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	con = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
	
	String sql = "select * from ordermenu";
	ps = con.prepareStatement(sql);
	rs = ps.executeQuery();
	
	while(rs.next()) {
		orderNumberList[orderSize] = rs.getInt(1) - 1;
		orderDeliveryNumberList[orderSize] = rs.getInt(2);
		orderIceCreamNumberList[orderSize] = rs.getInt(3);
		orderSelectSizeList[orderSize] = rs.getInt(4);
		orderBuyCountList[orderSize] = rs.getInt(5);
		orderBuyerList[orderSize] = rs.getString(6);
		
		orderSize += 1;
	}
	
	
} catch(Exception e) {
	e.printStackTrace();
} finally {
	if(con != null) con.close();
	if(ps != null) ps.close();
	if(rs != null) rs.close();
}

%>

<%
String[] viewIceCreamNameList = new String[1000];
int[] viewSelectSizeList = new int[1000];
int[] viewIceCreamBuyCountList = new int[1000];
int[] viewIceCreamBuyPriceList = new int[1000];
String[] viewIceCreamImageList = new String[1000];
int[] viewOrderDeliveryNumberList = new int[1000];
int viewCount = 0;

for(int i=0; i<orderSize; i++){
	if(orderBuyerList[i].equals(log)){
		viewIceCreamBuyCountList[viewCount] = orderBuyCountList[i];
		viewSelectSizeList[viewCount] = orderSelectSizeList[i];
		viewOrderDeliveryNumberList[viewCount] = orderDeliveryNumberList[i];
		
		for(int j=0; j<iceCreamSize; j++){
			if(orderIceCreamNumberList[i] == iceCreamNumberList[j]){
				viewIceCreamNameList[viewCount] = iceCreamNameList[j];
				viewIceCreamImageList[viewCount] = iceCreamImageList[j];
				
				for(int k=0; k<menuSize; k++) {
					if(orderSelectSizeList[i] == iceCreamMenuSelectSizeList[k]) {
						int buyPrice = iceCreamMenuPriceList[k] * viewIceCreamBuyCountList[viewCount];
						viewIceCreamBuyPriceList[viewCount] = buyPrice;
						
						viewCount += 1;
					}
				}
				
			}
		}
	}
}

%>
<jsp:include page="../../partials/header.jsp"></jsp:include>
<br><br><br><br><br><br>

<div align="center">
<h1>주문 목록</h1>
<%int lineCount = 0; %>
<%if(viewCount == 0){%>
<h1>주문 정보가 없습니다. </h1>
<%} else{ %>
<table id="content-orderList">
<%for(int i=0; i<viewCount; i++){ %>
<%if(lineCount != viewOrderDeliveryNumberList[i]){ 
lineCount = viewOrderDeliveryNumberList[i];%>
<%} %>
<tr>
<td><%=i+1 %></td>
<td><img src="<%=viewIceCreamImageList[i]%>" width="200px"></td>
<td><%=viewIceCreamNameList[i] %></td>
<td><%=viewIceCreamBuyCountList[i] %>개</td>
<td><%=viewIceCreamBuyPriceList[i] %>원</td>
</tr>
<%} %>
</table>
<%} %>
</div>
<br><br><br><br><br><br><br>
<jsp:include page="../../partials/footer.jsp"></jsp:include> 



</body>
</html>