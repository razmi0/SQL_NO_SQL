    
    -- 6 id de mode de paiement
    INSERT INTO mode_paiement (nom) 
        VALUES ('Carte bancaire'),
                ('Espèces'),
                ('Chèque'),
                ('Virement'),
                ('Bitcoin'),
                ('PayPal');

    -- 5 id de type d'emplacement
    INSERT INTO type (nom) 
        VALUES ('Tente'),
                ('Caravane'),
                ('Camping-car'),
                ('Mobil-home'),
                ('Bungalow');

    -- 9 id d'équipement
    INSERT INTO equipement (nom)
        VALUES ('Electricité'),
                ('Climatisation'),
                ('Eau potable'),
                ('Sanitaires'),
                ('Douche'),
                ('Cuisine'),
                ('Barbecue'),
                ('Piscine'),
                ('Télévision');
    
    -- 10 id d'activité
    INSERT INTO utilisateur (email,           nom,    prenom, role)
                VALUES  ('usr1@gmail.com', 'Doe', 'John', 'client'),
                        ('usr2@gmail.com', 'Doe', 'Jane', 'client'),
                        ('usr3@gmail.com', 'Doe', 'Jack', 'client'),
                        ('salarie1@gmailcom', 'Doe', 'Jane', 'salarie'),
                        ('usr5@example.com', 'Smith', 'Alice', 'client'),
                        ('admin1@hotmail.com', 'Williams', 'David', 'admin'),
                        ('usr7@yahoo.com', 'Miller', 'Emily', 'client'),
                        ('salarie2+business@company.com', 'Brown', 'Charles', 'salarie'),
                        ('usr9.personal@domain.net', 'Garcia', 'Isabella', 'client'),
                        ('admin2_unique@uniquemail.org', 'Johnson', 'Olivia', 'admin'),
                        ('another.user@webmail.com', 'Davis', 'William', 'client'),
                        ('user11@outlook.com', 'Wilson', 'Sophia', 'client'),
                        ('salarie3_pro@company.fr', 'Moore', 'James', 'salarie'),
                        ('user13@icloud.com', 'Taylor', 'Ava', 'client'),
                        ('salarie4+work@domain.org', 'Anderson', 'Benjamin', 'salarie'),
                        ('user15.personal@gmail.com', 'Thomas', 'Charlotte', 'client'),
                        ('admin3_unique@hotmail.com', 'Jackson', 'Henry', 'admin'),
                        ('user17@yahoo.com', 'White', 'Amelia', 'client'),
                        ('salarie5+business@company.net', 'Harris', 'Michael', 'salarie'),
                        ('user19.personal@domain.org', 'Martin', 'Emily', 'client'),
                        ('admin4_unique@outlook.com', 'Adams', 'Ethan', 'admin');
    
    -- 3 id de code promo
    INSERT INTO code_promo (code, expiration, valeur, unite, nombre_utilisation)
                VALUES ('PROMO10', '2024-12-31 23:59:59', 10, 'pourcentage', 100),
                        ('PROMO20', '2024-12-31 23:59:59', 20, 'pourcentage', 100),
                        ('PROMO30', '2024-12-31 23:59:59', 30, 'euro', 100);

    -- 16 id d'emplacement
    INSERT INTO activite (nom,           description,         prix_adulte_hs,   prix_adulte_bs,   prix_enfant_hs,  prix_enfant_bs,    prix_animal,     duree)
                VALUES ('Pêche',        'Pêche en rivière',     10.00,             15.00,          5.00,               10.00,          5.00,               120),
                    ('Randonnée',       'Randonnée en montagne', 10.00,        15.00,          5.00,               10.00,          5.00,               120),
                        ('Vélo',        'Vélo en montagne',        10.00,        15.00,          5.00,               10.00,          5.00,               120),
                        ('Piscine',     'Piscine',              10.00,        15.00,          5.00,               10.00,          5.00,               120),
                        ('Tennis',      'Tennis',                10.00,        15.00,          5.00,               10.00,          5.00,               120),
                        ('Football',    'Football',            10.00,        15.00,          5.00,               10.00,          5.00,               120),
                        ('Basketball',  'Basketball',        10.00,        15.00,          5.00,               10.00,          5.00,               120),
                        ('Volleyball',  'Volleyball',        10.00,        15.00,          5.00,               10.00,          5.00,               120),
                        ('Ping-pong',   'Ping-pong',          10.00,        15.00,          5.00,               10.00,          5.00,               120),
                        ('Baby-foot',   'Baby-foot',          10.00,        15.00,          5.00,               10.00,          5.00,               120);
    
    -- 10 id de commande
    INSERT INTO commande (id_mode_paiement, id_utilisateur)
                VALUES      (1,                 1),
                            (2,                 2),
                            (3,                 3),
                            (4,                 4),
                            (2,                 5),
                            (3,                 6),
                            (5,                 7),
                            (2,                 8),
                            (3,                 9),
                            (4,                 10);
    
    -- 10 id de sejour
    INSERT INTO sejour (nombre_adultes, nombre_enfants, date_debut,             date_fin,               nombre_voitures, nombre_animaux, id_commande)
                VALUES      (2,             2,          '2024-06-10 12:00:00', '2024-07-10 12:00:00',       1,              1,              1),
                            (2,             2,          '2024-06-12 12:00:00', '2024-07-02 12:00:00',       1,              1,              2),
                            (2,             2,          '2024-06-20 12:00:00', '2024-08-07 12:00:00',       1,              1,              3),
                            (2,             1,          '2024-05-15 10:00:00', '2024-05-25 12:00:00',       1,              0,              4),
                            (3,             0,          '2024-06-01 14:00:00', '2024-06-10 18:00:00',        2,              1,              5),
                            (1,             2,          '2024-06-20 09:00:00', '2024-07-05 11:00:00',        0,              0,              6),
                            (4,             1,          '2024-07-12 13:00:00', '2024-07-22 15:00:00',        2,              2,              7),
                            (2,             0,          '2024-07-25 16:00:00', '2024-08-05 18:00:00',        1,              1,              8),
                            (3,             2,          '2024-08-08 10:00:00', '2024-08-18 12:00:00',        2,              0,              9),
                            (1,             1,          '2024-08-21 14:00:00', '2024-09-01 16:00:00',        0,              1,              10);

    -- 16 id d'emplacement
    INSERT INTO emplacement (prix_hs,   prix_bs,    places,     caution,    id_type)
                VALUES      (10.00,     15.00,      10,         50.00,      1),
                            (10.00,     15.00,      10,         50.00,      2),
                            (15.00,     20.00,       12,        60.00,      1),
                            (12.00,     18.00,      8,          40.00,      2),
                            (20.00,     25.00,      15,          75.00     , 3),
                            (10.00,     15.00,      10,          50.00     , 4),
                            (18.00,     22.00,      12,          65.00     , 5),
                            (13.00,     19.00,      9,          45.00,      1),
                            (11.00,     17.00,      8,          40.00,      2),
                            (22.00,     28.00,      16,          80.00     , 3),
                            (9.00,      4.00,       4,           5.00,       4),
                            (17.00,     21.00,      11,          60.00     , 5),
                            (14.00,     20.00,      10,          55.00     , 1),
                            (12.00,     18.00,      8,          40.00,      2),
                            (21.00,     27.00,      15,          75.00     , 3),
                            (11.00,     16.00,      10,          50.00     , 4),
                            (19.00,     23.00,      13,          65.00     , 5);

    -- 14 id d'avis
    INSERT INTO avis (note,             commentaire,                                    date_modification,              id_utilisateur,             id_emplacement)
            VALUES  (4,         'Bon emplacement, mais un peu cher.',                   '2024-05-15 12:34:56',              1,                          2),
                    (5,         'Très bien situé, propre et calme.',                    '2024-06-28 09:12:34',              2,                          3),
                    (3,         'Un peu déçu par la propreté.',                         '2024-07-10 15:30:21',              3,                          4),
                    (5,         'Excellent emplacement, personnel très sympathique.',   '2024-08-05 18:45:12',              4,                          5),
                    (2,         'Problème de réservation, pas très clair.',             '2024-06-20 11:00:00',              5,                          6),
                    (4,         'Bien situé, mais un peu bruyant la nuit.',             '2024-07-12 13:30:45',              6,                          7),
                    (5,         'Parfait pour un séjour en famille.',                   '2024-08-25 16:15:30',              7,                          8),
                    (3,         'Un peu déçu par le service.',                          '2024-07-10 19:20:15',              8,                          9),
                    (4,         'Bon emplacement, mais un peu petit.',                  '2024-06-05 10:45:00',              9,                          10),
                    (5,         'Très bon rapport qualité-prix.',                       '2024-08-20 12:30:15',              10,                          11),
                    (3,         'Un peu déçu par la vue.',                              '2024-07-15 14:15:30',              1,                          12),
                    (4,         'Bon emplacement, mais un peu loin du centre-ville.',   '2024-06-01 16:00:00',              2,                          13),
                    (5,         'Très bien situé, propre et calme.',                    '2024-08-10 17:45:15',              3,                          14),
                    (2,         'Problème de réservation, pas très clair.',             '2024-07-25 19:30:00',              4,                          15),
                    (4,         'Bien situé, mais un peu bruyant la nuit.',             '2024-08-12 21:15:45',              5,                          16);

    -- 15 id de participation
    INSERT INTO participation (date_heure,              nombre_adultes, nombre_enfants, id_activite,        id_sejour)                 
                    VALUES     ('2024-05-15 10:00:00',      2,               1,             1,                  1),
                                ('2024-06-01 14:00:00',      3,            0,               2,                2),
                                ('2024-06-20 09:00:00',      1,            2,               3,                3),
                                ('2024-07-12 13:00:00',      4,            1,               4,                4),
                                ('2024-07-25 16:00:00',      2,            0,               5,                5),
                                ('2024-08-08 10:00:00',      3,            2,               6,                6),
                                ('2024-08-21 14:00:00',      1,            1,               7,                7),
                                ('2024-05-05 12:00:00',      2,            2,               8,                8),
                                ('2024-06-05 18:00:00',      3,            0,               9,                9),
                                ('2024-06-25 11:00:00',      1,            2,               1,                10),
                                ('2024-07-15 14:00:00',      4,            1,               2,                2),
                                ('2024-07-30 17:00:00',      2,            0,               3,                2),
                                ('2024-08-10 10:00:00',      3,            2,               4,                3),
                                ('2024-08-25 14:00:00',      1,            1,               5,                4),
                                ('2024-05-10 16:00:00',      2,            2,               6,                5),
                                ('2024-06-10 20:00:00',      4,            1,               7,                6);
    -- 10 id d'emplacement_sejour
    INSERT INTO emplacement_sejour (id_emplacement, id_sejour)
                            VALUES (1,                   1),
                                    (2,                  2),
                                    (3,                  3),
                                    (4,                  4),
                                    (5,                  5),
                                    (6,                  6),
                                    (7,                  7),
                                    (8,                  8),
                                    (9,                  9),
                                    (10,                 10),
                                    (11,                 1),
                                    (12,                 2),
                                    (13,                 3),
                                    (14,                 4),
                                    (15,                 5),
                                    (16,                 6);

        -- 16 id d'emplacement_equipement
        INSERT INTO emplacement_equipement (id_emplacement,id_equipement)
                                        VALUES
                                            (1,                  1),
                                            (2,                  3),
                                            (2,                  4),
                                            (3,                  5),
                                            (3,                  6),
                                            (4,                  7),
                                            (4,                  8),
                                            (5,                  1),
                                            (6,                  3),
                                            (6,                  4),
                                            (7,                  5),
                                            (7,                  6),
                                            (8,                  7),
                                            (8,                  8),
                                            (9,                  1),
                                            (11,                     5),
                                            (11,                     6),
                                            (12,                     7),
                                            (12,                     8),
                                            (13,                     1),
                                            (14,                     3),
                                            (14,                     4),
                                            (15,                     5),
                                            (15,                     6),
                                            (16,                     7),
                                            (16,                     8);
        -- 5 id de commande_code_promo
        INSERT INTO commande_code_promo (id_commande, id_code_promo)
                                        VALUES
                                            (1,              1),
                                            (3,              2),
                                            (5,              1),
                                            (7,              3),
                                            (9,              2);