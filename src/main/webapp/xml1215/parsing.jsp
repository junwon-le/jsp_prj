<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../fragments/siteProperty.jsp" %>

<!DOCTYPE html>
<html lang="en" data-bs-theme="auto">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">

<title>JSP템플릿</title>
<link rel="shortcut icon" href="http://192.168.10.68/jsp_prj/common/images/favicon.ico">

<script src="http://192.168.10.68/jsp_prj/common/js/color-modes.js"></script>
<!-- bootstrap CDN 시작 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>

<meta name="theme-color" content="#712cf9">
<link href="http://192.168.10.68/jsp_prj/common/css/carousel.css" rel="stylesheet">
<jsp:include page="../fragments/bootstrap_css.jsp"></jsp:include>
<style type="text/css">
#wrap{  margin: 0px auto; width: 1200px; height: 1000px; }   
#header{ height: 150px;    }   
#container{ height: 700px;    }   
#footer{ height: 150px;}   
</style>
<!-- jQuery CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<script type="text/javascript">
$(function(){
   $("#btn").click(function(){
	   $.ajax({
		   url:"hello.jsp",
		   dataType:"xml",
		   error : function(xhr){
			   alert("죄송");
			  	console.log(xhr.status);
		   },
		   success : function(xmlDoc){
			   $("#name").val($(xmlDoc).find("name").text());
			   $("#age").val($(xmlDoc).find("age").text());
			   $("#addr").val($(xmlDoc).find("addr").text());
		   }
	   });//ajax
   });//btn
   $("#btn2").click(function(){
	   $.ajax({
		   url:"deptInfo.jsp",
		   dataType:"xml",
		   error : function(xhr){
			   alert("죄송");
			  	console.log(xhr.status);
		   },
		   success : function(xmlDoc){
			   
				  /* $("#table > tbody >tr").remove(); */
				  $("#table > tbody").empty();
				
			   //반복되는 노드중 부모를 찾아서 반속을 시킴
			   $(xmlDoc).find("dept").each(function(i, deptNode){
				  tr="<tr>"+
				  "<td>"+$(deptNode).find("deptno").text()+"</td>"
				  "<td>"+$(deptNode).find("dname").text()+"</td></tr>";
				  $("#table > tbody:last").append(tr);
			   
			   })
		   }
	   });//ajax
   });//btn2
});//ready

</script>


</head>
<body>
   <header data-bs-theme="dark">
      <jsp:include page="../fragments/header.jsp"/>
   </header>
   <main>
      <jsp:include page="../fragments/carousel.jsp"/>
      <!-- Marketing messaging and featurettes
  ================================================== -->
      <!-- Wrap the rest of the page in another container to center all the content. -->
      <div class="container marketing">
         <!-- Three columns of text below the carousel -->
         <!-- /.row -->
         <!-- START THE FEATURETTES -->
         <hr class="featurette-divider">
         <div class="row featurette">
            <div class="col-md-7">
               <input type="button" value="요청" class="btn btn-info btn-sm" id="btn"/>
               <input type="text" name="name" id="name" placeholder="이름"/>
               <input type="text" name="age" id="age" placeholder="나이"/>
               <input type="text" name="addr" id="addr" placeholder="주소"/>
               
            </div>
            <div>
            <input type="button" value="xml 요청2" class="btn btn-info btn-sm" id="btn2"/><br>
            <table class ="table table-hover" id="table">
            <thead>
            <tr>
            <th>부서번호</th>
            <th>부서명</th>
            </tr>
            </thead>
            <tbody>
            </tbody>
            </table>
            
            </div>
         </div>
         <hr class="featurette-divider">
         <!-- /END THE FEATURETTES -->
      </div>
      <!-- /.container -->
      <!-- FOOTER -->
      <footer class="container">
    	<jsp:include page="../fragments/footer.jsp"></jsp:include>
      </footer>
   </main>
   
</body>
</html>