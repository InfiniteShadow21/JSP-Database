<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Adauga Profesori</title>
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
	<%
	String Nume = request.getParameter("nume");
	String Prenume = request.getParameter("prenume");
	String Adresa = request.getParameter("adresa");
	String Varsta = request.getParameter("varsta");
	if (Nume != null) {
		jb.connect();
		jb.adaugaProfesor(Nume, Prenume, Adresa, java.lang.Integer.parseInt(Varsta));
		jb.disconnect();
	%>
	<p>Datele au fost adaugate.</p>
	<%
	} else {
	%>
	<h1>Suntem in tabela Profesori.</h1>
	<form action="nou_Profesori.jsp" method="post">
		<table>
			<tr>
				<td align="right">Nume Profesor:</td>
				<td><input type="text" name="nume" size="40" /></td>
			</tr>
			<tr>
				<td align="right">Prenume Profesor:</td>
				<td><input type="text" name="prenume" size="30" /></td>
			</tr>
			<tr>
				<td align="right">Adresa Profesor:</td>
				<td><input type="text" name="adresa" size="30" /></td>
			</tr>
			<tr>
				<td align="right">Varsta Profesor:</td>
				<td><input type="text" name="varsta" size="30" /></td>
			</tr>
		</table>
		<input type="submit" value="Adauga profesor" />
	</form>
	<%
	}
	%>
	<br />
	<a href="index.html"><b>Home</b></a>
	<br />
</body>
</html>