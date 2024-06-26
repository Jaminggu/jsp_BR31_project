<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">

<style>
	* {
		margin: 0 auto;
		padding: 0;
		align: center;
	}
	
	table {
		width: 450px;
		height: 350px;
		align: center;

	}
	
	h2 {
		text-align: center;
       	font-family: "jua";
       	font-size: 50px;
       	color: #F986BD;
       	width: 300px;

    }
	
	 button {
			width: 350px;
			height: 50px;
        	background-color: black;
        	border-radius: 10px;
        	color: white;
        	font-family: "jua";
        	font-size: 20px;
        	padding: 10px;
        	margin: 10px;
        	align: center;
     }
     
	 .sub {
       	padding-left: 50px;
       	width: 150px;
       	font-family: "jua";
       	
       }
      .cont {
        	padding-right: 50px;
        	
       }
      #name, #email {
        	width: 200px;
        	height: 20px;
      }
</style>
</head>
<body>
	<%--
		
		
		_12_member.sql 파일의 디비를 세팅하고 원하는 회원정보를 검색해보자.
		
		
	 --%>

	<table>
		<tr>
			<td colspan="2"><h2>비밀번호 찾기</h2></td>
		<tr>
		 <tr>
        <td colspan="2"><div><hr></div></td>
      </tr>
		<tr>
			<td class="sub">아이디</td>
			<td class="cont"><input type="text" id="id"></td>
		<tr>
		<tr>
			<td class="sub">이메일</td>
			<td class="cont"><input type="text" id="email"></td>
		<tr>
		<tr>
			<td colspan="2" align="center"><button id="button-findPwPro">확인</button></td>
		</tr>
	</table>
	
	
	<script>
		let findPwPro = (event) => {

			
			if($id.value == "") {
				alert("아이디를 입력해주세요.");
				$id.focus();
				return false;
			}
			if($email.value == "") {
				alert("이메일을 입력해주세요.");
				$email.focus();
				return false;
			}
			
			  $.ajax({
				type: "post",
				url: "findPwPro.jsp",
				data: {
					id: $id.value,
					email: $email.value
				},
				success: function(data) {
					let str = '<p id="check">';
					let length = str.length;
					let startIndex = data.indexOf(str);
					
					let checkValue = data.substr(startIndex + length);
					
					
					console.log("data = " + data);
					console.log("length = " + length);
					console.log("startIndex = " + startIndex);
					console.log("[checkValue = " + checkValue + "]");
					
					// 로그인에 실패하면
					if(checkValue.trim() === "none") {
						alert("입력한 정보로 등록된 정보가 없습니다.");
						$id.value = "";
						$email.value = "";
						$id.focus();
					} else {
						alert("고객님의 비밀번호는" +checkValue.trim()+ "입니다.");
					}
				},
				error: function() {
					alert("error findPwForm");
				}
			});  
	        
	        
	    }
			
		
		
    let $id = document.querySelector("#id");
    let $email = document.querySelector("#email");
    let $buttonMemberLoginPro = document.querySelector("#button-findPwPro");

    $buttonMemberLoginPro.addEventListener("click", findPwPro);

	</script>


	</body>
</html>