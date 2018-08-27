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

		<form action="displayEdit.do">
			<input type="submit" value="Edit"> <input type="hidden"
				name="detailsEditID" value="${RPG.id}">
		</form>

		<c:if test="${wasButtonClickedForEditRPG}">
			<form action="editRPG.do" method="POST">
				<br> <strong>Edit Fields</strong>
				<table>
					<tr>
						<td><label for="title">Title:</label></td>
						<td><input type="text" name="title" /></td>
					</tr>
					<tr>
						<td><label for="description">Description:</label></td>
						<td><input type="text" name="description" /></td>
					</tr>
					<tr>
						<td><label for="developer">Developer:</label></td>
						<td><input type="text" name="developer" /></td>
					</tr>
					<tr>
						<td><label for="publisher">Publisher:</label></td>
						<td><input type="text" name="publisher" /></td>
					</tr>
					<tr>
						<td><label for="releaseYear">Release Year:</label></td>
						<td><input type="text" name="releaseYear" /></td>
					</tr>
					<tr>
						<td><label for="urlImage">Image URL:</label></td>
						<td><input type="text" name="urlImage" /></td>
					</tr>
					<tr>
						<td><label for="urlReview">Review URL:</label></td>
						<td><input type="text" name="urlReview" /></td>
					</tr>
				</table>
				<input type="submit" value="Update" /> <input type="hidden"
					name="updateID" value="${RPG.id}" />
			</form>
			<br>
		</c:if>

		<form action="deleteRPG.do" method="POST">
			<input type="submit" value="Delete"> <input type="hidden"
				name="deleteID" value="${RPG.id}" />
		</form>
	</c:if>

</body>
</html>