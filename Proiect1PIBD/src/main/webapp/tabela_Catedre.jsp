<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tabela Catedre</title>
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
	<h1 align="center">Tabela Catedre:</h1>
	<br />
	<p align="center">
		<a href="nou_Catedre.jsp"><b>Adauga o noua catedra.</b></a> <a
			href="index.html"><b>Home</b></a>
	</p>
	<form action="sterge_Catedre.jsp" method="post">
		<table border="1" align="center">
			<tr>
			    <td><b>Mark:</b></td>
				<td><b>IdCatedre:</b></td>
				<td><b>Nume:</b></td>
				<td><b>An:</b></td>
				<td><b>Sef:</b></td>
				<td><b>Site:</b></td>
			</tr>
			<%
			jb.connect();
			ResultSet rs = jb.vedeTabela("catedre");
			long x;
			while (rs.next()) {
				x = rs.getInt("idCatedre");
			%>
			<tr>
				<td><input type="checkbox" name="primarykey" value="<%=x%>" /></td>
				<td><%=x%></td>
				<td><%=rs.getString("nume")%></td>
				<td><%=rs.getInt("an")%></td>
				<td><%=rs.getString("sef")%></td>
				<td><%=rs.getString("site")%></td>
				<%
				}
				%>
			</tr>
		</table>
		<br />
		<p align="center">
			<input type="submit" value="Sterge liniile marcate">
		</p>
	</form>
	<%
	rs.close();
	jb.disconnect();
	%>
	<br />
	<p align="center">
		<a href="index.html"><b>Home</b></a> <br />
	</p>
</body>
</html>