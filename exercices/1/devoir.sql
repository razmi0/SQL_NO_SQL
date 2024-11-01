-- Récupérer l'ensemble des emplacements disponibles pour une période définie

SELECT emplacement.id_emplacement, sejour.date_debut, sejour.date_fin
FROM emplacement
LEFT JOIN emplacement_sejour ON emplacement.id_emplacement = emplacement_sejour.id_emplacement
LEFT JOIN sejour ON emplacement_sejour.id_sejour = sejour.id_sejour
WHERE (sejour.date_fin < '2024-06-01' OR sejour.date_debut > '2024-07-01')
OR sejour.date_debut IS NULL;

DELIMITER //


DELIMITER ;

-- Récupérer l'ensemble des données afin de générer une facture pdf par rapport à un Id Client et l'Id d'une commande

-- 1. le code promo
SELECT code_promo.code as code_promo, code_promo.valeur as code_promo_valeur, code_promo.unite as code_promo_unite
FROM commande
LEFT JOIN commande_code_promo ON commande.id_commande = commande_code_promo.id_commande
LEFT JOIN code_promo ON commande_code_promo.id_code_promo = code_promo.id_code_promo
WHERE commande.id_commande = 1

-- 2. le mode de paiement
SELECT mode_paiement.nom as mode_de_paiement
FROM commande
LEFT JOIN mode_paiement ON commande.id_mode_paiement = mode_paiement.id_mode_paiement
WHERE commande.id_commande = 1

-- 3. les emplacements et leurs types pour le sejour pour la commande
SELECT type.nom as emplacement_type, emplacement.caution as emplacement_caution, emplacement.prix_bs as emplacement_prix_bs, emplacement.prix_hs as emplacement_prix_hs,
sejour.date_debut as sejour_date_debut, sejour.date_fin as sejour_date_fin, sejour.nombre_adultes as sejour_nombre_adultes, sejour.nombre_enfants as sejour_nombre_enfants, sejour.nombre_voitures as sejour_nombre_voitures, sejour.nombre_animaux as sejour_nombre_animaux
FROM commande
LEFT JOIN sejour ON commande.id_commande = sejour.id_commande
LEFT JOIN emplacement_sejour ON sejour.id_sejour = emplacement_sejour.id_sejour
LEFT JOIN emplacement ON emplacement_sejour.id_emplacement = emplacement.id_emplacement
LEFT JOIN type ON emplacement.id_type = type.id_type
WHERE commande.id_commande = 1

-- 4. les activités pour le sejour pour la commande
SELECT activite.nom as activite_nom, activite.prix_adulte_bs as activite_prix_adulte_bs, activite.prix_adulte_hs as activite_prix_adulte_hs, activite.prix_enfant_bs as activite_prix_enfant_bs, activite.prix_enfant_hs as activite_prix_enfant_hs, activite.prix_animal as activite_prix_animal,
participation.nombre_adultes as participation_nombre_adultes, participation.nombre_enfants as participation_nombre_enfants
FROM commande
LEFT JOIN sejour ON commande.id_commande = sejour.id_commande
LEFT JOIN participation ON sejour.id_sejour = participation.id_sejour
LEFT JOIN activite ON participation.id_activite = activite.id_activite
WHERE commande.id_commande = 2

