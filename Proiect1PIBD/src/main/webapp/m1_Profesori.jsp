<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tabela Profesori</title>
<link href="table.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
	<h1 align="center">Tabela Profesori:</h1>
	<br />
	<p align="center">
		<a href="nou_Profesori.jsp"><b>Adauga un nou profesor.</b></a> <a
			href="index.html"><b>Home</b></a>
	</p>
	<%
	jb.connect();
	int aux = java.lang.Integer.parseInt(request.getParameter("primarykey"));
	ResultSet rs = jb.intoarceLinieDupaId("profesori", "idProfesori", aux);
	rs.first();
	String Nume = request.getParameter("nume");
	String Prenume = request.getParameter("prenume");
	String Adresa = request.getParameter("adresa");
	String Varsta = request.getParameter("varsta");
	rs.close();
	jb.disconnect();
	%>
	<form action="m2_Profesori.jsp" method="post">
		<table align="center">
			<tr>
				<td align="right">IdProfesori:</td>
				<td><input type="text" name="idProfesori" size="30"
					value="<%=aux%>" readonly /></td>
			</tr>
			<tr>
				<td align="right">Nume:</td>
				<td><input type="text" name="nume" size="30" value="<%=Nume%>" /></td>
			</tr>
			<tr>
				<td align="right">Prenume:</td>
				<td><input type="text" name="prenume" size="30"
					value="<%=Prenume%>" /></td>
			</tr>
			<tr>
				<td align="right">Adresa:</td>
				<td><input type="text" name="adresa" size="30"
					value="<%=Adresa%>" /></td>
			</tr>
			<tr>
				<td align="right">Varsta:</td>
				<td><input type="text" name="varsta" size="30"
					value="<%=Varsta%>" /></td>
			</tr>
		</table>
		<p align="center">
			<input type="submit" value="Modifica linia">
		</p>
	</form>
	<p align="center">
		<a href="index.html"><b>Home</b></a> <br />
</body>
</html>