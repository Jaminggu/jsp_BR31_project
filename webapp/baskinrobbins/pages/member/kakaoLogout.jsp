<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.7.1/kakao.min.js"
  integrity="sha384-kDljxUXHaJ9xAb2AzRd59KxjrFjzHa5TAoFQ6GbYTCAG0bjM55XohjjDT7tDDC01" crossorigin="anonymous">
</script>

<script>
	Kakao.init('f91bafbecda43f8129291830c2ecab26');
</script>

<script>
	function loginoutKakao() {
	  
		console.log('logoutpro');
		<% session.removeAttribute("log"); %>
		
		let client_id = 'db082c5bd0f3f5567e652944e6db0ee9';
		let logout_redirect_uri = 'http://localhost:8989/Project_Baskin/baskinrobbins/member/kakaoLoginPro.jsp';
		
		
		let str = '';
		str += 'https://kauth.kakao.com/oauth/logout?client_id=';
		str += client_id;
		str += '&logout_redirect_uri=';
		str += logout_redirect_uri;
		
		window.location.href = str;
		
	}
  
	loginoutKakao();
  
</script>