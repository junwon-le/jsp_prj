<%@page import="java.io.IOException"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../fragments/siteProperty.jsp" %>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en" data-bs-theme="auto">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">

<title>JSP템플릿</title>
<script src="http://192.168.10.77/jsp_prj/common/js/color-modes.js"></script>

<link rel = "shortcut icon" href="http://192.168.10.77/jsp_prj/common/images/favicon.ico">
<!-- bootstrap CDN 시작 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
<!-- bootstrap CDN 끝 -->


<meta name="theme-color" content="#712cf9">
<link href="http://192.168.10.77/jsp_prj/common/css/carousel.css" rel="stylesheet">
<jsp:include page="../fragments/bootstrap_css.jsp"/>
<style type="text/css">

#wrap{ margin: 0px auto; width:1200px; height:1000px;}

#header{ height:150px; /* background-color: #4179C2 */}
#container{ height:700px; /* background-color: #71B75E */}
#footer{ height:150px; /* background-color: #EF6E1 */}
</style>
<!-- jQuery CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){

   
});//ready

</script>
</head>
<body>
   <header data-bs-theme="dark">
      <jsp:include page="../fragments/header.jsp"/>
   </header>
   <main>
      
      <!-- Marketing messaging and featurettes
  ================================================== -->
      <!-- Wrap the rest of the page in another container to center all the content. -->
      <div class="container marketing">
         <!-- START THE FEATURETTES -->
         <hr class="featurette-divider">
         <div class="row featurette">
            <div class="col-md-7">
            <%-- <%
            
            enctype="multipart/form-data" 였을 때는 기존 방식으로 web parameter처리가
            될 수 없다 => 파일 업로드 컴포넌트를 사용.   
            String upload=request.getParameter("uploader");
            
            %>      
            <%= upload %>,${param.uploader}       --%>   
            
            <%
               request.setCharacterEncoding("UTF-8");
               
            
            %>
             업로더 : <c:out value="${param.uploader}"/><br>
            대상층 연령 : ;
               <c:forEach var="age" items="${paramValues.age}">
                  <c:out value="${age }"/> 
               </c:forEach>
               <br>
            파일명 : <c:out value="${param.profile}"/>
            <a href ="view_img.jsp?img=${ fileSystemName}">이미지 보기</a>
            </div>
         </div>
         <hr class="featurette-divider">
      </div>
      <!-- /.container -->
      <!-- FOOTER -->
      <footer class="container">
         <jsp:include page="../fragments/footer.jsp"/>
      </footer>
   </main>

</body>
</html>