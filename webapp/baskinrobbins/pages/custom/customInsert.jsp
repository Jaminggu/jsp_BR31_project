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
		visibility: hidden;
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

	#btn-reg{
	
		width:60px;
		height:50px;
		margin-top:10px;
		margin-left: 50px;
		background: #F986BD;
		color: white;
		border-color: white;
	}
	
	
</style>	
</head>
<body>
<% String log = (String)session.getAttribute("log");%>


<jsp:include page="../../partials/header.jsp"></jsp:include>

<div id="div1">
	<table>
	<tr>	
		<td class="td1">
			<div class="img-container">
				<img src="images/basic_images/배경.png" class="img1">
				<img src="images/basic_images/콘.png" class="img2">
				<img id="selectedImage" class="img3">
			</div>
		</td>
		<td class="td2">
			<div id="div3">
				<p id = "p1">ICECREAM</p>
				<input id="input1" type="text" placeholder="아이스크림 이름을 지어주세요."><button id ="btn-check">중복<br>확인</button>
					<div id="div4">
						<textarea rows="8" cols="31" placeholder="자신만의 아이스크림에 대한 설명을 남겨주세요." id="customDescription"></textarea>
					</div>
					<div id="div5">
						<form id = "uploadForm" method="post" enctype="multipart/form-data">
							<input type="file" id="btn-imageImport">
						</form>
					</div>	
					<div id="div6"><button id ="btn-reg">등록</button></div>
				
			</div>
		</td>
				
	</tr>
	</table>	
</div>
<input type="hidden" id="log" value=<%=log%>>
<jsp:include page="../../partials/footer.jsp"></jsp:include>
<script>
  document.getElementById("btn-imageImport").addEventListener	("change",function(event){
	  
	  let fileList = event.target.files;
      
      if (fileList.length > 0) {
          let selectedImage = document.getElementById("selectedImage");
          selectedImage.src = URL.createObjectURL(fileList[0]);
          selectedImage.style.visibility = "visible"; 
      }	
  });
	
	
	
  let addCustom = function(event) {
	  	
		if($log.value == "null"){
			alert("로그인 후 이용가능합니다");
			location.href = "../member/loginForm.jsp";
			return false;
		}else if($customName.value.trim() === ""){
			alert("제목을 입력해주세요");
			return false;
			
		}else if($imgaeFiles.files.length == 0 ){
			alert("이미지를 첨부해주세요");
			return false;
			
		}
		
		let fileList = document.getElementById("btn-imageImport").files;
		
		let formData = new FormData();
		formData.append("customName", $customName.value);
        formData.append("customDescription", $customDescription.value);
        formData.append("log", $log.value);
        formData.append("customImage", fileList[0]);
		
		
		$.ajax({
			type: "post",
			url : "customInsertPro.jsp",
			data: formData,
		    processData: false,
	        contentType: false,
		    success: function(data) {
		    		alert("등록되었습니다.");
		    		location.href="customView.jsp";
		    },
		    error: function() {
				alert("저장 실패! 다시 시도해보세요");
			}
		});
	}

	let $customName = document.getElementById("input1");
	let $customDescription = document.getElementById("customDescription");
	let $log = document.getElementById("log");
	
	let $imgaeFiles = document.getElementById("btn-imageImport");
	
	let $regButton = document.getElementById("btn-reg");
	$regButton.addEventListener("click", addCustom);
	
	
	
	
	
	let checkName = function(event) {
			
		$.ajax({
		    type: "post",
		    url: "checkNamePro.jsp",
		    data: {
		        customName: $customName.value
		    },
		    success: function(data) {
		    		
				if(data.trim() === "0") {
					alert("중복된 제목입니다.");
					$customName.value = "";
					$customName.focus();
				} else {
					alert("사용할 수 있는 제목입니다.");
					$customName.focus();
				}
		    },
		    error: function() {
		        alert("중복확인 에러");
		    }
		});
		}
		let $checkButton = document.getElementById("btn-check");
		$checkButton.addEventListener("click", checkName);
  
</script>
</body>
</html>