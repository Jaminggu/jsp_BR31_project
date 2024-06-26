<%@page import="java.sql.DriverManager"%>
<%@page import="com.mysql.cj.jdbc.Driver"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커스텀아이스크림 등록</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link href="/baskinrobbins/index.css" rel="stylesheet">
<style>

	*{
		margin:0;
		
	}

	
	#div1{
		text-align: center;
		width:1000px;
	 	margin: 0 auto;
		height:534px;
		margin-top: 200px;
		margin-bottom: 60px;
	}
	
	#div2{
		width:1000px;
	 	margin: 0 auto;
		margin-bottom: 80px;
	
	}
	
	#div3 {
		
		padding-left: 15xp;
		margin-top: 50px;
		margin-left: 40px;
		height: 50px;
		
	}
	
	#div4 {
		
		margin-top: 20px;
	}		
	
	#div5 {
		text-align:left;
		display: flex;
		margin-top: 20px;
	}	
	
	#div6 {
		
		margin-left: 70px;
		margin-bottom: 10px;
	}

	
	table{
		border-collapse:collapse;
		width:1000px;
		height:534px;
	}
	.td1{
		width:500px;
		text-align: center;
	}
	
	.td2{
		text-align: left;
		vertical-align: top;
		padding-top: 30px;
		padding-left: 40px;
	}
	
	.tr{
	
		text-align: left;
		vertical-align: top;
	}
	
	.img-container {
		width: 100%;
        height: 100%;
        display: flex;
        align-items: center;
        justify-content: center;
		position: relative;		
	}
	.img1{
	
		width: 482px;
		height: 530px;
		position: absolute;
	}
	.img2{
	
		width: 130px;
		height: 230px;
		position: absolute;
		bottom: 10px;

	}
	.img3{
	
		width: 450px;
		height: 400px;
		position: absolute;
	}
	.img4{
		
		width: 110px;
		
	}
	
	#p1{
		font-size: 25px;
		color: #ff87a0;
		font-weight: bold;
		margin-bottom: 5px;
	}
	
	#p2{
		font-size: 40px;
		
	}
	#p3{
		font-size: 15px;
		text-align: right;
		margin-right: 100px;
		
	}
	#p4{
		font-size: 15px;
		text-align: right;
		margin-right: 100px;
		
	}

	select{
	
		height: 50px;
		font-size: 17px;
	}
	
	#input1{
	
		font-size: 25px;
		width: 280px;
		height: 50px;
		margin-right: 10px;
		margin-top: 20px;
	}
	
	#input1::placeholder {
	
 	   font-size: 20px;
}

	textarea {
	
	   font-size: 20px;
	   font-weight: normal;
}

	textarea ::placeholder {
	
	   font-size: 40px;
}

	#btn-check{
	
		width:60px;
		height:50px;
		margin-top:10px;
		
		
	}
	
	#btn-imageImport{
	
		width:250px;
		height:50px;
		margin-right: 10px;
		
	}

	#btn-main{
	
		width:60px;
		height:50px;
		margin-top:10px;
		margin-left: 50px;
		background: #F986BD;
		color: white;
		border-color: pink;
	}
	
	
</style>	
</head>
<body>
<% 
	String log = (String)session.getAttribute("log");	

	String customNumber = request.getParameter("customNumber"); 	

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String[] myIceCream = new String[5];

	String imagePath =  request.getContextPath();
	imagePath += "/baskinrobbins/pages/custom/images/uploadFile/";
	System.out.println(imagePath);

	try{	
		
		String jdbcUrl = "jdbc:mysql://localhost:3306/project_baskin_mysql?serverTimezone=UTC&useSSL=false";
		String dbId = "root";
		String dbPw = "root";
			
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl,dbId,dbPw);
		
		String sql = "select * from customList where custom_number = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,customNumber);
		rs = pstmt.executeQuery();
		
		while(rs.next()){
				
			
			myIceCream[0] = rs.getString("custom_name");
			myIceCream[1] = rs.getString("custom_imageFileName");
			myIceCream[2] = rs.getString("custom_description");
			myIceCream[3] = rs.getString("custom_userId");
			myIceCream[4] = rs.getString("custom_regDate");
		}
		
		
	}catch(Exception e){
		
		e.printStackTrace();
		

	}finally{
		
		if(conn != null){
		conn.close();			
	}
	if(pstmt != null){
		pstmt.close();	
	}
	if(rs != null){
		rs.close();
	}
			
	}



%>


<jsp:include page="../../partials/header.jsp"></jsp:include>

<div id="div1">
	<table>
	<tr>	
		<td class="td1">
			<div class="img-container">
				<img src="images/basic_images/배경.png" class="img1">
				<img src="images/basic_images/콘.png" class="img2">
				<img src="<%=imagePath + myIceCream[1]%>" class="img3">
			</div>
		</td>
		<td class="td2">
			<div id="div3">
				<p id = "p1">ICECREAM</p>
					<p id="p2"><%=myIceCream[0]%></p>
					<p id="p3"><%=myIceCream[3]%></p>
					<p id="p4"><%=myIceCream[4]%></p>
					<div id="div4">
						<textarea readonly rows="8" cols="31" id="customDescription"><%=myIceCream[2]%></textarea><br>
					</div>
					<div id="div6"><button id ="btn-main" onclick="location.href='customView.jsp'">뒤로가기</button></div>
				
			</div>
		</td>
				
	</tr>
	</table>	
</div>
<br><br><br>
<jsp:include page="../../partials/footer.jsp"></jsp:include>
</body>
</html>