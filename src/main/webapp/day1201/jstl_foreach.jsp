<%@page import="day1127.DataDTO"%>
<%@page import="java.util.List"%>
<%@page import="day1201.CollectionService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<jsp:include page="../fragments/bootstrap_css.jsp"></jsp:include>
<style type="text/css">
#wrap {
	margin: 0px auto;
	width: 1200px;
	height: 1000px;
}

#header {
	height: 150px;
}

#container {
	height: 700px;
}

#footer {
	height: 150px;
}
</style>
<!-- jQuery CDN 시작 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<script type="text/javascript">
	$(function() {

	});//ready
</script>


</head>
<body>
	<header data-bs-theme="dark">
		<jsp:include page="../fragments/header.jsp" />
	</header>
	<main>
		<jsp:include page="../fragments/carousel.jsp" />
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
					<c:forEach var="i" begin="1" end="10" step="2">
						<c:out value="${i}"></c:out>
					</c:forEach>

					<select>
						<c:forEach var="i" begin="11" end="10" step="1">
							<!-- 양수만 가능 -->
							<option value="${i }"><c:out value="${i }"></c:out></option>
						</c:forEach>
					</select>
				</div>
				<%
				//업무를 처리할 수 있는 클래스를 생성
				CollectionService cs = new CollectionService();
				//1. 값을 받아와서 
				String[] arrData = cs.arr();
				List<String> listData = cs.list();
				//2. scope객체 할당 -> EL에서 사용하기 위해서
				pageContext.setAttribute("list", listData);
				pageContext.setAttribute("arr", arrData);
				%>
				<div>
					<strong>배열</strong>
					<table>
						<thead>
							<tr>
								<th>번호</th>
								<th>이름</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="arr" items="${arr }" varStatus="i">
								<tr>
									<c:if test="${i.first }">
										<td colspan="2">테이터를 출력하기 전에 재공할 내용.</td>
									</c:if>
								</tr>
								<tr>

									<td><c:out value="${i.index}" /></td>
									<td><c:out value="${i.count}" /></td>
									<td><c:out value="${i.first}" /></td>
									<td><c:out value="${i.last}" /></td>
									<td><c:out value="${arr}" /></td>
								</tr>
								<tr>
									<c:if test="${i.last }">
										<td colspan="2">테이터를 출력된 후에 재공할 내용.</td>
									</c:if>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>


				<div>
					<strong>java.util.List</strong><br> 다음중 고객 정보가 가장 많이 털린 사이트는?<br>
					<c:forEach var="site" items="${list }" varStatus="i">
						<c:out value="${i.count }" />
						<input type="radio" name="site" value="${site }">
						<c:out value="${site }" />



					</c:forEach>

				</div>


				<%
				//1. 데이터 얻기
				List<DataDTO> dtoList = cs.searchMember();
				//2. scope 객체에 데이터 추가 -> EL은 변수에 직접 접근 x
				pageContext.setAttribute("membersData", dtoList);
				pageContext.setAttribute("poll", cs.poll());
				pageContext.setAttribute("notice", cs.notice());
				%>
				<div>
					<strong>DTO가 방의 값인 java.util.List</strong><br>
					<!-- 3.JSTL에서 EL을 사용하여 값을 사용자에게 제공.  -->
					<table>
						<thead>
							<tr>
								<th>번호</th>
								<th>이름</th>
								<th>나이</th>
							</tr>
						</thead>
						<tbody>
						<tr>
						 <td colspan="3" ><c:out value="${poll }"/> </td>
						</tr>
						<tr>
						 <td colspan="3" ><c:out value="${notice }"/> </td>
						</tr>
						
							<c:forEach var="member" items="${membersData }" varStatus="i">
							<c:set var="totalAge" value="${member.myAge+totalAge }" />
							<tr>
								<%-- <c:out value="${ member }" /> --%> <!-- 주소만 출력 -->
								<td><c:out value="${i.count }"/></td>
								<td><input type="text" name="name" value="${member.name }"/></td>
								<td><input type="text" name="age" value="${member.myAge }"/></td>

							</tr>
							<c:if test="${i.last}">
							<tr>
								<td colspan="2"><c:out value="${totalAge }"/></td>
							</tr>
							</c:if>
							</c:forEach>
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