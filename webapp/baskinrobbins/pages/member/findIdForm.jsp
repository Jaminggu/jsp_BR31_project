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
		align: center;
		margin: 0 auto;
		padding: 0 auto;
	}
	
	body {
	   display: flex;
	   flex-direction: column;
	   align-items: center;
	}

		table {
			width: 280px;
			height: 350px;
			align: center;
			margin: 100px;
		}


		h2 {
		width: 200px
		}
        h1 {
			text-align: center;
	       	font-family: "jua";
	       	font-size: 50px;
	       	color: #F986BD;
	       	width: 250px;

        }
        .sub {
        	padding-left: 50px;
        	font-family: "jua";
        }
        .cont {
        	padding-right: 50px;
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

        td {
        align: center;
        }
        
      #name, #email {
        	width: 200px;
        	height: 20px;
        	

        
        }
        
</style>
</head>
<body>
<jsp:include page="../../partials/header.jsp"></jsp:include>
	<%--
		
		
		_12_member.sql 파일의 디비를 세팅하고 원하는 회원정보를 검색해보자.
		
		
	 --%>
<form>
	<table>
		<tr><td><h2></h2></td></tr>
		<tr><td colspan="2"><h1>아이디 찾기</h1></td></tr>
		    <tr>
        <td colspan="2"><div><hr></div></td>
      </tr>
		<tr>
			<td class="sub">이름</td>
			<td class="cont"><input type="text" id="name"></td>
		</tr>
		<tr>
			<td class="sub">이메일</td>
			<td class="cont"><input type="text" id="email"></td>
		</tr>
	
		<tr>
		<td colspan="2" align="center">
			<button id="button-findIdPro">확인</button>
		</td>
		</tr>
	</table>
</form>


	<script>
		let findIdPro = (event) => {

			
			if($name.value == "") {
				alert("이름을 입력해주세요.");s
				$name.focus();
				return false;
			}
			if($email.value == "") {
				alert("이메일을 입력해주세요.");
				$email.focus();
				return false;
			}
			
			  $.ajax({
				type: "post",
				url: "findIdPro.jsp",
				data: {
					name: $name.value,
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
						alert("입력한 정보로 등록된 아이디가 없습니다.");
						$name.value = "";
						$email.value = "";
						$name.focus();
					} else {
						alert("고객님의 아이디는" +checkValue.trim()+ "입니다.");
					}
				},
				error: function() {
					alert("error findIdForm");
				}
			});  
	        
	        
	    }
			
		
		
    let $name = document.querySelector("#name");
    let $email = document.querySelector("#email");
    let $buttonMemberLoginPro = document.querySelector("#button-findIdPro");

    $buttonMemberLoginPro.addEventListener("click", findIdPro);

	</script>


	</body>
</html>