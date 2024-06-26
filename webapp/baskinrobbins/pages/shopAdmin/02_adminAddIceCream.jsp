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
       #content-adminAddIceCream {
           margin: 0 auto;
       }
       #button-adminAddIceCreamPro{
			width: 150px;
            height: 50px;
            font-size: 20px;
            font-weight: bold;
            background-color: #BDBDBD;
            color: white;
            border-style: none;
            margin: 30px 0px;
            cursor: pointer;
       }
       h1 {
       color: #f986bd;
       margin-bottom: 30px;
       }
	</style>      
</head>
<body>
<%--어드민 헤더 삭제확인 <jsp:include page="../layout/adminHeader.jsp"></jsp:include>--%>	

<jsp:include page="../../partials/header.jsp"></jsp:include>
<br><br><br><br><br><br><br>
<div align="center">
<h1>신상품 등록</h1>
<table border="1">
<tr>
<td>상품명</td>
<td><input type="text" id="iceCreamName" value="우주 라이크 봉봉"></td>
</tr>
<tr>
<td>재고량</td>
<td><input type="number" id="iceCreamStock" value="100"></td>
</tr>
<tr>
<td>등록날짜</td>
<td><input type="text" id="iceCreamRegDate" value="2024-06-18"></td>
</tr>
<tr>
<td>1회 제공량</td>
<td><input type="number" id="iceCreamPortionSize" value="115"></td>
</tr>
<tr>
<td>열량(kcal)</td>
<td><input type="number" id="iceCreamCalory" value="292"></td>
</tr>
<tr>
<td>당류(g)</td>
<td><input type="number" id="iceCreamSugar" value="24"></td>
</tr>
<tr>
<td>단백질(g)</td>
<td><input type="number" id="iceCreamProtein" value="5"></td>
</tr>
<tr>
<td>포화지방(g)</td>
<td><input type="number" id="iceCreamFat" value="8"></td>
</tr>
<tr>
<td>나트륨(mg)</td>
<td><input type="number" id="iceCreamNatrium" value="105"></td>
</tr>
<tr>
<td>알레르기 성분</td>
<td><input type="text" id="iceCreamAllergy" value="우유, 대두, 밀"></td>
</tr>
<tr align="center">
<td colspan="2">
<button id="button-adminAddIceCreamPro">추가하기</button>
</td>
</tr>
</table>
</div>
<br><br><br><br><br><br><br>

<script>
let addIceCream = (event) => {
	event.preventDefault();
	
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
		url: '03_adminAddIceCreamPro.jsp',
		data: {
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
			alert("아이스크림 정보를 추가하였습니다.");
			location.href="01_adminItemList.jsp";
		},
		error: function() {
			alert("adminAddIceCream error");
		}
		
	}); 
	return true;
}

let $adminAddIceCreamPro = document.querySelector("#button-adminAddIceCreamPro");
$adminAddIceCreamPro.addEventListener("click", addIceCream);

</script>


</body>
</html>