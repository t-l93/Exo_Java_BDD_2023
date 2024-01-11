<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>Connexion à MariaDB via JSP</title>
</head>
<body>
    <h1>Exemple de connexion à MariaDB avec JSP</h1>
    <% 
    String url = "jdbc:mariadb://localhost:3306/films";
    String user = "mysql";
    String password = "mysql";

        // Charger le pilote JDBC (pilote disponible dans WEB-INF/lib)
        Class.forName("org.mariadb.jdbc.Driver");

        // Établir la connexion
        Connection conn = DriverManager.getConnection(url, user, password);
        // Exemple de requête SQL
        String sql = "SELECT idFilm, titre, année FROM Film WHERE année >= 2000";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        ResultSet rs = pstmt.executeQuery();

        // Afficher les résultats 
        while (rs.next()) {
            String colonne1 = rs.getString("idFilm");
            String colonne2 = rs.getString("titre");
            String colonne3 = rs.getString("année");
            // Faites ce que vous voulez avec les données...
            //Exemple d'affichage de 2 colonnes
            out.println("id : " + colonne1 + ", titre : " + colonne2 + ", année : " + colonne3 + "</br>");
        }

        // Fermer les ressources 
        rs.close();
        pstmt.close();
        conn.close();
    %>

<h2>Exercice 1 : Les films entre 2000 et 2015</h2>
<p>Extraire les films dont l'année est supérieur à l'année 2000 et inférieur à 2015.</p>

<h2>Exercice 2 : Année de recherche</h2>
<p>Créer un champ de saisie permettant à l'utilisateur de choisir l'année de sa recherche.</p>

<form action="#" method="post">
    <p>Saisir une année : <input type="text" id="inputValeur" name="annee">
    <p><input type="submit" value="Afficher">
</form>


<%
    String annee = request.getParameter("annee");

    if (annee != null) { 
        conn = DriverManager.getConnection(url, user, password);
        String sqlRechercheAnnee = "SELECT idFilm, titre, année FROM Film WHERE année = " + annee;
        pstmt = conn.prepareStatement(sqlRechercheAnnee);
        rs = pstmt.executeQuery();

        while (rs.next()) {
            String colonne1Annee = rs.getString("idFilm");
            String colonne2Annee = rs.getString("titre");
            String colonne3Annee = rs.getString("année");
            out.println("id : " + colonne1Annee + ", titre : " + colonne2Annee + ", année : " + colonne3Annee + "</br>");
        }
 
        rs.close();
        pstmt.close();
        conn.close();
    }

%>

<h2>Exercice 3 : Modification du titre du film</h2>
<p>Créer un fichier permettant de modifier le titre d'un film sur la base de son ID (ID choisi par l'utilisateur)</p>

<form action="#" method="post">
    <label for="inputFilmId">Saisissez l'ID du film à modifier : </label>
    <input type="text" id="inputFilmId" name="filmId">
    <label for="inputNouveauTitre">Saisissez le nouveau titre : </label>
    <input type="text" id="inputNouveauTitre" name="nouveauTitre">
    <input type="submit" value="Modifier le titre">
</form>
<p>
<%
    // Récupération des paramètres saisis par l'utilisateur
    String filmIdStr = request.getParameter("filmId");
    String nouveauTitre = request.getParameter("nouveauTitre");

    if (filmIdStr != null && nouveauTitre != null && !filmIdStr.isEmpty() && !nouveauTitre.isEmpty()) {
        int filmId = Integer.parseInt(filmIdStr);

        String sqlExercice3 = "UPDATE Film SET titre = ? WHERE idFilm = ?";
        PreparedStatement pstmtExercice3 = conn.prepareStatement(sqlExercice3);
        pstmtExercice3.setString(1, nouveauTitre);
        pstmtExercice3.setInt(2, filmId);

        int rowsAffected = pstmtExercice3.executeUpdate();

        if (rowsAffected > 0) {
            out.println("<p>Le titre du film avec l'ID " + filmId + " a été modifié avec succès.</p>");
        } else {
            out.println("<p>Aucun film trouvé avec l'ID " + filmId + ".</p>");
        }

        // Fermer exercice 3
        pstmtExercice3.close();
    }
%>
</p>


<h2>Exercice 4 : La valeur maximum</h2>
<p>Créer un formulaire pour saisir un nouveau film dans la base de données</p>

</body>
</html>
