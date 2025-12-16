<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String requestColorCss ="";

if( "GET".equals(request.getMethod())){
	requestColorCss= "blue";
}else{
	requestColorCss = "red";
}
%>
	<strong style="color : <%= requestColorCss %>"><%= request.getMethod() %></strong>방식의 요청
	<br>
	<a href="javascript:history.back(1)">뒤로</a>
</body>
</html>