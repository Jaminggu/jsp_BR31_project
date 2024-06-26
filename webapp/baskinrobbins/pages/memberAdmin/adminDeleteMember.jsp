<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
	int memberNumber = Integer.parseInt(request.getParameter("memberNumber"));


	
	String dbURL = "jdbc:mysql://localhost:3306/Project_Baskin_mysql?serverTimezone=UTC&useSSL=false";
	String dbId = "root";
	String dbPw = "root";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
		
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(dbURL, dbId, dbPw);
		
		String sql = "DELETE FROM member WHERE member_number=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, memberNumber);
		pstmt.executeUpdate();
			
		response.sendRedirect("adminMemberList.jsp");
		
	} catch(Exception e) {
		e.printStackTrace();
	} finally {
		conn.close();
		pstmt.close();
	}
	
%>