<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="https://code.jquery.com/jquery-latest.min.js"></script>

<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.7.1/kakao.min.js"
  integrity="sha384-kDljxUXHaJ9xAb2AzRd59KxjrFjzHa5TAoFQ6GbYTCAG0bjM55XohjjDT7tDDC01" crossorigin="anonymous">
</script>

<script>
  Kakao.init('f91bafbecda43f8129291830c2ecab26'); // 사용하려는 앱의 JavaScript 키 입력
</script>  


	<%
		String code = request.getParameter("code");
		System.out.println(code);
	%>
	<input type="hidden" id="code" value="<%= code %>">

 <script>
 
 	let access_token = '';
 
	function name() {
		let access_code = document.querySelector("#code").value;
		console.log(access_code);
		
		$.ajax({
		    type : "POST"
		    , url : 'https://kauth.kakao.com/oauth/token'
		    , data : {
		        grant_type : 'authorization_code',
		        client_id : 'db082c5bd0f3f5567e652944e6db0ee9',		
		        redirect_uri : 'http://localhost:8989/Project_Baskin/baskinrobbins/pages/member/kakaoLoginPro.jsp',
		        code : access_code
		    }
		    , success : function(response) {
		    	console.log('login success');
		    	
		    	Kakao.Auth.setAccessToken(response.access_token);
		    	access_token = response.access_token;
		    	
	        	requestUserInfo();
		    }
		    ,error : function(jqXHR, error) {
		    	console.log('login error');
		    }
		});
	}
	
	
	 function requestUserInfo() {
		 $.ajax({
			type : "POST"
			, url : 'https://kapi.kakao.com/v2/user/me'
			, headers : {
				'Content-type': 'application/x-www-form-urlencoded;charset=utf-8'
				, 'Authorization' : 'Bearer ' + access_token
				, 'Accept' : 'applicaton/json'
			}
			, success : function(response) {
				console.log('userInfo success');
				
				let nickname = response.properties.nickname;
				
				$.ajax({
		        	type : "POST"
	    		    , url : 'kakaoLoginPro2.jsp'
	    		    , data : {nickname:nickname}
			        , success : function(response) {
			        	alert("카카오 로그인 성공");
			        	location.href="../../index.jsp";
				    }
		        });
				
			}
			, error : function() {
				console.log('userInfo error');
			}
		});
	}
	 
	 name();
	 
 </script>