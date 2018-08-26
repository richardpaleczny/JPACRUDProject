<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JPACRUD Project Homepage</title>
</head>
<body>

	<div>
		<h2>Welcome to the JPACRUD Project Homepage</h2>
		<h3>Author: Richard Paleczny</h3>
		<h3>Theme: Some of my Favorite RPG Games</h3>
	</div>

	<br>

	<form action="details.do">
		<label for="searchRPGByID">Search for an RPG by ID: </label> <input
			type="text" name="rpgID" /> <input type="submit" value="Submit" />
	</form>

	<br>

	<form action="displayAddRPGForm.do">
		<input type="submit" value="Add an RPG to the Database" />
	</form>

	<c:if test="${wasButtonClickedForAddRPG}">

		<br>

		<form action="addRPG.do" method="POST">
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

			<input type="submit" value="Add RPG" />

		</form>

	</c:if>

	<br>

	<form action="displayList.do">
		<input type="submit" value="Display all RPGs" />
	</form>

	<br>

	<c:choose>
		<c:when test="${wasButtonClickedForListRPGs}">
			<table>
				<tr>
					<th></th>
					<th>Title</th>
					<th>Developer</th>
					<th>Release Year</th>
					<th>Reception</th>
				</tr>
				<c:forEach var="rpg" items="${rpgList}">
					<tr>

						<td align="center"><img src="${rpg.urlImage}"
							alt="RPG Box Image" height="100" width="100">
							<table>
								<tr>
									<td><form action="details.do">
											<input type="submit" value="Details"> <input
												type="hidden" name="rpgID" value="${rpg.id}">
										</form></td>
									<td><form action="displayEdit.do">
											<input type="submit" value="Edit"> <input
												type="hidden" name="listEditID" value="${rpg.id}">
										</form></td>
									<td><form action="deleteRPG.do" method="POST">
											<input type="submit" value="Delete"> <input
												type="hidden" value="${rpg}">
										</form></td>
								</tr>
							</table></td>

						<td>${rpg.title}</td>
						<td>${rpg.developer}</td>
						<td>${rpg.releaseYear}</td>
						<td align="center"><a href="${rpg.urlReview}">${rpg.title}
								Review</a></td>

					</tr>
					<c:if test="${wasButtonClickedForEditRPG && rpg.id == listEditID}">
						<tr>
							<td><strong>Edit Fields</strong>
								<form action="editRPG.do" method="POST">
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
										name="updateID" value="${rpg.id}" />
								</form>
						</tr>
					</c:if>
					<tr>
						<td><br></td>
					</tr>

				</c:forEach>
			</table>
		</c:when>
		<c:otherwise>
		</c:otherwise>
	</c:choose>

</body>
</html>