<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%
int iceCreamNumber = Integer.parseInt(request.getParameter("iceCreamNumber"));

Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;

try {
	String jdbcUrl = "jdbc:mysql://localhost:3306/Project_Baskin_mysql?serverTimezone=UTC&useSSL=false";
	String dbId = "root";
	String dbPw = "root";
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	con = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
	
	String sql = "delete from product where product_number = ?";
	ps = con.prepareStatement(sql);
	ps.setInt(1, iceCreamNumber+1);
	ps.executeUpdate();
	
	response.sendRedirect("01_adminItemList.jsp");
	
} catch(Exception e) {
	e.printStackTrace();
} finally {
	if(con != null) con.close();
	if(ps != null) ps.close();
	if(rs != null) rs.close();
}




%>