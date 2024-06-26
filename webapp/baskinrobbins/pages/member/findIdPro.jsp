<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	System.out.println(name +" " + email);
	%>
	
	<%
	Connection conn = null;	
	PreparedStatement pstmt = null;	
	ResultSet rs = null;
	
	String check = "none";
	String member_id = null;
	
	try{
		String jdbcUrl = "jdbc:mysql://localhost:3306/Project_Baskin_mysql?serverTimezone=UTC&useSSL=false";
		String dbId = "root";
		String dbPw = "root";
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
		
		String sql = "SELECT member_id FROM member WHERE member_name = ? AND member_email = ?";
		pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, name);
		pstmt.setString(2, email);
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			
			member_id = rs.getString(1);
			check = member_id;
			System.out.println(check);
		}
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(conn != null){ conn.close();	}
		if(pstmt != null){ pstmt.close(); }
		if(rs != null){ rs.close();	}
	}	
	
	%>

<p id="check"><%= check %>



 