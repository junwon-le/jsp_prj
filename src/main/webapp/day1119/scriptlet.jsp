<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function result(num, num2,result){
	alert ( num +"x"+num2 +"="+(num*num2)+"/"+result);
}
</script>
</head>
<body>
<%//scriptlet => JSP가 Java로 변경될 때 _javascript()안에 코드가 생성된다.
String name ="이준원";
%>
안녕하세요? <span><%= name %></span>님<br>
<ul>
<% 
 for(int i=0; i<10; i++){	

%>
<li><%= i %></li>

<%
} 
%>
</ul>
<!-- 테이블에 구구단 2단을 출력 -->
<table border="1">
<tr>
<%
for(int i=1; i<10;i++){
%>
<th onclick="result(2,<%=i%>,<%=2*i%>)">2 x <%=i %></th>
<%
}
%>
</tr>
</table>
<!--  -->
<div>
<%for(int i=0; i<7;i++){%>
<h<%=i %>>안녕하세요</h<%=i %>>
<%
}//end for
%>

</div>

<div>
구구단 모든 단을 테이블로 출력
<table border=1>
<%for(int i =1; i<10;i++){
	%>
<tr>

<%for(int j =2; j<10;j++){
	%>
	<th><%=j%>x<%=i%>=<%=j*i %> </th>
	<%}//end for %>
	
</tr>
<%} //end for%>
</table>

</div>

</body>
</html>