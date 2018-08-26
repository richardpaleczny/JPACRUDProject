<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
			type="text" name="rpgID" /> <input type="submit"
			value="Submit" />
	</form>

</body>
</html>