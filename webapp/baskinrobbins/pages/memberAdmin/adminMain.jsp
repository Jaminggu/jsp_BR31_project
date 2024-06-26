<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
      <script src="http://code.jquery.com/jquery-latest.min.js"></script>
      <style>
      * {
      	margin: 0 auto;
      	padding: 0 auto;
      	align: center;
      }
       table {
          	width: 400px;
          	height: 300px;
          	align: center;

       }
       #content-adminMain {
           margin: 0 auto;
       }
       #title {
			text-align: center;
       }
       
       h1 {
       		align: center;
	       	font-size: 40px;
	       	color: #F986BD;
	       	width: 250px;
	       	margin: 0;
	       	padding:0
	       	
       }
       .sub {
       padding-right: 20px;
       }
       
      .btn {
       	width: 80px;
       	height: 30px;
       	border: #F986BD;
       	background-color: #F986BD;
       	color: white;
       	font-size: 15px;
       	cursor: pointer;
       }
       
       a{
       color: gray;
       text-decoration: none;
       }
	</style>      
</head>
<body>
	<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.7.1/kakao.min.js"
	  integrity="sha384-kDljxUXHaJ9xAb2AzRd59KxjrFjzHa5TAoFQ6GbYTCAG0bjM55XohjjDT7tDDC01" crossorigin="anonymous">
	</script>
	
	<script>
	  Kakao.init('23e28c1243b2659c210009fcba12fd0e'); 
	</script>
	
  	<jsp:include page="../../partials/header.jsp"></jsp:include>	
  	<br><br><br><br><br><br><br><br><br>	
  		
	<div align="center">
		<table id="content-adminMain">
			<tr>
				<td colspan="4" align="center"><h1>관리자페이지</h1></td>
			</tr>
			<tr>
				<td colspan="4"><hr></td>
			</tr>
			<tr>
				<th class="sub">상품 관리</th>
				<td><a href="../shopAdmin/01_adminItemList.jsp">전체 상품</a></td>
				<td colspan="2"><a href="../shopAdmin/02_adminAddIceCream.jsp">상품 등록</a></td>
			</tr>
			<tr>
				<th class="sub">회원 관리</th>
				<td><a href="adminMemberList.jsp">전체 회원</a></td>
				<td colspan="2"><a href="adminSendEmail.jsp">메시지 보내기</a></td>
			</tr>
			<tr>
				<th class="sub">게시판 관리</th>
				<td colspan="3"><a href="../board/boardMain.jsp">전체 게시판</a></td>
			</tr>
			<tr>
				<td colspan="4" align="center"><button class="btn" onclick="location='adminLogout.jsp'">로그아웃</button></td>
			</tr>
		</table>
	</div>


</body>
</html>