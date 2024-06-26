<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../styles/boardInfo.css">
</head>
<body>
	<%
		String userId = (String)session.getAttribute("log");
		if(userId == null) {
			userId = "";
		}
	%>
	<%
	
		Connection conn = null;	
		PreparedStatement pstmt = null;	
		ResultSet rs = null;
	%>
	<%
	
			int boardNumber = Integer.parseInt(request.getParameter("boardNumber"));
			
			int		boardNumberList 	= 	0;
			String 	boardWriterList 	=  	"";
			String	boardSubjectList 	=  "";
			String 	boardContentList 	=	"";
			
			try{
				String jdbcUrl = "jdbc:mysql://localhost:3306/project_baskin_mysql?serverTimezone=UTC&useSSL=false";
				String dbId = "root";
				String dbPw = "root";
				
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
				
				String sql = " SELECT board_number, board_writer, board_subject, board_content FROM board WHERE board_number = ? ";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, boardNumber);
				rs = pstmt.executeQuery();
			
				if(rs.next()){
					
						boardNumberList 	= 	rs.getInt(1);
					 	boardWriterList 	=  	rs.getString(2);
						boardSubjectList 	=   rs.getString(3);
					 	boardContentList 	=	rs.getString(4);
				}
			
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				if(conn != null){ conn.close();	}
				if(pstmt != null){ pstmt.close(); }
				if(rs != null){ rs.close();	}
			}			
	%>
	<jsp:include page="../../partials/header.jsp"></jsp:include>
	<br><br><br><br><br><br><br><br><br>

	<div align="center">
    <div class="container">
      <header class="hearder">
        <div class="box">
          <p class="name">제품 이름</p>
          <h2 class="title"><%=boardSubjectList %></h2>
        </div>
        <div class="box">
          <p class="name">이름</p>
          <p class="id"><%= boardWriterList %></p>
        </div>
      </header>
      <div class="editor">
      <%=boardContentList %>
      </div>
      <br>
      <div class="buttons" align="right">
        <button class="button-boardMain">메인으로</button>
        <%if(userId.equals("admin") || userId.equals(boardWriterList)) {%>
				<button class="button-boardDeletePro">삭제</button>
				<%} %>
      </div>
    </div>
  </div>
  <br><br><br><br><br><br><br><br><br><br><br><br>
	<jsp:include page="../../partials/footer.jsp"></jsp:include>
	
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="boardInfo.js"></script>
</body>
</html>