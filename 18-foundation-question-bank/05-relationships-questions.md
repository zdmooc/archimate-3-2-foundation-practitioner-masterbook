# Relations ArchiMate — 50 QCM

> Répondre sans consulter la correction. Une seule réponse est attendue par question.

## Q201
Quelle relation ArchiMate correspond à : « relation whole-part forte où la partie est incluse dans le tout » ?
- **A.** Association
- **B.** Aggregation
- **C.** Assignment
- **D.** Composition

## Q202
Quelle relation ArchiMate correspond à : « relation whole-part plus faible que Composition » ?
- **A.** Composition
- **B.** Realization
- **C.** Aggregation
- **D.** Serving

## Q203
Quelle relation ArchiMate correspond à : « relation entre structure active et comportement/structure qu’elle exécute ou porte » ?
- **A.** Serving
- **B.** Assignment
- **C.** Realization
- **D.** Access

## Q204
Quelle relation ArchiMate correspond à : « relation par laquelle un élément plus concret réalise un élément plus abstrait » ?
- **A.** Triggering
- **B.** Serving
- **C.** Realization
- **D.** Assignment

## Q205
Quelle relation ArchiMate correspond à : « relation où un élément fournit une fonctionnalité à un autre » ?
- **A.** Assignment
- **B.** Realization
- **C.** Access
- **D.** Serving

## Q206
Quelle relation ArchiMate correspond à : « relation entre comportement/structure active et élément passif lu/écrit » ?
- **A.** Serving
- **B.** Access
- **C.** Flow
- **D.** Triggering

## Q207
Quelle relation ArchiMate correspond à : « relation où un élément affecte un élément de Motivation » ?
- **A.** Serving
- **B.** Access
- **C.** Composition
- **D.** Influence

## Q208
Quelle relation ArchiMate correspond à : « relation temporelle/causale entre comportements ou événements » ?
- **A.** Flow
- **B.** Association
- **C.** Serving
- **D.** Triggering

## Q209
Quelle relation ArchiMate correspond à : « relation représentant le transfert de quelque chose d’un élément à un autre » ?
- **A.** Triggering
- **B.** Access
- **C.** Assignment
- **D.** Flow

## Q210
Quelle relation ArchiMate correspond à : « relation où un élément est une version plus spécifique d’un autre » ?
- **A.** Association
- **B.** Specialization
- **C.** Aggregation
- **D.** Realization

## Q211
Quelle relation ArchiMate correspond à : « relation générique non spécifiée lorsqu’aucune relation plus précise n’est appropriée » ?
- **A.** Serving
- **B.** Triggering
- **C.** Composition
- **D.** Association

## Q212
Payment Orchestrator exécute la fonction « Validate Payment ». Quelle relation ?
- **A.** Realization
- **B.** Access
- **C.** Serving
- **D.** Assignment

## Q213
La fonction « Validate Payment » concrétise le service « Payment Validation Service ». Quelle relation ?
- **A.** Assignment
- **B.** Realization
- **C.** Flow
- **D.** Serving

## Q214
« Payment Validation Service » fournit une fonctionnalité au processus « Execute Payment ». Quelle relation ?
- **A.** Access
- **B.** Serving
- **C.** Realization
- **D.** Assignment

## Q215
Un processus lit « Payment Order Data ». Quelle relation ?
- **A.** Triggering
- **B.** Serving
- **C.** Access
- **D.** Flow

## Q216
Un processus A déclenche un processus B après validation. Quelle relation ?
- **A.** Triggering
- **B.** Composition
- **C.** Serving
- **D.** Flow

## Q217
Un message « Payment Status » est transféré du composant A au composant B. Quelle relation ?
- **A.** Triggering
- **B.** Flow
- **C.** Realization
- **D.** Access

## Q218
Une fonction est une partie constitutive d’un composant logique selon le modèle. Quelle relation whole-part forte ?
- **A.** Serving
- **B.** Association
- **C.** Composition
- **D.** Aggregation

## Q219
Une application regroupe plusieurs services sans forte dépendance de cycle de vie. Quelle relation whole-part plus faible peut convenir ?
- **A.** Access
- **B.** Composition
- **C.** Aggregation
- **D.** Assignment

## Q220
Une interface spécifique « Partner Payment API » est une spécialisation de « Payment API ». Quelle relation ?
- **A.** Specialization
- **B.** Aggregation
- **C.** Association
- **D.** Realization

## Q221
Un Driver « Regulation » affecte positivement le Goal « Improve Compliance ». Quelle relation ?
- **A.** Influence
- **B.** Serving
- **C.** Access
- **D.** Assignment

## Q222
Quelle est la direction correcte de Serving ?
- **A.** toujours de gauche à droite
- **B.** du fournisseur vers le consommateur
- **C.** toujours de la couche haute vers la couche basse
- **D.** du consommateur vers le fournisseur

## Q223
Quelle est la direction conceptuelle de Realization ?
- **A.** du concret vers l’abstrait réalisé
- **B.** elle n’a pas de direction
- **C.** toujours du service vers la fonction
- **D.** de l’abstrait vers le concret

## Q224
Pourquoi ne faut-il pas utiliser Association par défaut ?
- **A.** Parce qu’elle perd de la sémantique lorsqu’une relation plus précise existe.
- **B.** Parce qu’elle est interdite en ArchiMate.
- **C.** Parce qu’elle est identique à Composition.
- **D.** Parce qu’elle ne peut relier que des Drivers.

## Q225
Serving et Realization répondent à quelles questions différentes ?
- **A.** Serving = whole-part; Realization = transfert
- **B.** Ils sont synonymes.
- **C.** Serving = qui fournit à qui; Realization = qu’est-ce qui concrétise quoi
- **D.** Serving = qui lit quoi; Realization = qui déclenche quoi

## Q226
Triggering et Flow répondent à quelles questions différentes ?
- **A.** Triggering = whole-part; Flow = spécialisation
- **B.** Triggering = lecture; Flow = implémentation
- **C.** Ils sont synonymes.
- **D.** Triggering = qu’est-ce qui déclenche quoi; Flow = qu’est-ce qui est transféré

## Q227
Access et Flow répondent à quelles questions différentes ?
- **A.** Access = causalité; Flow = whole-part
- **B.** Access = implémentation; Flow = consommation
- **C.** Access = qui lit/écrit quoi; Flow = qu’est-ce qui passe de A à B
- **D.** Ils sont synonymes.

## Q228
Assignment et Serving répondent à quelles questions différentes ?
- **A.** Assignment = lecture; Serving = transfert
- **B.** Assignment = qui exécute/porte quoi; Serving = qui fournit une fonctionnalité à qui
- **C.** Assignment = whole-part; Serving = spécialisation
- **D.** Ils sont synonymes.

## Q229
Une Application Component réalise une Application Service. Quelle relation ?
- **A.** Assignment
- **B.** Realization
- **C.** Serving
- **D.** Access

## Q230
Une Application Service sert un Business Process. Quelle relation ?
- **A.** Serving
- **B.** Realization
- **C.** Composition
- **D.** Influence

## Q231
Un Business Process accède à un Business Object. Quelle relation ?
- **A.** Triggering
- **B.** Serving
- **C.** Flow
- **D.** Access

## Q232
Une Application Function accède à un Data Object. Quelle relation ?
- **A.** Specialization
- **B.** Assignment
- **C.** Serving
- **D.** Access

## Q233
Un Data Object est représenté concrètement par un fichier Artifact. Quelle relation est la plus naturelle ?
- **A.** Assignment
- **B.** Serving
- **C.** Triggering
- **D.** Realization

## Q234
Un System Software fournit un Technology Service. Quelle relation exprime la concrétisation ?
- **A.** Flow
- **B.** Access
- **C.** Realization
- **D.** Serving

## Q235
Un Technology Service est consommé par une Application Component. Quelle relation ?
- **A.** Composition
- **B.** Serving
- **C.** Realization
- **D.** Specialization

## Q236
Un Device héberge un Node logique dans un modèle de virtualisation. Quelle relation peut être choisie selon la structure du modèle ?
- **A.** Access uniquement
- **B.** Serving uniquement
- **C.** Composition ou Aggregation selon la sémantique whole-part voulue
- **D.** Influence uniquement

## Q237
Une panne de Node déclenche un Technology Process de failover. Quelle relation ?
- **A.** Access
- **B.** Aggregation
- **C.** Flow
- **D.** Triggering

## Q238
Le processus de réplication transfère des blocs de données vers le site B. Quelle relation ?
- **A.** Specialization
- **B.** Triggering
- **C.** Flow
- **D.** Assignment

## Q239
Le processus de sauvegarde écrit un Backup Artifact. Quelle relation ?
- **A.** Influence
- **B.** Access
- **C.** Serving
- **D.** Flow uniquement

## Q240
Un Goal est influencé négativement par un Assessment « High Technical Debt ». Quelle relation ?
- **A.** Access
- **B.** Serving
- **C.** Assignment
- **D.** Influence

## Q241
Peut-on dériver automatiquement n’importe quelle relation à travers n’importe quel chemin ?
- **A.** Non, car les relations dérivées n’existent pas.
- **B.** Non; les relations dérivées obéissent à des règles précises.
- **C.** Oui, si le diagramme est lisible.
- **D.** Oui, toute chaîne est transitive.

## Q242
Une relation dérivée doit-elle remplacer toutes les relations directes du modèle ?
- **A.** Oui, toujours.
- **B.** Oui, pour les vues exécutives uniquement.
- **C.** Non; elle sert à inférer/simplifier certains liens, pas à effacer la structure explicite nécessaire.
- **D.** Non, car elle est interdite.

## Q243
Un Junction est-il un élément d’architecture métier ou applicatif ?
- **A.** Oui, c’est un Data Object.
- **B.** Oui, c’est un Node.
- **C.** Non; c’est un connecteur de relations.
- **D.** Oui, c’est un Business Actor.

## Q244
AND Junction exprime quoi ?
- **A.** un choix exclusif systématique
- **B.** une interface technique
- **C.** une combinaison où toutes les branches concernées participent selon la sémantique de la relation
- **D.** une relation whole-part

## Q245
OR Junction exprime quoi ?
- **A.** une alternative entre branches selon la sémantique de la relation
- **B.** un Device
- **C.** une relation Access
- **D.** une obligation de toutes les branches

## Q246
Pourquoi faut-il vérifier source, cible et direction d’une relation ?
- **A.** Parce que seules les flèches horizontales sont valides.
- **B.** Parce qu’une relation peut sembler plausible visuellement mais être sémantiquement ou métamodèlement invalide.
- **C.** Parce que les noms d’éléments suffisent.
- **D.** Parce qu’ArchiMate ignore la direction.

## Q247
Quel ordre de décision est le plus robuste pour choisir une relation ?
- **A.** Question métier → sémantique → direction → légalité source/cible
- **B.** nom du produit → relation par défaut
- **C.** couleur → position → nom → taille
- **D.** direction → couleur → couche → police

## Q248
Un modèle utilise Serving entre un processus et un objet de données pour signifier « lit ». Quel défaut ?
- **A.** Serving est incorrect; Access exprime la lecture/écriture.
- **B.** Il faut Influence.
- **C.** Aucun.
- **D.** Il faut Composition.

## Q249
Un modèle utilise Flow entre un composant et un Data Object pour signifier « stocke ». Quel meilleur choix ?
- **A.** Access avec type write
- **B.** Specialization
- **C.** Serving
- **D.** Triggering

## Q250
Un modèle utilise Triggering pour signifier qu’un JSON est envoyé entre deux systèmes. Quel meilleur choix ?
- **A.** Influence
- **B.** Flow
- **C.** Serving
- **D.** Composition
