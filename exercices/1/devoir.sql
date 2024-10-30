-- Récupérer l'ensemble des emplacements disponibles pour une période définie



-- Récupérer l'ensemble des données afin de générer une facture pdf par rapport à un Id Client et l'Id d'une commande

# Cette requetes est provoque duplication de données car ne peut récupérer qu'une activité par commande (or une commande peut contenir plusieurs activités)

SELECT
cp.code as promo_code, cp.valeur as promo_valeur, cp.unite as promo_unite,
mp.nom as paiement,
s.date_debut as debut_sejour, s.date_fin as sejour_fin,
s.nombre_adultes as sejour_adults, s.nombre_enfants as sejour_enfants, s.nombre_voitures as sejour_voiture, s.nombre_animaux as sejour_animaux,
e.caution as emplacement_caution, e.prix_bs as emplacement_prix_BS,e.prix_hs as emplacement_prix_HS,
p.nombre_adultes as participation_activite_adults , p.nombre_enfants as participation_activite_enfants,
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