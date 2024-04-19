<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tabela Disciplina</title>
<link href="table.css" rel="stylesheet" type="text/css" media="screen" />
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
	<%
	jb.connect();
	String tip, nume_catedra, an_catedra, sef_catedra, site_catedra, nume_profesori, prenume_profesori, adresa_profesori, varsta_profesori;
	int nr_materii,ore_alocate;
	int aux = java.lang.Integer.parseInt(request.getParameter("primarykey"));
	ResultSet rs = jb.intoarceDisciplinaid(aux);
	rs.first();
	int id1 = rs.getInt("idCatedre_1");
	int id2 = rs.getInt("id_profesori");
	nume_catedra = rs.getString("nume_catedra");
	an_catedra = rs.getString("an_catedra");
	sef_catedra = rs.getString("sef_catedra");
	site_catedra = rs.getString("site_catedra");
	nume_profesori = rs.getString("nume_profesori");
	prenume_profesori = rs.getString("prenume_profesori");
	adresa_profesori = rs.getString("adresa_profesori");
	varsta_profesori = rs.getString("varsta_profesori");
	tip = rs.getString("tip"); 
	nr_materii = rs.getInt("nr_materii");
	ore_alocate = rs.getInt("ore_alocate");
	ResultSet rs1 = jb.vedeTabela("catedre");
	ResultSet rs2 = jb.vedeTabela("profesori");
	int idcat, idprof;
	%>
	<form action="m2_Disciplina.jsp" method="post">
		<table align="center">
			<tr>
				<td align="right">IdDisciplina:</td>
				<td><input type="text" name="iddisciplina" size="30"
					value="<%=aux%>" readonly /></td>
			</tr>
			<tr>
				<td align="right">idCatedre:</td>
				<td><SELECT NAME="idCatedre">
						<%
						while (rs1.next()) {
							idcat = rs1.getInt("idCatedre");
							nume_catedra = rs1.getString("nume");
	                        an_catedra = rs1.getString("an");
							sef_catedra = rs1.getString("sef");
							if (idcat != id1) {
						%>
						<OPTION VALUE="<%=idcat%>"><%=idcat%>,
							<%=nume_catedra%>,
							<%=an_catedra%>,
							<%=sef_catedra%></OPTION>
						<%
						} else {
						%>
						<OPTION selected="yes" VALUE="<%=idcat%>"><%=idcat%>,
							<%=nume_catedra%>,
							<%=an_catedra%>,
							<%=sef_catedra%></OPTION>
						<%
						}
						}
						%>
				</SELECT></td>
			</tr>
			<tr>
				<td align="right">idProfesori:</td>
				<td><SELECT NAME="idProfesori">
						<%
						while (rs2.next()) {
							idprof = rs2.getInt("idProfesori");
							nume_profesori = rs2.getString("nume");
							prenume_profesori = rs2.getString("prenume");
							adresa_profesori = rs2.getString("adresa");
							varsta_profesori = rs2.getString("varsta");
							if (idprof != id2) {
						%>
						<OPTION VALUE="<%=idprof%>"><%=idprof%>,
							<%=nume_profesori%>,
							<%=prenume_profesori%>,
							<%=adresa_profesori%>,
							<%=varsta_profesori%></OPTION>
						<%
						} else {
						%>
						<OPTION selected="yes" VALUE="<%=idprof%>"><%=idprof%>,
							<%=nume_profesori%>,
							<%=prenume_profesori%>,
							<%=adresa_profesori%>,
							<%=varsta_profesori%></OPTION>
						<%
						}
						}
						%>
				</SELECT></td>
			</tr>
			<tr>
				<td align="right">Tip:</td>
				<td><input type="text" name="tip" size="30"
					value="<%=tip%>" /></td>
			</tr>
			<tr>
				<td align="right">Nr de Materii:</td>
				<td><input type="text" name="nr_materii" size="30"
					value="<%=nr_materii%>" /></td>
			</tr>
			<tr>
				<td align="right">Nr ore alocate</td>
				<td><input type="text" name="ore_alocate" size="30"
					value="<%=ore_alocate%>" /></td>
			</tr>
		</table>
		<p align="center">
			<input type="submit" value="Modifica linia">
		</p>
	</form>
	<p align="center">
		<a href="index.html"><b>Home</b></a> <br />
</body>
<%
 rs.close();
 rs1.close();
 rs2.close();
 jb.disconnect();
 %>
</html>