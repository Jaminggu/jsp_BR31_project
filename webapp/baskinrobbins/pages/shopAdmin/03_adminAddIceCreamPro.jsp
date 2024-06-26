<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;

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
	
	String sql = "insert into product(product_number, product_name, product_stock, product_regdate, product_info1, product_info2, product_info3, product_info4, product_info5, product_info6, product_info7) ";
	sql += "values(0, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	
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
	
	ps.executeUpdate();
	
} catch(Exception e) {
	e.printStackTrace();
} finally {
	
}

%>