# Création des tables

# Sans clés étrangères

CREATE TABLE mode_paiement(
    id_mode_paiement INT(11) AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL
)

CREATE TABLE code_promo(
    id_code_promo INT(11) AUTO_INCREMENT PRIMARY KEY,
    code VARCHAR(50) NOT NULL,
    expiration DATETIME NOT NULL,
    valeur INT(11) NOT NULL,
    unite ENUM('pourcentage', 'euro') NOT NULL,
    nombre_utilisation INT(11) NOT NULL
)

CREATE TABLE type (
    id_type INT(11) AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL
);

CREATE TABLE equipement (
    id_equipement INT(11) AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL
);

CREATE TABLE utilisateur (
    id_utilisateur INT(11) AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(50) NOT NULL,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    role ENUM('client', 'salarie', 'admin') NOT NULL,
    date_creation DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE activite (
    id_activite INT(11) AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    description TEXT NOT NULL,
    prix_adulte_hs FLOAT(11, 2) NOT NULL,
    prix_adulte_bs FLOAT(11, 2) NOT NULL,
    prix_enfant_hs FLOAT(11, 2) NOT NULL,
    prix_enfant_bs FLOAT(11, 2) NOT NULL,
    prix_animal FLOAT(11, 2) NOT NULL,
    duree INT(11) NOT NULL
);


## Creation table avec clés étrangeres


CREATE TABLE sejour(
    id_sejour INT(11) AUTO_INCREMENT PRIMARY KEY,
    nombre_adultes INT(11) NOT NULL DEFAULT 0,
    nombre_enfants INT(11) NOT NULL DEFAULT 0,
    date_debut DATETIME NOT NULL,
    date_fin DATETIME NOT NULL,
    nombre_voitures INT(11) NOT NULL DEFAULT 0,
    nombre_animaux INT(11) NOT NULL DEFAULT 0,
    id_commande INT(11) NOT NULL,
    FOREIGN KEY (id_commande) REFERENCES commande(id_commande) ON DELETE CASCADE
);

CREATE TABLE emplacement (
    id_emplacement INT(11) AUTO_INCREMENT PRIMARY KEY,
    prix_hs FLOAT(11, 2) NOT NULL,
    prix_bs FLOAT(11, 2) NOT NULL,
    places INT(11) NOT NULL,
    caution FLOAT(11, 2) NOT NULL,
    id_type INT(11) NOT NULL,
    FOREIGN KEY (id_type) REFERENCES type(id_type)
);

CREATE TABLE avis (
    id_avis INT(11) AUTO_INCREMENT PRIMARY KEY,
    note INT(11) NOT NULL,
    commentaire TEXT NOT NULL,
    date_creation DATETIME DEFAULT CURRENT_TIMESTAMP,
    date_modification DATETIME NOT NULL,
    id_utilisateur INT(11) NOT NULL,
    FOREIGN KEY (id_utilisateur) REFERENCES utilisateur(id_utilisateur) ON DELETE CASCADE,
    id_emplacement INT(11) NOT NULL,
    FOREIGN KEY (id_emplacement) REFERENCES emplacement(id_emplacement)
);

CREATE TABLE participation(
    id_participation INT(11) AUTO_INCREMENT PRIMARY KEY,
    date_heure DATETIME NOT NULL,
    nombre_adultes INT(11) NOT NULL DEFAULT 0,
    nombre_enfants INT(11) NOT NULL DEFAULT 0,
    id_activite INT(11) NOT NULL,
    FOREIGN KEY (id_activite) REFERENCES activite(id_activite),
    id_sejour INT(11) NOT NULL,
    FOREIGN KEY (id_sejour) REFERENCES sejour(id_sejour) ON DELETE CASCADE
);

# Relation table
CREATE TABLE emplacement_sejour(
    id_emplacement INT(11) NOT NULL,
    FOREIGN KEY (id_emplacement) REFERENCES emplacement(id_emplacement),
    id_sejour INT(11) NOT NULL,
    FOREIGN KEY (id_sejour) REFERENCES sejour(id_sejour) ON DELETE CASCADE
);

CREATE TABLE emplacement_equipement(
    id_emplacement INT(11) NOT NULL,
    FOREIGN KEY (id_emplacement) REFERENCES emplacement(id_emplacement),
    id_equipement INT(11) NOT NULL,
    FOREIGN KEY (id_equipement) REFERENCES equipement(id_equipement)
);

CREATE TABLE commande (
    id_commande INT(11) AUTO_INCREMENT PRIMARY KEY,
    id_mode_paiement INT(11) NOT NULL,
    FOREIGN KEY (id_mode_paiement) REFERENCES mode_paiement(id_mode_paiement),
    id_utilisateur INT(11) NOT NULL,
    FOREIGN KEY (id_utilisateur) REFERENCES utilisateur(id_utilisateur) ON DELETE CASCADE
);

CREATE TABLE commande_code_promo(
    id_commande INT(11) NOT NULL,
    FOREIGN KEY (id_commande) REFERENCES commande(id_commande) ON DELETE CASCADE,
    id_code_promo INT(11) NOT NULL,
    FOREIGN KEY (id_code_promo) REFERENCES code_promo(id_code_promo)
);

