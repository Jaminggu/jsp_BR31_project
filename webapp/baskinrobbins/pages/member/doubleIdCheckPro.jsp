<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%
		String id = request.getParameter("id");
	%>  

	<%
		Connection conn = null;	
		PreparedStatement pstmt = null;	
		ResultSet rs = null;
		
		int check = 1;
		
		try{
			String jdbcUrl = "jdbc:mysql://localhost:3306/jsp_07_poject_mysql?serverTimezone=UTC&useSSL=false";
			String dbId = "root";
			String dbPw = "root";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
			
			String sql = "SELECT * FROM member WHERE member_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				check = -1;
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