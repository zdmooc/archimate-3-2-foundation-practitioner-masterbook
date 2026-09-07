# 5 — Génération locale

## 5.1 Option Docker recommandée

Pour éviter les différences de permissions entre le poste local, Docker et GitHub Actions, la génération fournie par le dépôt utilise un flux **stdin → stdout** :

```bash
docker run --rm -i plantuml/plantuml:1.2026.7 \
  -tsvg -pipe < model.puml > model.svg
```

Le conteneur lit la source sur stdin et écrit le SVG sur stdout ; c’est le shell hôte qui crée le fichier de sortie.

## 5.2 Pourquoi cette méthode ?

Elle évite qu’un utilisateur interne au conteneur ait besoin d’écrire directement dans le workspace monté.

Elle fonctionne bien pour :

- poste Linux ;
- macOS ;
- Windows avec Docker ;
- GitHub Actions.

## 5.3 Option JAR

```bash
java -jar plantuml.jar -tsvg model.puml
```

Cette méthode est pratique lorsque Java est déjà disponible.

## 5.4 SVG ou PNG ?

Pour la documentation d’architecture :

- SVG : recommandé pour GitHub/docs, zoom sans perte ;
- PNG : utile pour certains documents bureautiques ;
- texte source `.puml` : toujours conservé.

## 5.5 Script `render.sh`

Le dépôt fournit un script qui :

1. localise tous les fichiers `.puml` ;
2. crée `generated/` ;
3. envoie chaque source au conteneur PlantUML par stdin ;
4. récupère le SVG par stdout ;
5. stocke le résultat dans `generated/`.

Commande :

```bash
bash 17-archimate-as-code/scripts/render.sh
```

## 5.6 Compilation comme test

Une erreur comme :

```text
Unknown function Application_Xxx
```

peut révéler :

- une faute de macro ;
- une version de bibliothèque différente ;
- un concept inventé ;
- un include manquant.

Une compilation réussie ne prouve pas que la sémantique du modèle est correcte.

## 5.7 Boucle de travail locale

```text
éditer .puml
→ check.sh
→ render.sh
→ ouvrir SVG
→ vérifier lisibilité
→ relire sémantique
→ git diff
→ commit
```

## 5.8 Vérification de version

On peut ajouter temporairement :

```plantuml
ArchimateVersionDetails()
```

pour afficher les versions PlantUML / ArchiMate-PlantUML.

## 5.9 Reproductibilité

Le dépôt pinne :

```text
plantuml/plantuml:1.2026.7
```

Une montée de version doit être faite volontairement, puis validée sur toutes les vues.

## 5.10 Debugging

En cas de diagramme illisible :

- réduire le nombre d’éléments ;
- changer le layout ;
- diviser la vue ;
- utiliser des groupings ;
- raccourcir les labels ;
- ne pas inverser des relations pour guider le layout.

## 5.11 Critère de réussite

Le fichier source et le SVG généré doivent raconter la **même architecture**, avec une commande de génération reproductible et sans dépendance aux droits d’écriture internes du conteneur.
