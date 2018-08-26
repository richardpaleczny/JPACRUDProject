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

	<a href="index.do">Home</a>

	<h2>RPG Details</h2>

	<c:if test="${notFound}">
		<h3>RPG was not found in database</h3>
	</c:if>
	<c:if test="${!notFound}">
		<h3>${RPG.title}</h3>
		<label for="rpgDescription"><strong>Description:</strong>
			${RPG.description}</label>
		<br>
		<br>
		<label for="rpgDeveloper"><strong>Developer:</strong>
			${RPG.developer}</label>
		<br>
		<br>
		<label for="rpgPublisher"><strong>Publisher:</strong>
			${RPG.publisher}</label>
		<br>
		<br>
		<label for="rpgReleaseYear"><strong>Release Year:</strong>
			${RPG.releaseYear}</label>
		<br>
		<br>
		<label for="rpgURLReview"><strong>Reception:</strong> <a
			href="${RPG.urlReview}">${RPG.title} Review</a></label>
		<br>
		<br>
		<img src="${RPG.urlImage}" alt="RPG Box Image" height="200"
			width="200">
		<form action="goToEditPage.do">
			<input type="submit" value="Edit"> <input type="hidden"
				name="rpgID" value="${RPG.id}">
		</form>
		<form action="details.do">
			<input type="submit" value="Delete"> <input type="hidden"
				name="rpgID" value="${RPG.id}">
		</form>
	</c:if>

</body>
</html>