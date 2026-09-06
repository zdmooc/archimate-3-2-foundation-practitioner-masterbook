# Construire une Physical Architecture de qualité

La Physical Layer doit rester utile à une question d’architecture. Le piège est de tomber soit dans un dessin de bâtiment trop détaillé, soit dans une vue IT qui ignore totalement les dépendances physiques.

---

## 1. Commencer par le concern

Exemples de concerns :

- résilience de site ;
- dépendance électrique ;
- refroidissement ;
- localisation réglementaire ;
- capacité datacenter ;
- Green IT ;
- migration de site ;
- continuité d’activité ;
- impact d’un sinistre ;
- dépendances partagées.

La question détermine le niveau de détail.

---

## 2. Identifier les Facilities

Commencer par les lieux réellement pertinents :

- datacenters ;
- régions cloud ;
- bâtiments ;
- salles ;
- agences ;
- sites industriels.

Éviter de modéliser tous les locaux si le concern porte seulement sur la résilience inter-site.

---

## 3. Ajouter les Devices IT critiques

Pour chaque service critique, identifier :

- serveurs ;
- appliances ;
- stockage ;
- réseau ;
- équipements de sécurité.

Ces éléments restent généralement dans la Technology Layer comme `Device`.

---

## 4. Ajouter les Equipment physiques

Seulement si la question le nécessite :

- UPS ;
- PDU ;
- groupe électrogène ;
- chiller ;
- pompe ;
- équipements spécifiques.

Le modèle ne doit pas devenir un schéma électrique détaillé.

---

## 5. Ajouter les réseaux physiques

Distinguer :

```text
Communication Network → information
Distribution Network → énergie / matière
```

Cette distinction évite beaucoup de confusion.

---

## 6. Ajouter les Materials si utiles

Exemples :

- electrical energy ;
- cooling water ;
- fuel.

Ne pas ajouter Material simplement pour remplir la couche.

---

## 7. Relier Technology et Physical

Le modèle doit permettre de suivre :

```text
Technology Service
→ System Software
→ Device
→ Facility
→ Physical dependencies
```

Une vue Physical isolée sans lien avec les services IT est souvent moins utile.

---

## 8. Vérifier la résilience réelle

Pour chaque paire redondée :

- même Facility ?
- même arrivée électrique ?
- même chiller ?
- même réseau ?
- même zone géographique ?
- même opérateur ?
- même dépendance externe ?

Cette analyse révèle les faux designs HA.

---

## 9. Vérifier la granularité

### Trop haut niveau

```text
Datacenter → Applications
```

Aucune dépendance exploitable.

### Trop détaillé

Chaque câble, prise, rack, ventilateur et composant.

### Bon niveau

Les éléments dont la panne ou le changement modifie une décision d’architecture.

---

## 10. Baseline / Target

Une Physical Architecture peut aussi comparer des états.

### Baseline

- un seul site ;
- infrastructure dédiée ;
- dépendances communes ;
- surcapacité.

### Target

- deux sites ;
- mutualisation ;
- chemins physiques séparés ;
- capacité ajustée.

---

## 11. Heatmaps et propriétés

On peut enrichir le modèle avec des propriétés :

- criticité ;
- âge matériel ;
- consommation ;
- capacité ;
- taux d’utilisation ;
- statut de fin de support ;
- empreinte fabrication ;
- PUE du site.

Ces propriétés peuvent ensuite alimenter des heatmaps ou analyses.

---

## 12. Questions de revue

Une revue de Physical Architecture doit pouvoir répondre à :

1. où tourne le service ?
2. quels sites sont critiques ?
3. quelles dépendances physiques sont communes ?
4. quelles infrastructures sont réellement indépendantes ?
5. quels risques de site existent ?
6. quelles dépendances énergie/refroidissement existent ?
7. quelles données de capacité sont disponibles ?
8. la cible réduit-elle ou augmente-t-elle l’empreinte physique ?
9. quelles migrations physiques sont nécessaires ?
10. quelles hypothèses ne sont pas vérifiées ?

---

## 13. Pattern de vue recommandé

```text
[Business/Application concern]
          ↓
Technology Service
          ↓
System Software
          ↓
Device
          ↓
Facility
      ↙       ↘
Equipment   Distribution Network
                ↓
             Material
```

---

## À retenir

> **Une bonne Physical Architecture ne montre pas tout le bâtiment : elle montre les dépendances physiques qui changent une décision d’architecture.**