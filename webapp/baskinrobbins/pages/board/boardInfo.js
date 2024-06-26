const boardMain = function() {
	console.log("메인으로!");
	location.href='boardMain.jsp';
}

const boardDeletePro = function() {
	const boardNumber = window.location.search.substring(13);
	
	$.ajax({
		type: "post",
		url: 'boardDeletePro.jsp',
		data: {
			number	: boardNumber
		},
		success: function() {
			location.href='boardMain.jsp';
		},
		error: function() {
			alert("error 발생");ㅣ
		}
	})
}

const boardNumber = window.location.search.substring(13);
const $btnBoardMain = document.querySelector(".button-boardMain");
$btnBoardMain.addEventListener("click", boardMain);
const $btnBoardDeletePro = document.querySelector(".button-boardDeletePro");
if($btnBoardDeletePro !== null) {
	$btnBoardDeletePro.addEventListener("click", boardDeletePro);
}