<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>Boucles</title>
</head>
<body bgcolor=white>
<h1>Exercices sur les boucles</h1>
<form action="#" method="post">
    <label for="inputValeur">Saisir le nombre d'étoiles : </label>
    <input type="text" id="inputValeur" name="valeur">
    <input type="submit" value="Afficher">
</form>

<%-- Récupération de la valeur saisie par l'utilisateur --%>
<% String valeur = request.getParameter("valeur"); %>
    
<%-- Vérification de l'existence de la valeur --%>
<% if (valeur != null && !valeur.isEmpty()) { %>

<%-- Boucle for pour afficher une ligne d'étoiles --%>
    <%int cpt = Integer.parseInt(valeur); %>
    <p>
    <% for (int i = 1; i <= cpt; i++) { %>
       <%= "*" %>
    <% } %>
    </p>

<h2>Exercice 1 : Le carré d'étoiles</h2>
<p>Ecrire le code afin de produire un carré d'étoile</p>

    <p>
    <% for(int i = 0; i < n; i++) {
        for(int j = 0; j < n; j++) {
            out.print("*");
        }
        out.println("<br>");
    } %>
    </p>

<h2>Exercice 2 : Triangle rectangle gauche</h2>
<p>Ecrire le code afin de produire un triangle rectangle aligné sur la gauche</p>

    <p>
    <% for(int i = 0; i < n; i++) {
        for(int j = 0; j <= i; j++) {
            out.print("*");
        }
        out.println("<br>");
    } %>
    </p>

<h2>Exercice 3 : Triangle rectangle inversé</h2>
<p>Ecrire le code afin de produire un triangle rectangle aligné sur la gauche</p>

    <p>
    <% for(int i = 0; i < n; i++) {
        for(int j = n; j > i; j--) {
            out.print("*");
        }
        out.println("<br>");
    } %>
    </p>

<h2>Exercice 4 : Triangle rectangle 2</h2>
<p>Ecrire le code afin de produire un triangle rectangle aligné sur la droite</p>

    <p>
    <% for(int i = 0; i < n; i++) {
        for(int j = 0; j < n-i-1; j++) {
            out.print("&nbsp;");
        }
        for(int j = 0; j <= i; j++) {
            out.print("*");
        }
        out.println("<br>");
    } %>
    </p>

<h2>Exercice 5 : Triangle isocele</h2>
<p>Ecrire le code afin de produire un triangle rectangle aligné sur la droite</p>

    <p>
    <% for(int i = 0; i < n; i++) {
        for(int j = 0; j < n-i-1; j++) {
            out.print("&nbsp;");
        }
        for(int j = 0; j <= i; j++) {
            out.print("*");
        }
        out.println("<br>");
    } %>
    </p>

<h2>Exercice 6 : Le demi losange</h2>
<p>Ecrire le code afin de produire un losange</p>

    <p>
    <% for(int i = 0; i < n; i++) {
        for(int j = 0; j < n-i-1; j++) {
            out.print("&nbsp;");
        }
        for(int j = 0; j <= i; j++) {
            out.print("*");
        }
        out.println("<br>");
    }
    for(int i = 0; i < n; i++) {
        for(int j = 0; j <= i; j++) {
            out.print("&nbsp;");
        }
        for(int j = n; j > i; j--) {
            out.print("*");
        }
        out.println("<br>");
    } %>
    </p>

<h2>Exercice 7 : La table de multiplication</h2>
<p>Ecrire le code afin de créser une table de multiplication</p>

    <p>
    <% for(int i = 1; i <= n; i++) {
        out.println(n + " x " + i + " = " + (n * i) + "<br>");
    } %>
    </p>

<% } %>
<p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
