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

        // Afficher les résultats (à adapter selon vos besoins)
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
<p>
<% 
    // ... (votre code de connexion)

    String sqlExercice1 = "SELECT idFilm, titre, année FROM Film WHERE année > 2000 AND année < 2015";
    PreparedStatement pstmtExercice1 = conn.prepareStatement(sqlExercice1);
    ResultSet rsExercice1 = pstmtExercice1.executeQuery();

    // Afficher les résultats de l'exercice 1
    out.println("<h3>Résultats de l'exercice 1 :</h3>");
    while (rsExercice1.next()) {
        String colonne1 = rsExercice1.getString("idFilm");
        String colonne2 = rsExercice1.getString("titre");
        String colonne3 = rsExercice1.getString("année");
        out.println("id : " + colonne1 + ", titre : " + colonne2 + ", année : " + colonne3 + "<br>");
    }

    // Fermer les ressources de l'exercice 1
    rsExercice1.close();
    pstmtExercice1.close();
%>
</p>

<h2>Exercice 2 : Année de recherche</h2>
<p>Créer un champ de saisie permettant à l'utilisateur de choisir l'année de sa recherche.</p>
<p>
<form action="#" method="post">
    <label for="inputAnneeRecherche">Saisissez une année de recherche : </label>
    <input type="text" id="inputAnneeRecherche" name="anneeRecherche">
    <input type="submit" value="Rechercher">
</form>

<%
    // Récupération de l'année saisie par l'utilisateur
    String anneeRechercheStr = request.getParameter("anneeRecherche");

    if (anneeRechercheStr != null && !anneeRechercheStr.isEmpty()) {
        int anneeRecherche = Integer.parseInt(anneeRechercheStr);

        String sqlExercice2 = "SELECT idFilm, titre, année FROM Film WHERE année = ?";
        PreparedStatement pstmtExercice2 = conn.prepareStatement(sqlExercice2);
        pstmtExercice2.setInt(1, anneeRecherche);

        ResultSet rsExercice2 = pstmtExercice2.executeQuery();

        // Afficher les résultats de l'exercice 2
        out.println("<h3>Résultats de l'exercice 2 :</h3>");
        while (rsExercice2.next()) {
            String colonne1 = rsExercice2.getString("idFilm");
            String colonne2 = rsExercice2.getString("titre");
            String colonne3 = rsExercice2.getString("année");
            out.println("id : " + colonne1 + ", titre : " + colonne2 + ", année : " + colonne3 + "<br>");
        }

        // Fermer les ressources de l'exercice 2
        rsExercice2.close();
        pstmtExercice2.close();
    }
%>
</p>


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

        // Fermer les ressources de l'exercice 3
        pstmtExercice3.close();
    }
%>
</p>

<h2>Exercice 4 : La valeur maximum</h2>
<p>Créer un formulaire pour saisir un nouveau film dans la base de données</p>
<P>
<form action="#" method="post">
    <label for="inputTitre">Titre du film : </label>
    <input type="text" id="inputTitre" name="titre">
    <label for="inputAnnee">Année de sortie : </label>
    <input type="text" id="inputAnnee" name="annee">
    <input type="submit" value="Ajouter le film">
</form>

<%
    // Récupération des paramètres saisis par l'utilisateur
    String nouveauTitreExercice4 = request.getParameter("titre");
    String anneeExercice4 = request.getParameter("annee");

    if (nouveauTitreExercice4 != null && anneeExercice4 != null && !nouveauTitreExercice4.isEmpty() && !anneeExercice4.isEmpty()) {
        String sqlExercice4 = "INSERT INTO Film (titre, année) VALUES (?, ?)";
        PreparedStatement pstmtExercice4 = conn.prepareStatement(sqlExercice4);
        pstmtExercice4.setString(1, nouveauTitreExercice4);
        pstmtExercice4.setInt(2, Integer.parseInt(anneeExercice4));

        int rowsAffectedExercice4 = pstmtExercice4.executeUpdate();

        if (rowsAffectedExercice4 > 0) {
            out.println("<p>Le nouveau film a été ajouté avec succès.</p>");
        } else {
            out.println("<p>Erreur lors de l'ajout du film.</p>");
        }

        // Fermer les ressources de l'exercice 4
        pstmtExercice4.close();
    }
%>
</p>
</body>
</html>
