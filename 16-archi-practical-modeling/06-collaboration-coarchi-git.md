# Collaboration avec coArchi et Git

## 1. Pourquoi Git pour un modèle d'architecture ?

Le modèle évolue comme du code :

- plusieurs contributeurs ;
- historique ;
- branches ;
- reviews ;
- rollback ;
- traçabilité des changements.

## 2. coArchi

coArchi apporte une collaboration Git adaptée aux modèles Archi.

Le principe :

```text
Archi model
↔ coArchi
↔ Git repository
```

Le but n'est pas de manipuler le XML natif à la main au quotidien.

## 3. Workflow recommandé

```text
1. Pull latest model
2. Create/change elements and views
3. Review model locally
4. Commit with meaningful message
5. Push
6. Resolve conflicts if any
```

## 4. Messages de commit

Préférer :

```text
feat: add payment orchestration target view
fix: correct service-to-component realization
refactor: merge duplicate fraud service elements
docs: add ownership properties to payment domain
```

Éviter :

```text
update
changes
final2
new version
```

## 5. Granularité des commits

Un commit doit représenter une décision ou une évolution cohérente.

Exemple :

- ajout de la target application view ;
- correction de la relation Kafka ;
- ajout des plateaus de migration.

Ne pas mélanger 30 changements sans rapport.

## 6. Conflits

Un conflit n'est pas seulement un conflit textuel. Deux architectes peuvent :

- créer deux éléments pour le même concept ;
- renommer différemment ;
- modifier la même vue ;
- changer une relation de manière contradictoire.

La résolution doit préserver la sémantique du modèle.

## 7. Règles d'équipe

Définir :

- convention de nommage ;
- structure des folders ;
- propriétaires de domaines ;
- propriétés obligatoires ;
- règles de review ;
- branches autorisées ;
- stratégie de merge.

## 8. Model governance

Exemple :

```text
Payments Domain Owner
  owns payment application elements

Platform Architecture
  owns OpenShift/Kafka technology elements

Security Architecture
  owns security requirements and platform security services
```

## 9. Review avant merge

Questions :

- élément déjà existant ?
- bon type ?
- relation correcte ?
- direction correcte ?
- nouvelle view nécessaire ?
- documentation suffisante ?
- lifecycle mis à jour ?
- impact sur d'autres views ?

## 10. Ne pas versionner uniquement des images

Une image ne permet pas :

- recherche ;
- impact analysis ;
- relation reuse ;
- canonical element governance.

Le modèle doit rester la source de vérité.

## 11. Git et publication

On peut séparer :

```text
private/shared model repository
→ CI/documentation pipeline
→ published architecture documentation
```

## 12. Règle d'or

> Git versionne le changement ; la gouvernance garantit que ce changement reste sémantiquement cohérent.
