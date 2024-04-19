<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Adauga Metadata.</title>
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
	<%
	int idcatedre, idprofesori;
	String id1, id2, nume_catedra, an_catedra, sef_catedra, site_catedra, nume_profesori, prenume_profesori, adresa_profesori, varsta_profesori,tip,nr_materii,ore_alocate;
	id1 = request.getParameter("idCatedre");
	id2 = request.getParameter("idProfesori");	
	tip = request.getParameter("tip");
	nr_materii = request.getParameter("nr_materii");
	ore_alocate = request.getParameter("ore_alocate");
	if (id1 != null) {
		jb.connect();
		jb.adaugaDisciplina(java.lang.Integer.parseInt(id1), java.lang.Integer.parseInt(id2), tip, java.lang.Integer.parseInt(nr_materii), java.lang.Integer.parseInt(ore_alocate));
		jb.disconnect();
	%>
	<p>Datele au fost adaugate.</p>
	<%
	} else {
	jb.connect();
	ResultSet rs1 = jb.vedeTabela("catedre");
	ResultSet rs2 = jb.vedeTabela("profesori");
	%>
	<h1>Suntem in tabela Disciplina.</h1>
	<form action="nou_Disciplina.jsp" method="post">
		<table>
			<tr>
				<td align="right">IdCatedre:</td>
				<td>Selectati catedre: <SELECT NAME="idCatedre">
						<%
						while (rs1.next()) {
							idcatedre = rs1.getInt("idCatedre");
							nume_catedra = rs1.getString("nume");
							an_catedra = rs1.getString("an");
							sef_catedra = rs1.getString("sef");
							site_catedra = rs1.getString("site");
						%>
						<OPTION VALUE="<%=idcatedre%>"><%=idcatedre%>,<%=nume_catedra%>,<%=an_catedra%>,<%=sef_catedra%>,<%=site_catedra%></OPTION>
						<%
						}
						%>
				</SELECT>

				</td>
			</tr>
			<tr>
				<td align="right">IdProfesori:</td>
				<td>Selectati categoria: <SELECT NAME="idProfesori">
						<!-- OPTION selected="yes" VALUE="iris1">Iris 1</OPTION -->
						<%
						while (rs2.next()) {
							idprofesori = rs2.getInt("idProfesori");
							nume_profesori = rs2.getString("nume");
							prenume_profesori = rs2.getString("prenume");
							adresa_profesori = rs2.getString("adresa");
							varsta_profesori = rs2.getString("varsta");
						%>
						<OPTION VALUE="<%=idprofesori%>"><%=idprofesori%>,<%=nume_profesori%>,<%=prenume_profesori%>,<%=adresa_profesori%>,<%=varsta_profesori%></OPTION>
						<%
						}
						%>
				</SELECT>
				</td>
			</tr>
			<tr>
				<td align="right">Tip:</td>
				<td><input type="text" name="tip" size="30" /></td>
			</tr>
			<tr>
				<td align="right">Nr de Materii:</td>
				<td><input type="text" name="nr_materii" size="30" /></td>
			</tr>
			<tr>
				<td align="right">Ore Alocate:</td>
				<td><input type="text" name="ore_alocate" size="30" /></td>
			</tr>
		</table>
		<input type="submit" value="Adauga Disciplina" />
	</form>
	<%
 }
 %>
	<br />
	<a href="index.html"><b>Home</b></a>
	<br />
</body>
</html>