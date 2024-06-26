<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.time.Duration"%>
<%@page import="java.time.Period"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
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
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="../../styles/boardMain.css">
</head>
<body>
	<jsp:include page="../../partials/header.jsp"></jsp:include>
	<br><br><br><br><br>
	<h1>베라광장</h1>
	<%
		String userId = (String)session.getAttribute("log");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	%>
	
	<%
		int 		boardSize 			= 	0;
		int[] 		boardNumberList 	= 	new int[1000];
		String[] 	boardWriterList 	=   new String[1000];
		String[] 	boardSubjectList 	=   new String[1000];
		String[] 	boardContentList 	=   new String[1000];
	%>
	
	<%
	try{
		String jdbcUrl = "jdbc:mysql://localhost:3306/project_baskin_mysql?serverTimezone=UTC&useSSL=false";
		String dbId = "root";
		String dbPw = "root";
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
		
		String sql = " SELECT board_number, board_writer, board_subject, board_content FROM board ORDER BY board_number DESC ";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		while(rs.next()){
			boardNumberList[boardSize] = rs.getInt(1);
			boardWriterList[boardSize] = rs.getString(2);
			boardSubjectList[boardSize] = rs.getString(3);
			boardContentList[boardSize] = rs.getString(4);
				
			boardSize += 1;
		}
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(conn != null){ conn.close();	}
		if(pstmt != null){ pstmt.close(); }
		if(rs != null){ rs.close();	}
	}
	%>
	<%
		int onePageArticlesCount = 12;		// 한 페이지에 보여줄 게시글 수
		int currentPageNumber = 1;			// 현재 페이지 번호
		if(request.getParameter("currentPageNumber") != null) {
			currentPageNumber = Integer.parseInt(request.getParameter("currentPageNumber"));
		}
		int allArticlesCount = boardSize;	// 전체 게시글 수
		int startRow = (currentPageNumber - 1) * onePageArticlesCount;		// 게시글 시작 번호
		int endRow = startRow + onePageArticlesCount;						// 게시글 마침 번호
		
		if(endRow > allArticlesCount) {
			endRow = allArticlesCount;
		}
	%>
	<%
		int number = boardSize - (currentPageNumber - 1) * onePageArticlesCount;
	%>
	
	<%
			int clickablePageCount = 5;										// 페이지 번호 개수
			int allPageCount = allArticlesCount / onePageArticlesCount;		// 전체 페이지 수
			if(allArticlesCount % onePageArticlesCount != 0) allPageCount += 1;
			
			int startPageNum = 1;
			if(currentPageNumber % clickablePageCount != 0) {
				startPageNum = (currentPageNumber / clickablePageCount) * clickablePageCount + 1;
			} else {
				startPageNum = (currentPageNumber / clickablePageCount - 1) * clickablePageCount + 1;
			}
			int endPageNum = startPageNum + clickablePageCount  - 1;
			if(endPageNum > allPageCount){
				endPageNum = allPageCount;
			}
		%>
	

	<div align="center">
    <ul class="list">
    <%for(int i = startRow; i < endRow; i++) { %>
      <li class="item">
        <div class="hearder">
          <h4 class="title"><%=boardSubjectList[i] %></h4>
          <p class="category">new</p>
        </div>
        <div class="text"><%=boardContentList[i] %></div>
        <p class="name" style="text-align: left;"><%=boardWriterList[i] %>님</p>
        <a class="link" href="boardInfo.jsp?boardNumber=<%=boardNumberList[i]%>">자세히 보기</a>
      </li>
     <%} %>
    </ul>
    <br>
    <div class="page">
    <% if(startPageNum > clickablePageCount) { %>
			<a class="overBefore" href="boardMain.jsp?currentPageNumber=<%= startPageNum - clickablePageCount %>">이전</a>
		<% } %>
		<% for(int i=startPageNum; i<= endPageNum; i++) { %>
			<a class="pageNum" href="boardMain.jsp?currentPageNumber=<%= i %>"><%= i %></a>
		<% } %>
		<% if(endPageNum < allPageCount) { %>
			<a class="overAfter" href="boardMain.jsp?currentPageNumber=<%= endPageNum + 1 %>">이후</a>
		<% } %>    
    </div>
    <br><br>
    <div align="right">
    <%if(userId != null) {%>
	    <a class="write" href="boardWriteForm.jsp">글쓰기</a>
	  <%} %>
    </div>
  </div>
  <br><br><br><br><br>
  <jsp:include page="../../partials/footer.jsp"></jsp:include>
</body>
</html>