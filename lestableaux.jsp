<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>Les Tableaux</title>
</head>
<body bgcolor=white>
<h1>Exercices sur les tableaux</h1>
<form action="#" method="post">
    <p>Saisir au minimum 3 chiffres à la suite, exemple : 6 78 15 <input type="text" name="chaine">
    <p><input type="submit" value="Afficher">
</form>
<%-- Récupération de la chaine saisie --%>
<% String chaine = request.getParameter("chaine"); %>

<% if (chaine != null && !chaine.isEmpty()) { %>
    <% String[] tableauDeChiffres = chaine.split("\\s+");
       int[] valeurs = new int[tableauDeChiffres.length];
       for (int i = 0; i < tableauDeChiffres.length; i++) {
           valeurs[i] = Integer.parseInt(tableauDeChiffres[i]);
       }
    %>
    <p>Le tableau contient <%= valeurs.length %> valeurs</br>
    <% for (int i = 0; i < valeurs.length; i++) { %>
        Chiffre <%= i + 1 %>: <%= valeurs[i] %></br>
    <% } %>

    <h2>Exercice 1 : Le carré de la première valeur</h2>
    <p>Carré de la première valeur : <%= valeurs[0] * valeurs[0] %></p>

    <h2>Exercice 2 : La somme des 2 premières valeurs</h2>
    <p>Somme des deux premières valeurs : <%= valeurs[0] + valeurs[1] %></p>

    <h2>Exercice 3 : La somme de toutes les valeurs</h2>
    <p>
    <% int somme = 0;
       for (int valeur : valeurs) {
           somme += valeur;
       }
    %>
    Somme de toutes les valeurs : <%= somme %>
    </p>

    <h2>Exercice 4 : La valeur maximum</h2>
    <p>
    <% int max = valeurs[0];
       for (int valeur : valeurs) {
           if (valeur > max) {
               max = valeur;
           }
       }
    %>
    Valeur maximale : <%= max %>
    </p>

    <h2>Exercice 5 : La valeur minimale</h2>
    <p>
    <% int min = valeurs[0];
       for (int valeur : valeurs) {
           if (valeur < min) {
               min = valeur;
           }
       }
    %>
    Valeur minimale : <%= min %>
    </p>

    <h2>Exercice 6 : La valeur la plus proche de 0</h2>
    <p>
    <% int plusProcheDeZero = valeurs[0];
       for (int valeur : valeurs) {
           if (Math.abs(valeur) < Math.abs(plusProcheDeZero)) {
               plusProcheDeZero = valeur;
           }
       }
    %>
    Valeur la plus proche de 0 : <%= plusProcheDeZero %>
    </p>

    <h2>Exercice 7 : La valeur la plus proche de 0</h2>
    <p>
    <% int plusProcheDeZeroV2 = valeurs[0];
       for (int valeur : valeurs) {
           if (Math.abs(valeur) < Math.abs(plusProcheDeZeroV2) || (Math.abs(valeur) == Math.abs(plusProcheDeZeroV2) && valeur > plusProcheDeZeroV2)) {
               plusProcheDeZeroV2 = valeur;
           }
       }
    %>
    Valeur la plus proche de 0 : <%= plusProcheDeZeroV2 %>
    </p>

<% } %>
<p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
