<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="true"%>
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
   $("#btnQs").click(function(){
	   paramQueryString();
   });//paramQueryString
   
   $("#btnJson").click(function(){
	   paramJson();
   });//paramJson
   
});//ready

function paramQueryString(){
	//queryString 형식으로 web parameter 전송
	//HTML Form Control의 이름과 name속서의 이름과 상관없이 parameter명을 만들 수 있다.
	var param = "na="+$("#name").val()+"&age="+$("#age").val();
	$.ajax({
		url:"paramProcess.jsp",
		type:"post",
		data : param,
		dataType:"JSON",
		error:function(xhr){
			$ ("#output").html(xhr.status + " / "+xhr.statusText	);
		},
		success: function( jsonObj){
			//alert(jsonObj.name + " / "+ jsonObj.age);
			var output = "<table class='table table-hover'>";
			output+= `<tr><td>${jsonObj.name}</td></tr>`;
			output+= `<tr><td>${jsonObj.age}살</td></tr>`;
			output+= `<tr><td>${jsonObj.birth}년대생</td></tr>`;
			output+= `</table>`;
				
			$("#output").html(output);
		}
	})
}

function paramJson(){
	if($("#name").val() == null){
		alert("이름 필수!");
		return;
	}
	//JSONObject 형식으로 web parameter 전송
	var param={na : $("#name").val(), age:$("#age").val()}
	$.ajax({
		url:"paramProcess.jsp",
		type:"get",
		data: param,
		dataType:"JSON",
		error:function(xhr){
			$ ("#output").html(xhr.status + " / "+xhr.statusText	);
		},
		success: function( jsonObj){
			//parsing
			var name = jsonObj.name;
			var age = jsonObj.age;
			var birth = jsonObj.birth;
			var output =`<tr><td>${name}</td><td>${age}살</td><td>${birth}년대생</td></tr>`;
				
			$("#tab tbody:last").append	(output);
			//$("#tab tbody").last().append(output);
			$("#name").val("");
			$("#age").val("");
			$("#name").focus();
			
		}
		
	})
}
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
            
               <strong>AJAX Parameter 요청</strong><br>
               <label>이름</label>
               <input type="text" name="name" id="name" autofocus="autofocus"/><br>
               <label>나이</label>
               <input type="text" name="age" id="age"/><br>
               <button id="btnQs" class="btn btn-success">QueryString 방식</button>
               <button id="btnJson" class="btn btn-info">JSONObject 방식</button>
               <div id="output"></div>
               <div id="output2">
               <table id="tab" class="table table-hover">
               <thead>
               <tr>
               <th>이름</th><th>나이</th><th>태어난 해</th>
               </tr>
               </thead>
               <tbody>
               </tbody>
               </table>
               </div>
               
               
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