<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
		request.setCharacterEncoding("utf-8");
		
		session.setAttribute("log", null);
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
	%>

	
    <%
		Connection conn = null;	
		PreparedStatement pstmt = null;	
		ResultSet rs = null;
		
		int check = -1;
		
		try{
			String jdbcUrl = "jdbc:mysql://localhost:3306/Project_Baskin_mysql?serverTimezone=UTC&useSSL=false";
			String dbId = "root";
			String dbPw = "root";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
			
			String sql = "SELECT * FROM admin WHERE admin_id = ? AND admin_pw = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				check = 1;
				System.out.println(check);
				session.setAttribute("log", id);
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



