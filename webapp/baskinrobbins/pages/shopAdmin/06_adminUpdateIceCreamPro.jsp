<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%
Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;

int iceCreamNumber = Integer.parseInt(request.getParameter("iceCreamNumber"));

String iceCreamName = request.getParameter("iceCreamName");
int iceCreamStock = Integer.parseInt(request.getParameter("iceCreamStock"));
String iceCreamRegDate = request.getParameter("iceCreamRegDate");
int iceCreamPortionSize = Integer.parseInt(request.getParameter("iceCreamPortionSize"));
int iceCreamCalory = Integer.parseInt(request.getParameter("iceCreamCalory"));
int iceCreamSugar = Integer.parseInt(request.getParameter("iceCreamSugar"));
int iceCreamProtein = Integer.parseInt(request.getParameter("iceCreamProtein"));
int iceCreamFat = Integer.parseInt(request.getParameter("iceCreamFat"));
int iceCreamNatrium = Integer.parseInt(request.getParameter("iceCreamNatrium"));
String iceCreamAllergy = request.getParameter("iceCreamAllergy");

try {
	String jdbcUrl = "jdbc:mysql://localhost:3306/Project_Baskin_mysql?serverTimezone=UTC&useSSL=false";
	String dbId = "root";
	String dbPw = "root";
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	con = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
	
	String sql = "update product set ";
	sql += "product_name = ? , ";
	sql += "product_stock = ? , ";
	sql += "product_regdate = ? , ";
	sql += "product_info1 = ? , ";
	sql += "product_info2 = ? , ";
	sql += "product_info3 = ? , ";
	sql += "product_info4 = ? , ";
	sql += "product_info5 = ? , ";
	sql += "product_info6 = ? , ";
	sql += "product_info7 = ? ";
	sql += "where product_number = ?";
	
	ps = con.prepareStatement(sql);
	
	ps.setString(1, iceCreamName);
	ps.setInt(2, iceCreamStock);
	ps.setString(3, iceCreamRegDate);
	ps.setInt(4, iceCreamPortionSize);
	ps.setInt(5, iceCreamCalory);
	ps.setInt(6, iceCreamSugar);
	ps.setInt(7, iceCreamProtein);
	ps.setInt(8, iceCreamFat);
	ps.setInt(9, iceCreamNatrium);
	ps.setString(10, iceCreamAllergy);
	ps.setInt(11, iceCreamNumber+1);
	
	ps.executeUpdate();
	
} catch(Exception e) {
	e.printStackTrace();
} finally {
	if(con != null) con.close();
	if(ps != null) ps.close();
	if(rs != null) rs.close();
}



%>