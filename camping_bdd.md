# camping

Reprendre la conception du projet Camping

## Construction de la structure de la bdd

à l'aide de PMA ( php my admin) ou en ligne de commande, construire la structure de la BDD :

- pensez aux clés primaires, étrangères et tables pivot
- appliquez un maximum de contraintes et de valeurs par défault

## Alimenter votre bdd avec des jeux de données

## Requêtes de type Select

- Récupérer l'ensemble des emplacements disponibles pour une période définie
- Récupérer l'ensemble des données afin de générer une facture pdf par rapport à un Id Client et l'Id d'une commande

```sql


-- -- Active: 1728385530506@@127.0.0.1@3306@db_camping

# Inserting dummy data to the database

# DONE
INSERT INTO mode_paiement (nom) VALUES ('Carte bancaire');
INSERT INTO mode_paiement (nom) VALUES ('Espèces');
INSERT INTO mode_paiement (nom) VALUES ('Chèque');

INSERT INTO `type` (`nom`) VALUES ('Tente');
INSERT INTO `type` (`nom`) VALUES ('Caravane');

INSERT INTO `equipement` (`nom`) VALUES ('Climatisation');
INSERT INTO `equipement` (`nom`) VALUES ('Chauffage');
INSERT INTO `equipement` (`nom`) VALUES ('Barbecue');

INSERT INTO `utilisateur` (`email`,   `nom`, `prenom`, `role`)
VALUES                  ('dfgdsfgdf', 'Doe', 'John', 'client');

INSERT INTO `utilisateur` (`email`,     `nom`, `prenom`, `role`)
VALUES              ('user2@gmail.com', 'Doe', 'Jane', 'client');

INSERT INTO `utilisateur` (`email`, `nom`, `prenom`, `role`)
VALUES ('utlisateur3@gmail.com', 'Doe', 'Jack', 'client');

INSERT INTO `utilisateur` (`email`, `nom`, `prenom`, `role`)
VALUES ('salarie1@camping.com', 'Doe', 'Jane', 'salarie');

INSERT INTO `utilisateur` (`email`, `nom`, `prenom`, `role`)
VALUES ('admin@camping.com', 'Doe', 'Jack', 'admin');

INSERT INTO code_promo (code, expiration, valeur, unite, nombre_utilisation) VALUES ('PROMO10', '2022-12-31 23:59:59', 10, 'pourcentage', 100);
INSERT INTO code_promo (code, expiration, valeur, unite, nombre_utilisation) VALUES ('PROMO20', '2022-12-31 23:59:59', 20, 'pourcentage', 100);

INSERT INTO activite (nom,       description, prix_adulte_hs, prix_adulte_bs, prix_enfant_hs, prix_enfant_bs, prix_animal, duree)
VALUES              ('Pêche', 'Pêche en rivière', 10.00,        15.00,           5.00,           10.00,          5.00,      120);

INSERT INTO activite (nom,       description, prix_adulte_hs, prix_adulte_bs, prix_enfant_hs, prix_enfant_bs, prix_animal, duree)
VALUES              ('Randonnée', 'Randonnée en montagne', 10.00,        15.00,           5.00,           10.00,          5.00,      120);

INSERT INTO activite (nom,       description, prix_adulte_hs, prix_adulte_bs, prix_enfant_hs, prix_enfant_bs, prix_animal, duree)
VALUES              ('Vélo', 'Vélo en montagne', 10.00,        15.00,           5.00,           10.00,          5.00,      120);

INSERT INTO commande (id_mode_paiement, id_utilisateur) VALUES (1, 1);

INSERT INTO commande (id_mode_paiement, id_utilisateur) VALUES (2, 2);

INSERT INTO commande (id_mode_paiement, id_utilisateur) VALUES (3, 3);
INSERT INTO sejour (nombre_adultes, nombre_enfants, date_debut,         date_fin,   nombre_voitures, nombre_animaux, id_commande)
VALUES               (2,             2,      '2022-12-31 23:59:59', '2023-01-07 23:59:59', 1,           1,              1);


INSERT INTO sejour (nombre_adultes, nombre_enfants, date_debut,         date_fin,   nombre_voitures, nombre_animaux, id_commande)
VALUES               (2,             2,      '2022-12-31 23:59:59', '2023-01-07 23:59:59', 1,           1,              2);

INSERT INTO sejour (nombre_adultes, nombre_enfants, date_debut,         date_fin,   nombre_voitures, nombre_animaux, id_commande)
VALUES               (2,             2,      '2022-12-31 23:59:59', '2023-01-07 23:59:59', 1,           1,              3);

INSERT INTO emplacement (prix_hs, prix_bs, places, caution, id_type) VALUES (10.00, 15.00, 10, 50.00, 1);

INSERT INTO emplacement (prix_hs, prix_bs, places, caution, id_type) VALUES (10.00, 15.00, 10, 50.00, 2);


INSERT INTO avis (note, commentaire, date_modification, id_utilisateur, id_emplacement) VALUES (5, 'Super emplacement', '2022-12-31 23:59:59', 1, 1);

INSERT INTO avis (note, commentaire, date_modification, id_utilisateur, id_emplacement) VALUES (5, 'Super emplacement', '2022-12-31 23:59:59', 2, 2);




INSERT INTO participation (data_heure, nombre_adultes, nombre_enfants, id_activite, id_sejour) VALUES ('2022-12-31 23:59:59', 2, 2, 1, 2);

INSERT INTO participation (data_heure, nombre_adultes, nombre_enfants, id_activite, id_sejour) VALUES ('2022-12-31 23:59:59', 2, 2, 2, 3);

INSERT INTO emplacement_sejour (id_emplacement, id_sejour) VALUES (1, 2);

INSERT INTO emplacement_sejour (id_emplacement, id_sejour) VALUES (2, 3);

INSERT INTO emplacement_equipement (id_emplacement, id_equipement) VALUES (1, 1);

INSERT INTO emplacement_equipement (id_emplacement, id_equipement) VALUES (2, 4);

INSERT INTO commande (id_mode_paiement, id_utilisateur) VALUES (1, 1);

INSERT INTO commande (id_mode_paiement, id_utilisateur) VALUES (2, 2);


INSERT INTO commande_code_promo (id_commande, id_code_promo) VALUES (1, 1);

INSERT INTO commande_code_promo (id_commande, id_code_promo) VALUES (2, 2);

# Not done


##Requêtes de type Select :

-- - Récupérer l'ensemble des emplacements disponibles pour une période définie
-- - Récupérer l'ensemble des données afin de générer une facture pdf par rapport à un Id Client et l'Id d'une commande
-- -

SELECT
cp.code as promo_code, cp.valeur as promo_valeur, cp.unite as promo_unite,
mp.nom as paiement,
s.date_debut as debut_sejour, s.date_fin as sejour_fin,
s.nombre_adultes as sejour_adults, s.nombre_enfants as sejour_enfants, s.nombre_voitures as sejour_voiture, s.nombre_animaux as sejour_animaux,
e.caution as emplacement_caution, e.prix_bs as emplacement_prix_BS,e.prix_hs as emplacement_prix_HS,
p.nombre_adultes as participation_activite_adults  , p.nombre_enfants as participation_activite_enfants,
a.nom as activite_nom,a.prix_adulte_bs as activite_prix_BS,a.prix_adulte_hs as acitivte_prix_adulte_HS,a.prix_enfant_bs as activite_prix_enfant_BS,a.prix_enfant_hs as activite_prix_enfant_HS,a.prix_animal as activite_prix_animal,
u.nom as client_nom, u.prenom as client_prenom, u.email as client_email
FROM commande as c
LEFT JOIN commande_code_promo as ccp ON c.id_commande = ccp.id_commande
LEFT JOIN code_promo as cp ON ccp.id_code_promo = cp.id_code_promo
LEFT JOIN mode_paiement as mp ON c.id_mode_paiement = mp.id_mode_paiement
LEFT JOIN sejour as s ON c.id_commande = s.id_commande
LEFT JOIN emplacement_sejour as es ON s.id_sejour = es.id_sejour
LEFT JOIN emplacement as e ON es.id_emplacement = e.id_emplacement
LEFT JOIN participation as p ON s.id_sejour = p.id_sejour
LEFT JOIN activite as a ON p.id_activite = a.id_activite
LEFT JOIN utilisateur as u ON c.id_utilisateur = u.id_utilisateur
WHERE c.id_commande = 1


```
