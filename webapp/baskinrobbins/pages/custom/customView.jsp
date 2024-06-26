<%@page import="java.awt.image.ImageProducer"%>
<%@page import="java.util.List"%>
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
    <meta charset="UTF-8" />
    <title>BR31 상품목록</title>
    <style>		
	div{
	
		text-align: center;
	}	
		
      #div1 {
      	margin-top:150px;
        margin-bottom: 20px;
      }

      #div2 {
      	width:1669px;
        margin: 0 auto;
        margin-bottom: 80px;
      }

      .p1 {
        font-size: 40px;
        color: #f986bd;
      }

      .p2 {
        font-family: fantasy;
        font-size: 20px;
        font-weight: bold;
        color: #f986bd;
        padding-top: 25px;
      }

      table {
      	width: 1669px;
        border-spacing: 20px;
      }
      
      td {
      	width: 200px;

      }


      .div1 {
        border: 2px solid;
   		border-radius: 20px;
        border-color: #F7F5EF;
        cursor: pointer;
	}
      .div2 {
        font-size: 17px;
 		font-weight:bold;
        color: grey;
        margin-top: 10px;
      }
      
      #btn-reg{
      
      	width:100px;
		height:50px;
		background: #F986BD;
		color: white;
		border-color: white;
		font-weight: bold;
		border-radius: 20px;
		margin-top:10px;
      
      }
      
    </style>
  </head>
  <body>
 	<jsp:include page="/baskinrobbins/partials/header.jsp"></jsp:include>
  	<%
  		Connection conn = null;
  		PreparedStatement pstmt = null;
  		ResultSet rs = null;
  		
  		List<String[]> myIceCreamList = new ArrayList<>();
  		
  	
  		String imagePath =  request.getContextPath();
  		System.out.println(imagePath);
  		imagePath += "/baskinrobbins/pages/custom/images/uploadFile/";
		System.out.println(imagePath);
  
  		try{	
  			
  	  		String jdbcUrl = "jdbc:mysql://localhost:3306/project_baskin_mysql?serverTimezone=UTC&useSSL=false";
  			String dbId = "root";
  			String dbPw = "root";
  				
  			Class.forName("com.mysql.cj.jdbc.Driver");
  			conn = DriverManager.getConnection(jdbcUrl,dbId,dbPw);
  			
  			String sql = "select * from customList";
  			pstmt = conn.prepareStatement(sql);
  			rs = pstmt.executeQuery();
  			
  			while(rs.next()){
 	 				
  				String[] tempArray = new String[4];
  				tempArray[0] = Integer.toString(rs.getInt("custom_number"));
  				tempArray[1] = rs.getString("custom_name");
  				tempArray[2] = rs.getString("custom_imageFileName");
  				tempArray[3] = rs.getString("custom_userId");
  				myIceCreamList.add(tempArray);
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
  	
    <div id="div1">
      <h1 class="p1">커스텀 BR</h1>
    </div>
    <div id="div2">
      <table>
<%
		int size = myIceCreamList.size() + (4 - myIceCreamList.size() % 4);

		for(int i = 0; i < size; i++){
			
			if(i % 4 == 0){
%>			
			<tr>					
			
<% 				
			}
%>
<% 
		if(i < myIceCreamList.size()){
%>			
			<td>
				<div class="div1" onclick="location.href='customDetail.jsp?customNumber=<%=myIceCreamList.get(i)[0]%>'">
  					<img src="<%=imagePath + myIceCreamList.get(i)[2]%>" width="270px" height="270px">
				</div>
				<div class="div2"><%=myIceCreamList.get(i)[1] %></div>
			</td>
<%				
		}else{
%>			
			<td style="visibility: hidden;">
				<div class="div1">
  			
				</div>
				<div class="div2"></div>
			</td>
<%				
		}
			

			if(i % 4 == 3 || i == size - 1){
%>	
			</tr>					
			
<% 				
			}
					
		}
%>
      </table>
      <button id = "btn-reg" onclick="location.href='customInsert.jsp'">등록하기</button>
    </div>
  <jsp:include page="/baskinrobbins/partials/footer.jsp"></jsp:include>
  </body>
</html>
