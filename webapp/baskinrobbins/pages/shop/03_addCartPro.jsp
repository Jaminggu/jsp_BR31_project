<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String log = request.getParameter("log");
int iceCreamNumber = Integer.parseInt(request.getParameter("iceCreamNumber"));
int selectSize = Integer.parseInt(request.getParameter("selectSize"));
int buyCount = Integer.parseInt(request.getParameter("buyCount"));
%>

<%
int check = 0;

Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;

int iceCreamNumberList = 0;
String iceCreamNameList = "";
int iceCreamPriceList = 0;
int iceCreamStockList = 0;
int iceCreamSoldList = 0;
String iceCreamImageList = "";
String iceCreamContentImage1List = "";
String iceCreamContentImage2List = "";
String iceCreamContentImage3List = "";
int iceCreamInfoList1 = 0;
int iceCreamInfoList2 = 0;
int iceCreamInfoList3 = 0;
int iceCreamInfoList4 = 0;
int iceCreamInfoList5 = 0;
int iceCreamInfoList6 = 0;
String iceCreamInfoList7 = "";
String iceCreamRegDateList = "";

try {
	String jdbcUrl = "jdbc:mysql://localhost:3306/project_baskin_mysql?serverTimezone=UTC&useSSL=false";
	String dbId = "root";
	String dbPw = "root";
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	con = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
	
	String sql = "select * from product where product_number = ?";
	ps = con.prepareStatement(sql);
	ps.setInt(1, iceCreamNumber+1);
	rs = ps.executeQuery();
	
	if(rs.next()) {
		iceCreamNumberList = rs.getInt(1) - 1;
		iceCreamNameList = rs.getString(2);
		iceCreamStockList = rs.getInt(3);
		iceCreamSoldList = rs.getInt(4);
		iceCreamRegDateList = rs.getString(5);
		
		iceCreamInfoList1 = rs.getInt(6);
		iceCreamInfoList2 = rs.getInt(7);
		iceCreamInfoList3 = rs.getInt(8);
		iceCreamInfoList4 = rs.getInt(9);
		iceCreamInfoList5 = rs.getInt(10);
		iceCreamInfoList6 = rs.getInt(11);
		iceCreamInfoList7 = rs.getString(12);
		
		iceCreamImageList = rs.getString(13);
		iceCreamContentImage1List = rs.getString(14);
		iceCreamContentImage2List = rs.getString(15);
		iceCreamContentImage3List = rs.getString(16);
	}
	
} catch(Exception e) {
	e.printStackTrace();
} finally {
	if(con != null) con.close();
	if(ps !=  null) ps.close();
	if(rs != null) rs.close();
}

check = iceCreamStockList;
if(buyCount <= iceCreamStockList) {
	check = -1;
	
	try{
		String jdbcUrl = "jdbc:mysql://localhost:3306/project_baskin_mysql?serverTimezone=UTC&useSSL=false";
		String dbId = "root";
		String dbPw = "root";
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
		
		String sql = "insert into cart values(0, ?, ?, ?, ?)";
		ps = con.prepareStatement(sql);
		ps.setString(1, log);
		ps.setInt(2, selectSize);
		ps.setInt(3, buyCount);
		ps.setInt(4, iceCreamNumber);
		ps.executeUpdate();
		
	} catch(Exception e){
		e.printStackTrace();
	} finally {
		if(con != null) con.close();
		if(ps != null) ps.close();
		if(rs != null) rs.close();
	}
}
%>
<p id="check"><%=check %>


