<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tabela Ctaedre</title>
<link href="table.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
	<h1 align="center">Tabela Catedre:</h1>
	<br />
	<p align="center">
		<a href="nou_Catedre.jsp"><b>Adauga o noua Catedra.</b></a> <a
			href="index.html"><b>Home</b></a>
	</p>
	<%
	jb.connect();
	int aux = java.lang.Integer.parseInt(request.getParameter("primarykey"));
	ResultSet rs = jb.intoarceLinieDupaId("catedre", "idCatedre", aux);
	rs.first();
	String Nume = request.getParameter("nume");
	String An = request.getParameter("an");
	String Sef = request.getParameter("sef");
	String Site = request.getParameter("site");
	rs.close();
	jb.disconnect();
	%>
	<form action="m2_Catedre.jsp" method="post">
		<table align="center">
			<tr>
				<td align="right">IdCatedre:</td>
				<td><input type="text" name="idCatedre" size="30"
					value="<%=aux%>" readonly /></td>
			</tr>
			<tr>
				<td align="right">Nume:</td>
				<td><input type="text" name="nume" size="30" value="<%=Nume%>" /></td>
			</tr>
			<tr>
				<td align="right">An:</td>
				<td><input type="text" name="an" size="30"
					value="<%=An%>" /></td>
			</tr>
			<tr>
				<td align="right">Sef:</td>
				<td><input type="text" name="sef" size="30"
					value="<%=Sef%>" /></td>
			</tr>
			<tr>
				<td align="right">Site:</td>
				<td><input type="text" name="site" size="30"
					value="<%=Site%>" /></td>
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