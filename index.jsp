<%@ page import="connect.*" %>
<%@ page import="mesclass.*" %>
<%@ page import="java.sql.*" %> 
<% 
Connection conn=new Connect().connectit("epicerie", "epicerie", "epicerie");
Produit[] p=new Produit().getProduit(conn);

%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="bootstrap-4.0.0-dist\css\bootstrap.css">
     <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<header>
</header>
    <div class="maincontent">
        <img class="logo"src="img/icon.png"/>
        <h1>Epicerie&nbsp;Fine </h1>
        
        <form class="gridBox">
            <label for="produit">Produit</label>
            <select id="produit" name="produit" required>
                <% for(int i=0;i<p.length;i++){ %>
                    <option value=""><%= p[i].getNomProduit() %></option>
                <% }%>
            </select><br>
            <label for="nombre">Nombre</label>
            <input type="number" min=0 id="nombre" name="nombre" placeholder="je veux..."required><br>
            <label for="date">Date:</label>
        <input type="date" id="date" name="date" required><br>
        <button type="button" class="button">Valider</button>
        <br>
                <a href="admin.jsp">page admin</a>
        </form>
    </div>
</body>
</html>