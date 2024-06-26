<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%
		request.setCharacterEncoding("UTF-8");
	%>    

	<%
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String addr1 = request.getParameter("addr1");
		String addr2 = request.getParameter("addr2");
		String addr3 = request.getParameter("addr3");
		String gender = request.getParameter("gender");
		String marketing = request.getParameter("marketing");
		
		System.out.println("id = " + id);
		System.out.println("pw = " + pw);
		System.out.println("name = " + name);
		System.out.println("email = " + email);
		System.out.println("addr1 = " + addr1);
		System.out.println("addr2 = " + addr2);
		System.out.println("addr3 = " + addr3);
		System.out.println("gender = " + gender);
		System.out.println("marketing = " + marketing);
	%>

	<%
		Connection conn = null;	
		PreparedStatement pstmt = null;	
		ResultSet rs = null;
		
		
		try{
			String jdbcUrl = "jdbc:mysql://localhost:3306/Project_Baskin_mysql?serverTimezone=UTC&useSSL=false";
			String dbId = "root";
			String dbPw = "root";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
			
			String sql = " INSERT INTO member (member_id, member_pw, member_name, member_email, member_phone, member_addr1, member_addr2, member_addr3, member_gender, member_marketing) ";
			sql += " VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.setString(3, name);
			pstmt.setString(4, email);
			pstmt.setString(5, phone);
			pstmt.setString(6, addr1);
			pstmt.setString(7, addr2);
			pstmt.setString(8, addr3);
			pstmt.setString(9, gender);
			if(marketing.equals(true)){
				pstmt.setInt(10, 1);
			} else {
				pstmt.setInt(10, 0);
			}
			
			
			pstmt.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(conn != null){ conn.close();	}
			if(pstmt != null){ pstmt.close(); }
			if(rs != null){ rs.close();	}
		}	
	%>
