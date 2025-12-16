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

<title>파일 업로드</title>
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
   $("#btnFile").click(function(){
	   $("#upfile").click();//파일을 선택하면 파일이 변경 ( change event 발생)
   });//click
   $("#upfile").change(function(evt){
	   //미리보기 
      //1.HTML File Control 접근
	   var file = evt.target.files[0];
	   //2.스트리 생성
	var reader = new FileReader();
	   //3. File객체의 onload 이벤트 핸들러를 설정하여 <img 태그에 src속성에 파일명을 설정
	   reader.onload= function(evt){
	   $("#preview").prop("src",evt.target.result);
	   
	   }//end if
	   //4. 스트림을 사용하여 <img 태그 이미지 로딩
	   reader.readAsDataURL(file);
	   
	   
	   
	   //업로드 가능 확장자는 gif,jpg,png,bmp만 가능하도록 체크하는 코드. 
	   /*
	   var blockExt ="gif,jpg,png,bmp".split(","); 
	   var file = $("#upfile").val();
	   var ext = file.substring(file.lastIndexOf(".")+1);
	   var flag = false;
		for( var i =0 ; i< blockExt.length;i++){
			if(blockExt[i]==ext){
				flag = true;
			}//end if
			
		}//end for
		
		if(!flag){
			alert("업로드 가능한 파일은 gif,jpg,png,bmp만 가능합니다. ")
			return;
		} 
		*/
	   //파일이 변경되면 변경된 파일명을 div에 넣는다.
	   $("#selectFile").html($("#upfile").val());
   })//change
   $("#btnUpload").click(function(){
	   if($("#uploader").val() ==""){
		   alert("업로더는 필수!!");
		   return;
	   }//if
	   if($("#upfile").val() ==""){
		   alert("파일은 필수!!");
		   return;
	   }
	   $("#frm").submit();
   });
   
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
	            <h2>파일 업로드</h2>
	            <!--
	            application/x-www-form-urlencoded : 파라메터 전송방식
	            multipart/form-data : 파일/binary 전송 방식 
	            -->
             	<form action="uploadFrmProcess.jsp" method="post" enctype="multipart/form-data" id="frm">
             	<label>업로더</label>
             	<input type="text" name="uploader" id="uploader"><br>
             	<label>대상 연령</label>
             	<c:forEach var="age" begin="10" end="80" step="10">
             	<input type="checkbox" name="age" value="${age}">
             	<c:out value="${age }대"/>
             	</c:forEach>             		
             	<br>
             	
             	<label>파일</label><br>
             	<img src="../upload/default_img.png" style="width:100px; height:100px; border-radius: 50px;" id="preview"/>
        		<input type="button" value="파일선택" class="btn btn-success btn-sm" id="btnFile"/><br>
        		업로드는 이미지만 가능합니다.(jpg, gif, png, bmp)
        		<div id="selectFile"></div>
<!--          	<input type="file" accept=".jpg, .gif, .png, .bmp" name="upfile" id="upfile" style="display:none"/><br> -->
            	<input type="file" accept="image/*" name="upfile" id="upfile" style="display:none"/><br>
            	
        		<input type="button" value="업로드" class="btn btn-success btn-sm" id="btnUpload"/><br>
             	</form>
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