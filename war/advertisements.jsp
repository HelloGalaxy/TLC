<%@page import="fr.istic.tlc.data.DataSource"%>
<%@page import="fr.istic.tlc.model.Advertisement"%>
<%@page import="java.util.List;"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<jsp:useBean id="aditem" class="fr.istic.tlc.model.Advertisement" scope="page"/>
<jsp:setProperty name="aditem" property="*"/> 

<%
	DataSource ds = new DataSource();
	List<Advertisement> ads = null;
	
	
	if(request.getParameter("delete") != null) {
		String mark = request.getParameter("delete");		
		if(mark.equals("on") && session.getAttribute("KEYWORDS") != null) {
			out.print((String)session.getAttribute("KEYWORDS"));
			ds.deleteAds((String)session.getAttribute("KEYWORDS"));
		}
		
	}
	
	
	if(request.getParameter("keyword") != null) {
		String key = request.getParameter("keyword");
		ads = ds.getAdByTitle(key);
		session.setAttribute("KEYWORDS", key);
	} else {
		ads = ds.getAllAds();
		session.setAttribute("KEYWORDS", "");
	}
	

	if(aditem != null && aditem.getTitle() != null) {
		ds.addAD(aditem);
		aditem = null;
	}

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<body>

	<form method=GET action="advertisements.jsp">
		<input type="checkbox" name="delete"/>
		<input type="submit" id="submit" value="Delete ads" />
	</form>

	<hr />

	<form method=GET action="advertisements.jsp">
		<input type="text" id="txtSearch" name="keyword"/>
		<input type="submit" id="submit" value="Search Me" />
	</form>

	<hr />

	<form method=POST action="advertisements.jsp">
		<label style="width:200px">Title:</label> <input type="text" id="txtTitle" name="title"/><br /> 
		<label style="width:200px">Price:</label><input type="text" id="txtPrice" name="price" /><br /> 
		<label style="width:200px">Date:</label><input type="text" id="txtDate" name="date" /><br /> 
		<input type="submit" id="btnAdd" value="Add Me" />
	</form>
	
	<hr />
	
	<table border="1">
		<tr>
			<th>ID</th>
			<th>Title</th>
			<th>Price</th>
			<th>Date</th>
		</tr>		
		<%
			int count = 1;
			for(Advertisement ad : ads) {
				out.print("<tr>");
				out.print(String.format("<td>%d</td>", count++));
				out.print(String.format("<td>%s</td>", ad.getTitle()));
				out.print(String.format("<td>%s</td>", ad.getPrice()));
				out.print(String.format("<td>%s</td>", ad.getDate()));
				out.print("</tr>");
			}
		%>
		
	</table>

</body>
</html>