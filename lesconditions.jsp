<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>Les Conditions</title>
</head>
<body bgcolor=white>
<h1>Exercices sur les conditions</h1>

<!-- Formulaire pour la saisie des valeurs -->
<form action="#" method="post">
    <p>Saisir la valeur A : <input type="text" name="valeurA"></p>
    <p>Saisir la valeur B : <input type="text" name="valeurB"></p>
    <p>Saisir la valeur C : <input type="text" name="valeurC"></p>
    <p><input type="submit" value="Afficher"></p>
</form>

<%-- Récupération des valeurs saisies --%>
<%
    String valeurA = request.getParameter("valeurA");
    String valeurB = request.getParameter("valeurB");
    String valeurC = request.getParameter("valeurC");
%>

<% if (valeurA != null && valeurB != null && valeurC != null && !valeurA.isEmpty() && !valeurB.isEmpty() && !valeurC.isEmpty()) { %>
    <% int intValeurA = Integer.parseInt(valeurA); %>
    <% int intValeurB = Integer.parseInt(valeurB); %>
    <% int intValeurC = Integer.parseInt(valeurC); %>
    
    <h2>Exercice 1 : Comparaison 1</h2>
    <p>
    <% if (intValeurC > intValeurA && intValeurC < intValeurB) { %>
        Oui, C ( <%= intValeurC %> ) est compris entre A ( <%= intValeurA %> ) et B ( <%= intValeurB %> ).
    <% } else { %>
        Non, C ( <%= intValeurC %> ) n'est pas compris entre A ( <%= intValeurA %> ) et B ( <%= intValeurB %> ).
    <% } %>
    </p>

    <h2>Exercice 2 : Pair ou Impair ?</h2>
    <p>
    <% if (intValeurC % 2 == 0) { %>
        Le nombre <%= intValeurC %> est pair.
    <% } else { %>
        Le nombre <%= intValeurC %> est impair.
    <% } %>
    </p>
<% } %>

<p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
