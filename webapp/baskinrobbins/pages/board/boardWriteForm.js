let boardMain = (event) => {
	event.preventDefault();
	location.href='boardMain.jsp';
}

let boardWritePro = (event) => {
	console.log("되냐?");
	event.preventDefault();

	// 제목 입력 확인
	if($subject.value == "") {
		$subject.focus();
		alert("제목을 입력해주세요.");
		return false;
	}

	// 내용 입력 확인
	if($content.value == "") {
		$content.focus();
		alert("내용을 입력해주세요.");
		return false;
	}
	
	// 제목 글자 수 확인
	if($subject.value.length > 14) {
		$subject.focus();
		alert("제목은 14글자까지만 입력 가능합니다.");
		return false;
	}

	let form = $('#FILE_FORM')[0];
	let formData = new FormData(form);

	$.ajax({
		url: 'boardWritePro.jsp',
		processData: false,
		contentType: false,
		data: formData,
		type: 'POST',
		success: function(){
			alert("게시글을 작성했습니다.");
			location.href="boardMain.jsp";
		},
	});

	return true;
}

const $writer = document.querySelector("#writer");
const $subject = document.querySelector("#subject");
const $content = document.querySelector("#content");

const $btnBoardMain = document.querySelector("#button-boardMain");
		$btnBoardMain.addEventListener("click", boardMain);
const $btnBoardWritePro = document.querySelector("#button-boardWritePro");
		$btnBoardWritePro.addEventListener("click", boardWritePro);