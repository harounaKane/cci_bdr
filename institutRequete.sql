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