<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tabela Dcisiplina</title>
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
	<h1 align="center">Tabela Disciplina:</h1>
	<br />
	<p align="center">
		<a href="nou_Disciplina.jsp"><b>Adauga Disciplina.</b></a> <a
			href="index.html"><b>Home</b></a>
	</p>
	<form action="m1_Disciplina.jsp" method="post">
		<table border="1" align="center">
			<tr>
				<td><b>Mark:</b></td>
				<td><b>IdDisciplina:</b></td>
				<td><b>IdCatedre:</b></td>
				<td><b>Nume_Catedra:</b></td>
				<td><b>An_Catedra:</b></td>
				<td><b>Sef_Catedra:</b></td>
				<td><b>Site_Catedra:</b></td>
				<td><b>IdProfesori:</b></td>
				<td><b>Nume_Profesori:</b></td>
				<td><b>Prenume_Profesori:</b></td>
				<td><b>Adresa_Profesori:</b></td>
				<td><b>Varsta_Profesori:</b></td>
				<td><b>Tip:</b></td>
				<td><b>Nr_Materii:</b></td>
				<td><b>Ore_alocate:</b></td>
			</tr>
			<%
			jb.connect();
			ResultSet rs = jb.vedeDisciplina();
			long x;
			while (rs.next()) {
				x = rs.getInt("iddisciplina");
			%>
			<tr>
				<td><input type="checkbox" name="primarykey" value="<%=x%>" /></td>
				<td><%=x%></td>
				<td><%=rs.getInt("idCatedre_1")%></td>
				<td><%=rs.getString("nume_catedra")%></td>
				<td><%=rs.getInt("an_catedra")%></td>
				<td><%=rs.getString("sef_catedra")%></td>
				<td><%=rs.getString("site_catedra")%></td>
				<td><%=rs.getInt("id_profesori")%></td>
				<td><%=rs.getString("nume_profesori")%></td>
				<td><%=rs.getString("prenume_profesori")%></td>
				<td><%=rs.getString("adresa_profesori")%></td>
				<td><%=rs.getInt("varsta_profesori")%></td>
				<td><%=rs.getString("tip")%></td>
				<td><%=rs.getInt("nr_materii")%></td>
				<td><%=rs.getInt("ore_alocate")%></td>
				<%
				}
				%>
			</tr>
		</table>
		<br />
		<p align="center">
			<input type="submit" value="Modifica linia">
		</p>
	</form>
	<%
	jb.disconnect();
	%>
	<br />
	<p align="center">
		<a href="index.html"><b>Home</b></a> <br />
	</p>
</body>
</html>