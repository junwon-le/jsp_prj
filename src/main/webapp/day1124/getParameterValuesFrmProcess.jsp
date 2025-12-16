<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//post방식 일 때 한글 처리(get방식에는 영향을 주지 않는다.)
request.setCharacterEncoding("UTF-8");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
<strong><%= request.getMethod() %></strong>방식 요청 <br>
<%
//web parameter의 이름이 같다면 배열로 처리된다.
String[] lang = request.getParameterValues("language");
String[] license = request.getParameterValues("license");

%>
<strong>선택 언어</strong>
<%
//try{
if(lang !=null){
for(int i=0; i<lang.length; i++){
 	%>
 	
 	<%= lang[i] %>  
 	
<% 
}//end for
}else{
//}catch(NullPointerException nfe){
 	%>
 	관심언어가 없음요.
 	<%
}//end else
//}//end catch
%>
<br>
<strong>자격증</strong>
<%
if("".equals(license[0]) && license.length==1){
	%>
	자격증 없음요
	<%
}//end if
for(int i=0; i<license.length;i++){
%> 
<%= license[i] %>
<%
}//end for

	
%>

</div>
</body>
</html>