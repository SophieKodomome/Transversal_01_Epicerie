<%@ page import="connect.*" %>
<%@ page import="mesclass.*" %>
<%@ page import="java.sql.*" %> 
<%
Connection conn=new Connect().connectit("epicerie", "epicerie", "epicerie");
Type[] t= new Type().getType(conn);

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
         
        <form action="traitement.jsp" class="gridBox">
            <label for="produit">Nom Produit</label>
            <input type="text" id="produit" class="formText" name="produit" placeholder="votre produit"required><br>
            <label for="category">Categorie:</label>
            <p><span>Standard</span><input type="checkbox" name="checkbox" value="standard"></p>
            <p><span>Moyenne</span><input type="checkbox" name="checkbox" value="moyenne"></p>
            <p><span>Luxe</span><input type="checkbox" name="checkbox" value="standard"></p>
         
            <label for="type">Type:</label>
            <select id="type" name="type" required>
                <% for(int i=0;i<t.length;i++){ %>
                    <option value="<%= t[i].getIdType() %>"><%= t[i].getNomType() %></option>
                <% } %>
            </select><br>
            <label for="prix">Prix</label>
            <input type="text" id="prix" name="prix" placeholder="votre prix" min=0 required><br>
            <label for="date">Date:</label>
        <input type="date" id="date" name="date" required><br>
        <button type="submit" class="button">Inserer</button>
                        <a href="liste.jsp">Voir la liste des produits</a>
        <br>
        </form>
    </div>
</body>
</html>