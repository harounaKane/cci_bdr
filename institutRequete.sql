        -- JOINTURES 

-- Q1 — Afficher nom, prénom de chaque stagiaire avec le libellé du stage auquel il est inscrit.
SELECT nom, prenom, libelle AS stage
FROM stagiaire
INNER JOIN stagiaire_stage
ON stagiaire_id = stagiaire.id
INNER JOIN stage
ON stage_id = stage.id;

-- Q2 — Lister les matières avec le nom du professeur qui les dispense.
SELECT nom, prenom, libelle
FROM matiere 
INNER JOIN professeur
ON professeur_id = professeur.id;


-- Q3 — Afficher le nom, prénom du stagiaire, le libellé du stage et le coût, uniquement pour les stages coûtant plus de 1500 €. Trier par coût décroissant.
SELECT nom, prenom, libelle, cout
FROM stagiaire
INNER JOIN stagiaire_stage 
ON stagiaire_id = stagiaire.id
INNER JOIN stage
ON stage_id = stage.id 
AND cout > 1500
ORDER BY cout DESC;

-- Q4 — Afficher les stagiaires habitant Paris inscrits à au moins un stage.
SELECT DISTINCT id, prenom, nom, ville
FROM stagiaire
INNER JOIN stagiaire_stage
ON stagiaire_id = id
WHERE ville = "paris";

-- Q5 — Lister les stages qui débutent en octobre 2024.
SELECT libelle, date_debut, cout
FROM stage 
WHERE MONTH(date_debut) = 10 
AND YEAR(date_debut) = 2024;

SELECT libelle, format(date_debut, "%D %m %Y"), cout
FROM stage 
WHERE date_debut BETWEEN "2024-10-01" AND "2024-10-31";


-- Q6 — Afficher les stagiaires inscrits au stage le plus cher.
SELECT nom, prenom, libelle AS stage, cout
FROM stagiaire
INNER JOIN stagiaire_stage
ON stagiaire_id = stagiaire.id
INNER JOIN stage
ON stage_id = stage.id
WHERE cout = (SELECT MAX(cout) FROM stage);

-- Q7 — Pour le stage "SQL & BD", afficher chaque stagiaire, chaque matière et le prof correspondant.
SELECT prof.prenom "prenom prof", prof.nom "nom prof", s.prenom "stagiaire prenom", s.nom, stage.libelle as stage, matiere.libelle as matiere
FROM stagiaire s 
INNER JOIN stagiaire_stage 
ON stagiaire_id = s.id
INNER JOIN stage
ON stage_id = stage.id
INNER JOIN stage_matiere sm
ON sm.stage_id = stage.id
INNER JOIN matiere
ON matiere.id = matiere_id
INNER JOIN professeur prof 
ON prof.id = professeur_id
WHERE stage.libelle like "Formation SQL & Bases de données";


-- Q8 — Afficher TOUS les stagiaires, même ceux sans inscription, avec le stage ou NULL.
SELECT prenom, nom, libelle
FROM stagiaire
LEFT JOIN stagiaire_stage 
ON stagiaire.id = stagiaire_id
LEFT JOIN stage 
ON stage.id = stage_id


-- Q9 — Trouver les professeurs sans aucune matière assignée.
SELECT prenom, nom
FROM professeur 
LEFT JOIN matiere
ON professeur_id = professeur.id
WHERE professeur_id IS NULL;


-- Q10 — Afficher le nom du stage, le libellé de chaque matière qui le compose, et le nom du professeur qui l'enseigne. Filtrer uniquement les matières du professeur "Martin Sophie".
SELECT stage.libelle, prenom, nom, matiere.libelle as matiere
FROM stage 
INNER JOIN stage_matiere
ON stage_id = stage.id 
INNER JOIN matiere
ON matiere.id = matiere_id
INNER JOIN professeur 
ON professeur.id = professeur_id
AND nom = "martin"
AND prenom = "sophie";


-- AGREGATIONS

-- Q11 — Pour chaque stage, afficher le nombre de matières qui le composent et son coût.
SELECT 
    stage.libelle as stage,
    COUNT(sm.matiere_id) as nb_matiere,
    cout
FROM stage 
INNER JOIN stage_matiere as sm
ON stage_id = stage.id
GROUP BY stage.id, stage, cout;

-- Q12 — Afficher les professeurs qui enseignent strictement plus de 2 matières.
SELECT prenom, nom, COUNT(professeur_id) nb_matiere
FROM professeur
INNER JOIN matiere
ON professeur_id = professeur.id
GROUP BY professeur.id
HAVING COUNT(nb_matiere) > 2;

-- Q13 — Compter le nombre de stagiaires inscrits par stage, du plus rempli au moins rempli.
SELECT libelle as stage, COUNT(stagiaire_id) nb_stagiaire
FROM stage 
LEFT JOIN stagiaire_stage
ON stage_id = id
GROUP BY id
ORDER BY nb_stagiaire DESC;

-- Q14 — Lister les stages entre 1200 € et 1800 € ayant au moins 6 inscrits.
SELECT libelle as stage, COUNT(stagiaire_id) nb_stagiaire, cout
FROM stage 
LEFT JOIN stagiaire_stage
ON stage_id = id
AND cout BETWEEN 1200 AND 1800
GROUP BY id
HAVING COUNT(nb_stagiaire) >= 6
ORDER BY nb_stagiaire DESC;

-- Q15 — Afficher TOUS les stages avec leur nombre d'inscrits, y compris ceux à 0.
SELECT libelle as stage, COUNT(stagiaire_id) nb_stagiaire, cout
FROM stage 
LEFT JOIN stagiaire_stage
ON stage_id = id
GROUP BY id
ORDER BY nb_stagiaire DESC;

-- Q16 — Afficher les stagiaires inscrits à plus d'un stage avec le nombre de stages suivis.
SELECT prenom, nom, COUNT(stagiaire_id) nb_inscription
FROM stagiaire
INNER JOIN stagiaire_stage
ON stagiaire_id = id
GROUP by id
HAVING COUNT(nb_inscription) > 1;

-- Q17 — Par professeur : nb de matières, nb de stages concernés et chiffre d'affaires potentiel.
SELECT
    prenom, nom,
    COUNT(matiere.id) AS nb_matiere,
    COUNT(stage_id) AS nb_stage,
    SUM(cout) AS CA
FROM stage 
INNER JOIN stage_matiere 
ON stage_id = stage.id
INNER JOIN matiere
ON matiere.id = matiere_id
INNER JOIN professeur
ON professeur_id = professeur.id
GROUP BY professeur.id, matiere.libelle
ORDER BY CA ASC;