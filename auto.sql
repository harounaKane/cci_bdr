CREATE TABLE client(
    num_client INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(30) NOT NULL,
    adresse VARCHAR(50),
    cp INT(5),
    ville VARCHAR(30),
    email VARCHAR(50) UNIQUE,
    tel VARCHAR(15) UNIQUE
)ENGINE=InnoDB;

CREATE TABLE materiel(
    num_materiel INT PRIMARY KEY AUTO_INCREMENT,
    nom_materiel VARCHAR(100) NOT NULL,
    client INT(11),
    FOREIGN KEY (client) REFERENCES client (num_client)
)ENGINE=InnoDB;

CREATE TABLE intervention(
    num_intervention INT PRIMARY KEY AUTO_INCREMENT,
    type_panne VARCHAR(100) NOT NULL,
    `description` TEXT,
    date_intervention date,
    tarif FLOAT(10,2) NOT NULL,
    temps_passe INT(2),
    materiel INT(11),
    FOREIGN KEY (materiel) REFERENCES materiel(num_materiel)
)ENGINE=InnoDB;

CREATE TABLE composant(
    num_composant INT PRIMARY KEY AUTO_INCREMENT,
    composant VARCHAR(100) NOT NULL,
    prix FLOAT(10,2) NOT NULL,
    quantite INT(5)
)ENGINE=InnoDB;

CREATE TABLE necessite(
    intervention INT(11),
    composant INT(11),

    PRIMARY KEY (intervention, composant),
    FOREIGN KEY (intervention) REFERENCES intervention(num_intervention),
    FOREIGN KEY (composant) REFERENCES composant(num_composant)
)ENGINE=InnoDB;