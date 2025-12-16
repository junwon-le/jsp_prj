<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en" data-bs-theme="auto">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">

<title>JSP템플릿</title>
<link rel="shortcut icon"
	href="http://192.168.10.68/jsp_prj/common/images/favicon.ico">

<script src="http://192.168.10.68/jsp_prj/common/js/color-modes.js"></script>
<!-- bootstrap CDN 시작 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
	crossorigin="anonymous"></script>

<meta name="theme-color" content="#712cf9">
<link href="http://192.168.10.68/jsp_prj/common/css/carousel.css"
	rel="stylesheet">

<!-- jQuery CDN 시작 -->
<script 
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<script type="text/javascript">
	$(function() {
		$("#btn").click(checkNull);//click

		$("#name").keydown(function( evt ){
			//엔터가 쳐졌을 때만 null 유효성 검증
			if(evt.which == 13){
				checkNull();
			};
		});

	});//ready
	function checkNull() {
		var name = $("#name").val();

		if (name.replace(/ /g, "") == "") {
			alert("이름은 필수 입력!!");
			$("#name").focus();
			return;
		}
		$("#frm").submit();
	}
</script>


</head>
<body>
<strong>세션 사용</strong>
	<form name="frm" id="frm" action="use_session_b.jsp" >
		<label for="name">이름 </label> <input type="text" name="name" id="name" />
		<input type="text" style="display:none;" />
		<input type="button" value="입력" id="btn" class="btn btn-info" />
	</form>


</body>
</html>