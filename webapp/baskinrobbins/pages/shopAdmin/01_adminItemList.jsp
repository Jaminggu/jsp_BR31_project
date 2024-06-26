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
<link rel="stylesheet" href="../layout/common.css" type="text/css">
 <style>
       table, tr, td {
           border: 1px solid black;
           border-collapse: collapse;
       }
       #content-adminItemList {
           margin: 0 auto;
       }
       .button1{
            width: 60px;
            height: 30px;
            font-size: 15px;
            font-weight: bold;
            background-color: #BDBDBD;
            color: white;
            border-style: none;
            border-radius: 8px;
            margin: 30px 0px;
            cursor: pointer;
        }

		.button2{
          	width: 60px;
            height: 30px;
            font-size: 15px;
            font-weight: bold;
            background-color: #BDBDBD;
            color: white;
            border-style: none;
            border-radius: 8px;
            margin: 30px 0px;
            cursor: pointer;
        }
       
	</style>
	<script src="https://code.jquery.com/jquery-latest.min.js"></script>

</head>
<body>

<%
Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;

int[] iceCreamNumberList = new int[1000];
String[] iceCreamNameList = new String[1000];
int[] iceCreamPriceList = new int[1000];
int[] iceCreamStockList = new int[1000];
int[] iceCreamSoldList = new int[1000];
String[] iceCreamImageList = new String[1000];
String[] iceCreamContentImage1List = new String[1000];
String[] iceCreamContentImage2List = new String[1000];
String[] iceCreamContentImage3List = new String[1000];
int[] iceCreamInfoList1 = new int[1000];
int[] iceCreamInfoList2 = new int[1000];
int[] iceCreamInfoList3 = new int[1000];
int[] iceCreamInfoList4 = new int[1000];
int[] iceCreamInfoList5 = new int[1000];
int[] iceCreamInfoList6 = new int[1000];
String[] iceCreamInfoList7 = new String[1000];
String[] iceCreamRegDateList = new String[1000];

int iceCreamSize = 0;

try{
	String jdbcUrl = "jdbc:mysql://localhost:3306/Project_Baskin_mysql?serverTimezone=UTC&useSSL=false";
	String dbId = "root";
	String dbPw = "root";
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	con = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
	
	String sql = "select * from product";
	ps = con.prepareStatement(sql);
	rs = ps.executeQuery();
	
	while(rs.next()) {
		iceCreamNumberList[iceCreamSize] = rs.getInt(1) - 1;
		iceCreamNameList[iceCreamSize] = rs.getString(2);
		iceCreamStockList[iceCreamSize] = rs.getInt(3);
		iceCreamSoldList[iceCreamSize] = rs.getInt(4);
		iceCreamRegDateList[iceCreamSize] = rs.getString(5);
		
		iceCreamInfoList1[iceCreamSize] = rs.getInt(6);
		iceCreamInfoList2[iceCreamSize] = rs.getInt(7);
		iceCreamInfoList3[iceCreamSize] = rs.getInt(8);
		iceCreamInfoList4[iceCreamSize] = rs.getInt(9);
		iceCreamInfoList5[iceCreamSize] = rs.getInt(10);
		iceCreamInfoList6[iceCreamSize] = rs.getInt(11);
		iceCreamInfoList7[iceCreamSize] = rs.getString(12);
		
		iceCreamImageList[iceCreamSize] = rs.getString(13);
		iceCreamContentImage1List[iceCreamSize] = rs.getString(14);
		iceCreamContentImage2List[iceCreamSize] = rs.getString(15);
		iceCreamContentImage3List[iceCreamSize] = rs.getString(16);
		
		iceCreamSize += 1;
	}
	
	
} catch(Exception e) {
	e.printStackTrace();
} finally {
	if(con != null) con.close();
	if(ps != null) ps.close();
	if(rs != null) rs.close();
} 

%>

<%--어드민 헤더 삭제확인 <jsp:include page="../layout/adminHeader.jsp"></jsp:include>--%>

<jsp:include page="../../partials/header.jsp"></jsp:include>
<br><br><br><br><br><br><br><br>
<div align="center">
<table id="content-adminItemList" style="border-top: 1px solid #444444;">
<tr>
<td align="center" width="100px" height="50px" style="background-color: #f986bd;"><font color="white"><b>상품번호</b></font></td>
<td align="center" width="200px" style="background-color: #f986bd;"><font color="white"><b>상품명</b></font></td>
<td align="center" width="80px" style="background-color: #f986bd;"><font color="white"><b>재고</b></font></td>
<td align="center" width="150px" style="background-color: #f986bd;"><font color="white"><b>수정하기</b></font></td>
<td align="center" width="150px" style="background-color: #f986bd;"><font color="white"><b>삭제하기</b></font></td>
</tr>
<%
for(int i=0; i<iceCreamSize; i++){
%>
<tr height="50px">
<td align="center"><%=iceCreamNumberList[i]+1%></td>
<td align="center"><%=iceCreamNameList[i]%></td>
<td align="center"><%=iceCreamStockList[i] %></td>
<td align="center"><button class="button1" onclick="window.location.href='05_adminUpdateIceCream.jsp?iceCreamNumber=<%=iceCreamNumberList[i]%>'">수정</button></td>
<td align="center"><button class="button2" onclick="window.location.href='04_adminDeleteIceCream.jsp?iceCreamNumber=<%=iceCreamNumberList[i]%>'">삭제</button></td>
</tr>
<%} %>
</table>
</div>
<br><br><br><br><br><br><br><br>


</body>
</html>