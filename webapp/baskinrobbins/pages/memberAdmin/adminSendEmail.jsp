<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	 <style>
       table, tr, td {
           border: 1px solid black;
           border-collapse: collapse;
       }
       #content-adminSendEmail {
           margin: 0 auto;
       }
       #title {
			text-align: center;
       }
       h1 {
       color: #f986bd;
       margin-bottom: 30px;
       font-size: 40px;
       }
       td {
       padding: 8px;}
       input[type="button"] {
            background-color: #BDBDBD;
            color: white;
            border-style: none;
            cursor: pointer;
            padding: 4px;
       }
       tr {
       text-align: center;
       }
       
	</style>  
	
	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/@emailjs/browser@3/dist/email.min.js"></script>

<!--  여기수정  -->
</head>
<body>	


  	<jsp:include page="../../partials/header.jsp"></jsp:include>
<br><br><br><br><br><br><br>
<div align="center">
<h1>회원에게 이메일 보내기</h1>
	<table id="content-adminSendEmail">
		
		<tr>
			<td colspan="2"><h3>Gmail로만 전송 가능합니다.</h3></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text"  id="to_name" placeholder="이름을 입력해주세요"></td>
		</tr>
		<tr>
			<td>이메일 주소</td>
			<td><input type="text" id="email" , placeholder="메일주소를 입력해주세요"></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea id="message" rows="5" placeholder="내용을 입력해주세요 "></textarea></td>
		</tr>
		<tr>
			<td colspan="2"><input type="button" id="button-submitEmail"  value="메일보내기"/></td>
		</tr>
	</table>
</div> 

<script>

	function submitEmail(){
		
		let data = {	
	      		//각 요소는 emailJS에서 설정한 템플릿과 동일한 명으로 작성!  	  	
	            from_name: '관리자',
	            to_name: document.querySelector("#to_name").value  , 
	            email_id :  document.querySelector("#email").value  , 
	            message : document.querySelector("#message").value  , 
	       	};
	        emailjs.send('service_1pktn67', 'template_hu9xjo5', data)
	     	//emailjs.send('service ID', 'template ID', 보낼 내용이 담긴 객체)
	       	    .then(function(response) {
	       	       console.log('SUCCESS!', response.status, response.text);
	       	     
	       	       alert("메일을 성공적으로 전송하였습니다.");
	       	       location.href="adminMain.jsp";
	       	       
	       	    }, function(error) {
	       	       console.log('FAILED...', error);
	       	    });
	    
	}

	emailjs.init("cKXDFdLHPN-B__rLT");		
	
	let $submitEmail = document.querySelector("#button-submitEmail");
	$submitEmail.addEventListener("click", submitEmail);
	

</script>
</body>
</html>

