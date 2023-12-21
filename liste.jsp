<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="connect.*" %>
<%@ page import="mesclass.*" %>
<%@ page import="java.sql.*" %> 

<%
Connection conn=new Connect().connectit("epicerie", "epicerie", "epicerie");
Produit[] p= new Produit().getProduit(conn);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <style>
    table {
      border-collapse: collapse;
    }

    th, td {
      border: 2px solid white;
      padding: 8px;
    }

    a{
        color: 
    }
  </style>

    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" type="text/css" href="bootstrap-4.0.0-dist\css\bootstrap.css">
    <title>Document</title>
</head>
<body>
<div class="maincontent">
    <table>
        <th>Nom du produit</th>
        <th>Type</th>
        <th>Prix</th>
        <th>Categorie</th>
        <th>Date d'insertion</th>
        <% for(int i=0; i<p.length; i++){ %>
            <tr>
                <td><%= p[i].getNomProduit() %></td>
                <td><%= p[i].getNomType() %></td>
                <td><%= p[i].getPrix() %> Ar</td>
                <td><%= p[i].getNomCategorie() %></td>
                <td><%= p[i].getDateProduit() %></td>
            </tr>
       <% } %>
    </table>
    <br>
    <a href="admin.jsp" class="button">Inserer votre produit</a>
</div>
</body>
</html>