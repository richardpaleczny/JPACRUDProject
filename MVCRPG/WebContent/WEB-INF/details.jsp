<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RPG Details</title>
</head>
<body>

	<h2>RPG Details</h2>

	<c:forEach var="rpg" items="${rpgList }">

	<h3>Title: ${rpg.title }</h3>
	

	</c:forEach>
</body>
</html>