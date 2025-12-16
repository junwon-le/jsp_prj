<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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

		$("#name").keydown(function(evt) {
			//엔터가 쳐졌을 때만 null 유효성 검증
			if (evt.which == 13) {
				checkNull();
			}
			;
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
<%
//1. 쿠키들 읽기 : JSESSIONID는 tomcat에서 생성하는 쿠키
Cookie[] cookies = request.getCookies();
List<String> cookieName = new ArrayList<String>();
List<String> cookieValue = new ArrayList<String>();

boolean flag = false;
if(cookies != null){//읽어 들인 쿠키가 존재?
		//쿠키를 읽기
		Cookie tempCookie=null;
 		for(int i=0; i< cookies.length; i++){
 			tempCookie = cookies[i];
 			if(!"JSESSIONID".equals(tempCookie.getName())){//JESSIONID가 아닌 쿠키가 있음.
 			flag=true;
 			cookieName.add(tempCookie.getName());  //쿠키 이름
 			cookieValue.add(tempCookie.getValue()); //쿠키 값
 		 			
 			}//end if
 		}//end for
}//end if


%>
<% if(!flag){
	%>
	<strong>쿠키 사용</strong>
	<form name="frm" id="frm" action="use_cookie_b.jsp">
		<table>
			<tr>
				<td><label for="name">이름 </label></td>
				<td><input type="text" name="name" id="name" tabindex="1" /></td>
				<td rowspan="2"><input type="button" value="입력" id="btn"
					class="btn btn-info" style="height: 68px; width: 80px;" /></td>
			</tr>
			<tr>
				<td><label for="name">나이 </label></td>
				<td><input type="text" name="age" id="age" tabindex="2" /></td>
			</tr>
		</table>
	</form>
<% 
}else{//쿠키가 있음
	for( int i=0; i < cookieName.size(); i++){
		%>
		쿠키명 : <%=cookieName.get(i)%><br>
		쿠키값 : <%=cookieValue.get(i)%><br>
		<%
	}
%>
<a href="use_cookie_c.jsp">쿠키 삭제</a>
<%
}
%>

</body>
</html>