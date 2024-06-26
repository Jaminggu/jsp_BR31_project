<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");
	int boardNumber = Integer.parseInt(request.getParameter("number"));
	String userId = request.getParameter("id");
%>

<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
%>

<%
	try{
		
		String jdbcUrl = "jdbc:mysql://localhost:3306/project_baskin_mysql?serverTimezone=UTC&useSSL=false";
		String dbId = "root";
		String dbPw = "root";

		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);

		String sql = " DELETE FROM board WHERE board_number = ? ";
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, boardNumber);
		
		pstmt.executeUpdate();
		
	}catch (Exception e) {
		e.printStackTrace();
	}finally{
		if(conn != null){ conn.close(); }
		if(pstmt != null){ pstmt.close(); }
		if(rs != null){ rs.close(); }
	}
%>
</body>
</html>