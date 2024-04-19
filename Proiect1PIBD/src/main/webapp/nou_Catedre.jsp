<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Adauga Catedra</title>
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
	<%
	String Nume = request.getParameter("nume");
	String An = request.getParameter("an");
	String Sef = request.getParameter("sef");
	String Site = request.getParameter("site");
	if (Nume != null) {
		jb.connect();
		jb.adaugaCatedra(Nume, java.lang.Integer.parseInt(An), Sef, Site);
		jb.disconnect();
	%>
	<p>Datele au fost adaugate.</p>
	<%
	} else {
	%>
	<h1>Suntem in tabela Catedra.</h1>
	<form action="nou_Catedre.jsp" method="post">
		<table>
			<tr>
				<td align="right">Nume Catedra:</td>
				<td><input type="text" name="nume" size="40" /></td>
			</tr>
			<tr>
				<td align="right">An Catedra:</td>
				<td><input type="text" name="an" size="30" /></td>
			</tr>
			<tr>
				<td align="right">Sef:</td>
				<td><input type="text" name="sef" size="30" /></td>
			</tr>
			<tr>
				<td align="right">Site:</td>
				<td><input type="text" name="site" size="30" /></td>
			</tr>
		</table>
		<input type="submit" value="Adauga catedra" />
	</form>
	<%
	}
	%>
	<br />
	<a href="index.html"><b>Home</b></a>
	<br />
</body>
</html>