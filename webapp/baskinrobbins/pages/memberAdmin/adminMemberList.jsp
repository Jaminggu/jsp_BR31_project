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
      <script src="http://code.jquery.com/jquery-latest.min.js"></script>
	 <style>
       table, tr, td {
           border: 1px solid black;
           border-collapse: collapse;
           text-align: center;
       }
       #content-adminMemberList {
           margin: 0 auto;
       }
       h2 {
       color: #f986bd;
       margin-bottom: 30px;
       font-size: 40px;
       }
       td {
       padding: 8px;}
       button {
            background-color: #BDBDBD;
            color: white;
            border-style: none;
            cursor: pointer;
            padding: 4px;
       }
	</style>      
</head>
<body>

<%
	int memberSize = 0;
	int[] memberNumberList = new int [1000];
	String[] memberIdList = new String[1000];
	String[] memberPwList =  new String[1000];
	String[] memberNameList =  new String[1000];
	String[] memberEmailList =  new String[1000];
	String[] memberPhoneList =  new String[1000];
	String[] memberAddr1List =  new String[1000];
	String[] memberAddr2List =  new String[1000];
	String[] memberAddr3List = new String[1000];
	String[] memberGenderList =  new String[1000];
	int[] memberMarketingList =new int [1000];
	
	
	String[] genderList = {"선택안함", "남자", "여자"};
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
		
		String sql = "SELECT * FROM member";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		while(rs.next()){
					
			memberNumberList[memberSize] = rs.getInt(1);
			memberIdList[memberSize] = rs.getString(2);
			memberPwList[memberSize] = rs.getString(3);
			memberNameList[memberSize] = rs.getString(4);
			memberEmailList[memberSize] = rs.getString(5);
			memberPhoneList[memberSize] = rs.getString(6);
			memberAddr1List[memberSize] = rs.getString(7);
			memberAddr2List[memberSize] = rs.getString(8);
			memberAddr3List[memberSize] = rs.getString(9);
			memberGenderList[memberSize] = rs.getString(10);
			memberMarketingList[memberSize] = rs.getInt(11);				
			memberSize += 1;
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
<br><br><br><br><br><br><br>
<div align="center">

	<h2>전체 회원 목록</h2>

	<table id="content-adminMemberList">
		<tr>
			<td>아이디</td>
			<td>비밀번호</td>
			<td>이름</td>
			<td>이메일</td>
			<td>연락처</td>
			<td>우편번호</td>
			<td>주소</td>
			<td>남은주소</td>
			<td>성별</td>
			<td>마케팅 수신동의</td>
			<td>삭제</td>
		</tr>
	<% for(int i=0; i<memberSize; i++) { %>
		<tr>
			<td><%= memberNumberList[i] %></td>
			<td><%= memberIdList[i] %></td>
			<td><%= memberPwList[i] %></td>
			<td><%= memberNameList[i] %></td>
			<td><%= memberEmailList[i] %></td>
			<td><%= memberPhoneList[i] %></td>
			<td><%= memberAddr1List[i] %></td>
			<td><%= memberAddr2List[i] %></td>
			<td><%= memberAddr3List[i] %></td>
			<% int genderIndex = Integer.parseInt(memberGenderList[i]);	%>
			<td><%= genderList[genderIndex] %></td>
			<td>
				<%if(memberMarketingList[i] == 1) {%>
					동의
				<%} else{%>
					동의안함
				<%} %>
				
			</td>
			<td><button class="delete" onclick="window.location.href='adminDeleteMember.jsp?memberNumber=<%= memberNumberList[i] %>'">삭제</button></td>
		</tr>
	<% } %>
	</table>
</div>

</body>
</html>