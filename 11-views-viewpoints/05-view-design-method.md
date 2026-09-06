# Construire une vue ArchiMate de qualité

Une vue réussie répond à une question précise et permet à son audience de comprendre ou décider rapidement.

---

## 1. Étape 1 — Identifier l’audience

Exemples :

- direction ;
- métier ;
- architectes ;
- sécurité ;
- exploitation ;
- programme ;
- Green IT.

Ne pas commencer par le diagramme.

---

## 2. Étape 2 — Formuler le concern

Mauvais :

```text
"Je dois faire une vue applicative."
```

Meilleur :

```text
"Le Head of Payments veut comprendre quelles applications supportent le paiement instantané et où sont les dépendances critiques."
```

---

## 3. Étape 3 — Écrire la question de la vue

Une bonne question tient en une phrase.

Exemples :

- Quels processus utilisent le Payment Orchestrator ?
- Quels composants dépendent de Kafka ?
- Quels work packages ferment le gap d’observabilité ?
- Quels serveurs peuvent être retirés après migration ?

---

## 4. Étape 4 — Choisir le viewpoint

Sélectionner le viewpoint qui couvre le mieux la question.

Si aucun ne convient exactement : adapter un viewpoint standard ou construire une vue personnalisée cohérente.

---

## 5. Étape 5 — Sélectionner les éléments

Règle : chaque élément doit contribuer à répondre au concern.

Si un élément n’aide ni à comprendre ni à décider, il doit probablement être masqué.

---

## 6. Étape 6 — Sélectionner les relations

Préférer les relations sémantiquement précises :

- Serving ;
- Realization ;
- Access ;
- Triggering ;
- Flow ;
- Assignment.

Éviter les Associations génériques si une relation plus précise est pertinente.

---

## 7. Étape 7 — Régler le niveau d’abstraction

### Exécutif

```text
Capability → Application Platform → Target Plateau
```

### Solution

```text
Business Process → Application Service → Component → Technology Service
```

### Déploiement

```text
Component → Artifact → System Software → Node
```

Ne pas mélanger ces niveaux sans raison.

---

## 8. Étape 8 — Organiser visuellement

Bonnes pratiques :

- lecture gauche→droite ou haut→bas ;
- zones par couche ou domaine ;
- éviter les lignes croisées ;
- utiliser un nombre limité de relations visibles ;
- noms explicites ;
- légende courte ;
- titre orienté question.

---

## 9. Étape 9 — Vérifier la fidélité au modèle

Une vue ne doit pas inventer une relation absente ou incompatible avec le modèle source.

Contrôler :

- type des éléments ;
- direction ;
- relation ;
- cohérence avec les autres vues ;
- niveau de détail.

---

## 10. Étape 10 — Test stakeholder

Demander :

> En 30 secondes, le stakeholder comprend-il ce que la vue veut démontrer ?

Si non : simplifier.

---

## 11. Anti-patterns

### Poster total

Tout le SI dans un diagramme.

### Spaghetti

Trop de relations croisées.

### Faux détail

Endpoints, ports, tables, pods dans une vue exécutive.

### Vue décorative

Beaucoup de formes, aucune question explicite.

### Vue incohérente

Même élément nommé différemment selon les pages.

### Vue sans audience

Impossible de savoir pour qui elle est conçue.

---

## 12. Definition of Done

Une vue est prête si :

- stakeholder identifié ;
- concern écrit ;
- question principale claire ;
- viewpoint cohérent ;
- éléments nécessaires seulement ;
- relations valides ;
- niveau d’abstraction homogène ;
- lisibilité vérifiée ;
- titre explicite ;
- conclusion possible en quelques secondes.

---

## À retenir

> **Une vue n’est pas un export du modèle : c’est une réponse architecturale ciblée.**
