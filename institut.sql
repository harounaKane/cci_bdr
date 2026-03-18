CREATE TABLE stage(
   code INT,
   libelle VARCHAR(50) NOT NULL,
   date_debut DATE,
   PRIMARY KEY(code),
   UNIQUE(libelle)
);

CREATE TABLE stagiaire(
   num_identifiant VARCHAR(50),
   nom VARCHAR(50) NOT NULL,
   adresse VARCHAR(50),
   cp INT,
   ville VARCHAR(50),
   date_inscription DATETIME,
   PRIMARY KEY(num_identifiant)
);

CREATE TABLE prof(
   matricule INT,
   nom VARCHAR(50),
   prenom VARCHAR(50),
   PRIMARY KEY(matricule)
);

CREATE TABLE matiere(
   code INT,
   libelle VARCHAR(50) NOT NULL,
   matricule INT NOT NULL,
   PRIMARY KEY(code),
   FOREIGN KEY(matricule) REFERENCES prof(matricule)
);

CREATE TABLE inscription(
   code INT,
   num_identifiant VARCHAR(50),
   PRIMARY KEY(code, num_identifiant),
   FOREIGN KEY(code) REFERENCES stage(code),
   FOREIGN KEY(num_identifiant) REFERENCES stagiaire(num_identifiant)
);

CREATE TABLE compose(
   stage INT,
   matiere INT,
   PRIMARY KEY(stage, matiere),
   FOREIGN KEY(stage) REFERENCES stage(code),
   FOREIGN KEY(matiere) REFERENCES matiere(code)
);


CREATE TABLE personne(
   id_personne INT PRIMARY KEY AUTO_INCREMENT,
   prenom VARCHAR(20),
   adresse VARCHAR(50), 
   cp INT(5),
   ville VARCHAR(30),
   tel VARCHAR(15)
);