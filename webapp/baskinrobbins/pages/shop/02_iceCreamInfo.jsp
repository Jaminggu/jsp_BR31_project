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
	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
	 <style>
	       table, tr, td {
	           border-collapse: collapse;
	       }
	       #content-itemInfo {
	           margin: 0 auto;
	           
	       }
	       #title {
	           text-align: center;
	       }
	       #btn-addCart{
            width: 140px;
            height: 35px;
            font-size: 16px;
            font-weight: bold;
            background-color: #f986bd;
            color: white;
            border-style: none;
            margin: 0 0px 0 50px;
            cursor: pointer;
        }
        .table {
        border: none;
        }
        .table >td {
        padding: 10px;
        }
        .order-container {
        display: flex;
        flex-direction: row;
        align-items: center;
        justify-content: center;
        height: 20px;
        }
        .order-container >h4 {
        margin-right: 20px;
        }
        .order-container > select {
        margin-right: 50px;
        }
	       
	   </style>	
</head>
<body>
<%
int iceCreamNumber = Integer.parseInt(request.getParameter("iceCreamNumber"));
%>

<%
Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;

int iceCreamNumberList = 0;
String iceCreamNameList = "";
int iceCreamPriceList = 0;
int iceCreamStockList = 0;
int iceCreamSoldList = 0;
String iceCreamImageList = "";
String iceCreamContentImage1List = "";
String iceCreamContentImage2List = "";
String iceCreamContentImage3List = "";
int iceCreamInfoList1 = 0;
int iceCreamInfoList2 = 0;
int iceCreamInfoList3 = 0;
int iceCreamInfoList4 = 0;
int iceCreamInfoList5 = 0;
int iceCreamInfoList6 = 0;
String iceCreamInfoList7 = "";
String iceCreamRegDateList = "";

try{
	String jdbcUrl = "jdbc:mysql://localhost:3306/project_baskin_mysql?serverTimezone=UTC&useSSL=false";
	String dbId = "root";
	String dbPw = "root";
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	con = DriverManager.getConnection(jdbcUrl,dbId,dbPw);
	
	String sql = "select * from product where product_number = ?";
	ps = con.prepareStatement(sql);
	ps.setInt(1, iceCreamNumber+1);
	rs = ps.executeQuery();
	
	if(rs.next()) {
		iceCreamNumberList = rs.getInt(1) - 1;
		iceCreamNameList = rs.getString(2);
		iceCreamStockList = rs.getInt(3);
		iceCreamSoldList = rs.getInt(4);
		iceCreamRegDateList = rs.getString(5);
		
		iceCreamInfoList1 = rs.getInt(6);
		iceCreamInfoList2 = rs.getInt(7);
		iceCreamInfoList3 = rs.getInt(8);
		iceCreamInfoList4 = rs.getInt(9);
		iceCreamInfoList5 = rs.getInt(10);
		iceCreamInfoList6 = rs.getInt(11);
		iceCreamInfoList7 = rs.getString(12);
		
		iceCreamImageList = rs.getString(13);
		iceCreamContentImage1List = rs.getString(14);
		iceCreamContentImage2List = rs.getString(15);
		iceCreamContentImage3List = rs.getString(16);
	}
	
} catch(Exception e){
	e.printStackTrace();
} finally {
	if(con != null) con.close();
	if(ps != null) ps.close();
	if(rs != null) rs.close();
}

%>
<jsp:include page="../../partials/header.jsp"></jsp:include> 

<div align="center" style="position:relative">
<input type="hidden" id="iceCreamNumber" value="<%=iceCreamNumber%>">
</tr>
<tr>
<img src="<%=iceCreamContentImage1List%>">
</tr>
<div class="order-container">
<tr>
<td><h4>아이스크림 사이즈</h4></td>
<td align="right">
<select id="selectSize">
<option value="0">싱글레귤러</option>
<option value="1">싱글킹</option>
<option value="2">더블주니어</option>
<option value="3">더블레귤러</option>
<option value="4">파인트</option>
<option value="5">쿼터</option>
<option value="6">패밀리</option>
<option value="7">하프갤런</option>
<option value="8" selected>상품을 선택해주세요</option>
</select>
</td>
</tr>
<tr>
<td><h4>구매수량</h4></td>
<td align="right">
<%if(iceCreamStockList > 0){ %>
<input type="number" id="buyCount" min="1" max="100" value="1">
<%}else{ %>
품절
<%} %>
</td>
</tr>
<tr align="center">
<%if(iceCreamStockList > 0){ %>
<button id="btn-addCart">장바구니 담기</button>
<%}else{ %>
재입고 예정
<%} %>
</tr>
</div>
<br><br>
<hr width="970px">
<tr>
<table align="center">
            <tr class="table">
                <td rowspan="2" align="left"><h3>영양정보</h3></td>
                <td>1회제공량</td> 
                <td>열량(kcal)</td>
                <td>당류(g)</td>
                <td>단백질(g)</td>
                <td>포화지방(g)</td>
                <td>나트륨(g)</td>
                <td>알레르기 성분</td>
            </tr>
            <tr class="table">
                <td style="color: red" align="center"><%=iceCreamInfoList1 %></td>
                <td style="color: red" align="center"><%=iceCreamInfoList2 %></td>
                <td style="color: red" align="center"><%=iceCreamInfoList3 %></td>
                <td style="color: red" align="center"><%=iceCreamInfoList4 %></td>
                <td style="color: red" align="center"><%=iceCreamInfoList5 %></td>
                <td style="color: red" align="center"><%=iceCreamInfoList6 %></td>
                <td style="color: red" align="center"><%=iceCreamInfoList7 %></td>
            </tr>
        </table>
</tr>
<tr>
<img src="<%=iceCreamContentImage2List%>">
</tr>
<tr>
<img src="<%=iceCreamContentImage3List%>">
</tr>
<br>
</div>
<br><br><br><br><br>
  <jsp:include page="../../partials/footer.jsp"></jsp:include>

<script>
let addCart = (event) => {
	
	let log = "<%= (String)session.getAttribute("log") %>";
	
	if(log == "null"){
		alert("로그인 후 이용가능합니다");
		location.href = "../member/loginForm.jsp";
		return false;
	}
	
	
	$.ajax({
		type: "post",
		url : "03_addCartPro.jsp",
		data: {
			iceCreamNumber: $iceCreamNumber.value,
			selectSize: $selectSize.value,
			buyCount: $buyCount.value,
			log: log
	    },
	    success: function(data) {
	    	let str = '<p id="check">';
			let length = str.length;
			let startIndex = data.indexOf(str);
			
			let checkValue = data.substr(startIndex + length);
			
			if(checkValue.trim() == "-1") {
				alert("장바구니에 담겼습니다.");
				location.href="04_cartList.jsp";
			} else {
				alert("상품 재고수량이 " + checkValue.trim() + "개 남았습니다. 관리자에게 문의해주세요.");
			}
	    },
	    error: function() {
			alert("iceCreamInfo error");
		}
	});
}

let $addCart = document.querySelector("#btn-addCart");
$addCart.addEventListener("click", addCart);

let $iceCreamNumber = document.querySelector("#iceCreamNumber");
let $selectSize = document.querySelector("#selectSize");
let $buyCount = document.querySelector("#buyCount");

</script>


</body>
</html>


