<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
body {
	background-color: #F7FFD9;	
}
</style>
<title>error 페이지!</title>
</head>
<body>
	<div style="text-align: center;">
	<h1>500 ERROR ! </h1>
	${msg}
	<h1><img src="<c:url value="/resources/user/error500.jpg"/>"></h1>
	</div>
</body>
</html>