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