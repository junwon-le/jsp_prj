<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<c:if test="${sessionScope.userId ==null }">
<c:redirect url="${commonURL}/login/loginFrm.jsp"/>
</c:if>