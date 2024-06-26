<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <style>
    * {
    	margin: 0;
    	padding: 0;
    	align: center;
    }

        #content-login {
            margin: 0 auto;
            width: 450px;
    		height: 300px;
        }
        #title, #loginPro {
            text-align: center;
        }
        
        h1 {
        	text-align: center;
        	font-size: 40px;
        	color: #F986BD;
        }
        button {
			width: 350px;
			height: 30px;
        	background-color: black;
        	color: white;
        	font-size: 16px;
        	padding: 0px;
        	margin: 0px;
        	cursor: pointer;
        }
        .dis {
        	display: flex;
         	justify-content: right;
         	font-size: 13px;
         	text-decoraion: none;

        }

        
        hr {
        	align: center;
        	border: 1px solid black;
        	margin: 50;
        	
        }
        text {
        	width: 200px;
        	height: 20px;
        	

        
        }
        #input-memberId, #input-memberPw {
        	width: 250px;
        	height: 30px;
        	margin: 0;
        	
        }
        .dis2 {
        	width: 200px;
        	align: right;
        	padding-left: 50px;

        }
        .dis3 {
        	padding-right: 50px;
        }	
		#kakao-login-btn {

			margin: 0;
			padding: 0;

		}
		a {
		text-decoration: none;
		}
		
		#kakao {
			align: center;
			border-align: 30px;


		}
	#ad {
		padding-right: 3px;
	}
        td {
        height: 40px;
        }
    </style>
</head>
<body>
	<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.7.1/kakao.min.js"
	  integrity="sha384-kDljxUXHaJ9xAb2AzRd59KxjrFjzHa5TAoFQ6GbYTCAG0bjM55XohjjDT7tDDC01" crossorigin="anonymous">
	</script>
	
	<script>
	  Kakao.init('f91bafbecda43f8129291830c2ecab26'); // 사용하려는 앱의 JavaScript 키 입력
	</script>
	
	<jsp:include page="../../partials/header.jsp"></jsp:include>
	
	<br><br><br><br><br><br><br><br>
	
	
	
   <table id="content-login">

        <tr>
            <td colspan="2" id="title"><h1>로그인</h1></td>
            
        </tr>

        <tr>
        	<td colspan="2" ><hr align="center"></td>
        </tr>
        <tr>
        	
        </tr>
        
        <tr >
            <td class="dis2">아이디</td>
            <td class="dis3"><input type="text" id="input-memberId" value="qwer1234"></td>
        </tr>
        <tr>
            <td class="dis2">비밀번호</td>
            <td class="dis3"><input type="text" id="input-memberPw" value="Qwer1234!"></td>
        </tr>
        <tr  align="center">
            <td colspan="2" id="title" align="center">
	            <div class="dis">
	    	        <a href="findIdForm.jsp">아이디 찾기</a>
		        	<p>&nbsp; | &nbsp;</p> 
		        	<a href="findPwForm.jsp">비밀번호 찾기</a> 
		        	<p>&nbsp; | &nbsp;</p> 
		        	<a href="joinForm.jsp">회원가입</a>
				</div>
            </td>
        </tr>

        <tr>
            <td colspan="2" id="loginPro">
                <button id="button-memberLoginPro">로그인</button>
            </td>
        </tr>
        <tr id="kakao">
				<td colspan="2" align="center">
				<a id="kakao-login-btn" href="javascript:loginWithKakao()">
				  <img src="../../images/kakao_login.png" width="350px"
				    alt="카카오 로그인 버튼" />
				</a>
				</td>
			</tr>
    </table>
    
    <br><br><br><br>

    <script>
    
	        let memberLoginPro = (event) => {
	        	
	            if($inputMemberId.value == "") {
	                alert("아이디를 입력해주세요.");
	                $inputMemberId.focus();
	                return false;
	            }
	            if($inputMemberPw.value == "") {
	                alert("비밀번호를 입력해주세요.");
	                $inputMemberPw.focus();
	                return false;
	            }
	            $.ajax({
					type: "post",
					url: "loginPro.jsp",
					data: {
						id: $inputMemberId.value,
						pw: $inputMemberPw.value
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
						if(checkValue.trim() === "-1") {
							alert("아이디와 비밀번호를 확인해주세요.");
							$inputMemberId.value = "";
							$inputMemberPw.value = "";
							$inputMemberId.focus();
						} else {
							alert("로그인 성공");
								location.href="../../index.jsp";
						}
					},
					error: function() {
						alert("error loginForm");
					}
					});
	            
	           
					return true;
	    	   	};

	
	        
	        let $inputMemberId = document.querySelector("#input-memberId");
	        let $inputMemberPw = document.querySelector("#input-memberPw");
	        let $buttonMemberLoginPro = document.querySelector("#button-memberLoginPro");
	
	        $buttonMemberLoginPro.addEventListener("click", memberLoginPro);
	        
	        function loginWithKakao() {
	    	    Kakao.Auth.authorize({
	    	      redirectUri: 'http://localhost:8989/Project_Baskin/baskinrobbins/pages/member/kakaoLoginPro.jsp',
	    	    }); 
	      }
	        
	    
    </script>
	
</body>
</html>