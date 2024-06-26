<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../styles/boardWriteForm.css">
</head>
<body>
	<%
		String tdColor = "#f986bd";
		String userId = (String)session.getAttribute("log");
	%>
	  <jsp:include page="../../partials/header.jsp"></jsp:include>
	<br><br><br><br><br>
	<div align="center">
		
		<h2>새 게시글 작성하기</h2>
		<form id="FILE_FORM"  method="post" enctype="multipart/form-data">
			<table id="content-boardWrite">
				<tr>
					<td style="display:none">
						<input type="hidden" id="writer" name="writer" value="<%=userId %>">
					</td>
				</tr>
				<tr height="40">
					<td width="150" align="center" bgcolor="<%= tdColor %>">제목</td>
					<td><input type="text" id="subject" name="subject"></td>
				</tr>
				
				<tr height="40">
					<td width="150" align="center" bgcolor="<%= tdColor %>">글내용</td>
					<td><textarea rows="10" cols="50" id="content" name="content"></textarea></td>
				</tr>
				
				<tr height="40">
					<td width="150" align="center" colspan="2" bgcolor="<%= tdColor %>">
						<button id="button-boardMain">취소</button>					
         		<button id="button-boardWritePro">글쓰기</button>
					</td>
				</tr>				
			</table>
		</form>
		<br><br><br><br><br>
  		<jsp:include page="../../partials/footer.jsp"></jsp:include>
	</div>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="boardWriteForm.js"></script>
</body>
</html>