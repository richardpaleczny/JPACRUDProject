<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RPG Edit</title>
</head>
<body>

	<h2>Edit RPG in Database</h2>

	<form action="editRPG.do" method="POST">
		<table>
			<tr>
				<td><label for="title">Title:</label></td>
				<td><input type="text" name="title" /></td>
			</tr>
			<!-- <tr>
				<td><label for="filmId">Film ID:</label></td>
				<td><input type="text" name="filmId" /></td>
			</tr> -->
			<tr>
				<td><label for="description">Description:</label></td>
				<td><input type="text" name="description" /></td>
			</tr>
			<tr>
				<td><label for="rating">Rating:</label></td>
				<td><input type="text" name="rating" /></td>
			</tr>
			<tr>
				<td><label for="releaseYear">Release Year:</label></td>
				<td><input type="text" name="releaseYear" /></td>
			</tr>
			<tr>
				<td><label for="length">Length:</label></td>
				<td><input type="text" name="length" /></td>
			</tr>
			<tr>
				<td><label for="laguage">Language:</label></td>
				<td><input type="text" name="language" /></td>
			</tr>
			<tr>
				<td><label for="languageId">Language ID:</label></td>
				<td><input type="text" name="languageId" /></td>
			</tr>
			<tr>
				<td><label for="rentalDuration">Rental Duration:</label></td>
				<td><input type="text" name="rentalDuration" /></td>
			</tr>
			<tr>
				<td><label for="rentalRate">Rental Rate:</label></td>
				<td><input type="text" name="rentalRate" /></td>
			</tr>
			<tr>
				<td><label for="replacementCost">Replacement Cost:</label></td>
				<td><input type="text" name="replacementCost" /></td>
			</tr>
			<tr>
				<td><label for="specialFeatures">Special Features:</label></td>
				<td><input type="text" name="specialFeatures" /></td>
			</tr>
		</table>
		<input type="submit" value="Add RPG">
</body>
</html>