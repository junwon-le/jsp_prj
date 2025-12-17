<%@page import="kr.co.sist.borad.BoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../fragments/siteProperty.jsp" %>
<%@ include file="../fragments/loginChk2.jsp" %>
<%
request.setCharacterEncoding("UTF-8"); //위에 써야 된다~!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
%>
<jsp:useBean id="bDTO" class="kr.co.sist.borad.BoardDTO" scope="page"/>
<jsp:setProperty property="*" name="bDTO"/>
<%

//web parameter로 title, content입력 되고 
// 그 외 ip- request내장 객체 , id session에서 얻어야한다.
bDTO.setIp(request.getRemoteAddr());
bDTO.setId((String)session.getAttribute("userId"));

BoardService bs = BoardService.getInstance();
boolean flag = bs.modifyBoard(bDTO);
pageContext.setAttribute("flag" , flag);

%>
<script type="text/javascript">
<c:choose>
<c:when test="${flag}">
	var msg= "글 수정 성공.";
	
	alert(msg+"${bDTO.title}");
	location.href = "boardList.jsp?currentPage=${param.currentPage}";
</c:when>
<c:otherwise>
	msg = "글 수정 중 문제가 발생 하였습니다.";
	alert(msg);
	history.back();
</c:otherwise>
</c:choose>
</script>