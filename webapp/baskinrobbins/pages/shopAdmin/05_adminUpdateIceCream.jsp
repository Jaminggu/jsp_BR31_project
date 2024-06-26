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
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
 
	 <style>
       table, tr, td {
           border: 1px solid black;
           border-collapse: collapse;
       }
       #content-adminUpdateIceCream{
           margin: 0 auto;
       }
       #button-adminIceCreamUpdatePro{
			width: 150px;
            height: 50px;
            font-size: 20px;
            font-weight: bold;
            background-color: #BDBDBD;
            color: white;
            border-style: none;
            border-radius: 8px;
            margin: 30px 0px;
            cursor: pointer;
       	}
	</style>      
</head>
<body>
<%
int iceCreamNumber = Integer.parseInt(request.getParameter("iceCreamNumber"));

Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;

int iceCreamNumberList = 0;
String iceCreamNameList = "";
int iceCreamStockList = 0;
int iceCreamSoldList = 0;
String iceCreamRegDateList = "";
int iceCreamInfoList1 = 0;
int iceCreamInfoList2 = 0;
int iceCreamInfoList3 = 0;
int iceCreamInfoList4 = 0;
int iceCreamInfoList5 = 0;
int iceCreamInfoList6 = 0;
String iceCreamInfoList7 = "";
String iceCreamImageList = "";
String iceCreamContentImage1List = "";
String iceCreamContentImage2List = "";
String iceCreamContentImage3List = "";

try {
	String jdbcUrl = "jdbc:mysql://localhost:3306/Project_Baskin_mysql?serverTimezone=UTC&useSSL=false";
	String dbId = "root";
	String dbPw = "root";
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	con = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
	
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

<div align="center">
<h1>아이스크림 수정하기</h1>
<table border="1">
<tr>
<td>상품명</td>
<td><input type="text" id="iceCreamName" value="<%=iceCreamNameList%>"></td>
</tr>
<tr>
<td>재고량</td>
<td><input type="number" id="iceCreamStock" value="<%=iceCreamStockList%>"></td>
</tr>
<tr>
<td>등록날짜</td>
<td><input type="text" id="iceCreamRegDate" value="<%=iceCreamRegDateList%>"></td>
</tr>
<tr>
<td>1회 제공량</td>
<td><input type="number" id="iceCreamPortionSize" value="<%=iceCreamInfoList1%>"></td>
</tr>
<tr>
<td>열량(kcal)</td>
<td><input type="number" id="iceCreamCalory" value="<%=iceCreamInfoList2%>"></td>
</tr>
<tr>
<td>당류(g)</td>
<td><input type="number" id="iceCreamSugar" value="<%=iceCreamInfoList3%>"></td>
</tr>
<tr>
<td>단백질(g)</td>
<td><input type="number" id="iceCreamProtein" value="<%=iceCreamInfoList4%>"></td>
</tr>
<tr>
<td>포화지방(g)</td>
<td><input type="number" id="iceCreamFat" value="<%=iceCreamInfoList5%>"></td>
</tr>
<tr>
<td>나트륨(mg)</td>
<td><input type="number" id="iceCreamNatrium" value="<%=iceCreamInfoList6%>"></td>
</tr>
<tr>
<td>알레르기 성분</td>
<td><input type="text" id="iceCreamAllergy" value="<%=iceCreamInfoList7%>"></td>
</tr>
<tr align="center">
<td colspan="2">
<button id="button-adminIceCreamUpdatePro">수정하기</button>
<input type="hidden" id="iceCreamNumber" value="<%=iceCreamNumber%>">
</td>
</tr>
</table>
</div>

<jsp:include page="../../partials/footer.jsp"></jsp:include>

<script>
let modifyIceCream = (event) => {
	event.preventDefault();
	
	let $iceCreamNumber = document.querySelector("#iceCreamNumber");
	let $iceCreamName = document.querySelector("#iceCreamName");
	let $iceCreamStock = document.querySelector("#iceCreamStock");
	let $iceCreamRegDate = document.querySelector("#iceCreamRegDate");
	let $iceCreamPortionSize = document.querySelector("#iceCreamPortionSize");
	let $iceCreamCalory = document.querySelector("#iceCreamCalory");
	let $iceCreamSugar = document.querySelector("#iceCreamSugar");
	let $iceCreamProtein = document.querySelector("#iceCreamProtein");
	let $iceCreamFat = document.querySelector("#iceCreamFat");
	let $iceCreamNatrium = document.querySelector("#iceCreamNatrium");
	let $iceCreamAllergy = document.querySelector("#iceCreamAllergy");
	
	if($iceCreamName.value == "") {
		$iceCreamName.focus();
		alert("아이크스림 상품명을 작성해주세요.");
		return false;
	}
	
	if($iceCreamStock.value == "") {
		$iceCreamStock.focus();
		alert("아이크스림 재고량을 작성해주세요.");
		return false;
	}
	
	if($iceCreamRegDate.value == "") {
		$iceCreamRegDate.focus();
		alert("아이크스림 등록날짜를 작성해주세요.");
		return false;
	}
	
	if($iceCreamPortionSize.value == "") {
		$iceCreamPortionSize.focus();
		alert("아이크스림 1회 제공량을 작성해주세요.");
		return false;
	}
	
	if($iceCreamCalory.value == "") {
		$iceCreamCalory.focus();
		alert("아이크스림 열량(kcal)을 작성해주세요.");
		return false;
	}
	
	if($iceCreamSugar.value == "") {
		$iceCreamSugar.focus();
		alert("아이스크림 당류(g)를 작성해주세요.");
		return false;
	}
	
	if($iceCreamProtein.value == "") {
		$iceCreamProtein.focus();
		alert("아이스크림 단백질(g)을 작성해주세요.");
		return false;
	}
	
	if($iceCreamFat.value == "") {
		$iceCreamFat.focus();
		alert("아이크스림 포화지방(g)을 작성해주세요.");
		return false;
	}

	if($iceCreamNatrium.value == "") {
		$iceCreamNatrium.focus();
		alert("아이크스림 나트륨(mg)을 작성해주세요.");
		return false;
	}
	
	if($iceCreamAllergy.value == "") {
		$iceCreamAllergy.focus();
		alert("아이크스림 알레르기 성분을 작성해주세요.");
		return false;
	}
	
	$.ajax({
		type: 'POST',
		url: '06_adminUpdateIceCreamPro.jsp',
		data: {
			iceCreamNumber : $iceCreamNumber.value,
			iceCreamName : $iceCreamName.value,					
			iceCreamStock  : $iceCreamStock.value,
			iceCreamRegDate : $iceCreamRegDate.value,
			iceCreamPortionSize : $iceCreamPortionSize.value,
			iceCreamCalory : $iceCreamCalory.value,
			iceCreamSugar : $iceCreamSugar.value,
			iceCreamProtein : $iceCreamProtein.value,
			iceCreamFat : $iceCreamFat.value,	
			iceCreamNatrium : $iceCreamNatrium.value,	
			iceCreamAllergy : $iceCreamAllergy.value
		},
		success: function(data) {
			alert("아이스크림 정보를 수정하였습니다.");
			location.href="01_adminItemList.jsp";
		},
		error: function() {
			alert("adminUpdateIceCream error");
		}
		
	}); 
	return true;
	
}

let $adminIceCreamUpdatePro = document.querySelector("#button-adminIceCreamUpdatePro");
$adminIceCreamUpdatePro.addEventListener("click", modifyIceCream);

</script>


</body>
</html>