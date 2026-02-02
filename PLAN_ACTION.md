# Plan d'Action - Calendrier POO Ruby

## Analyse de l'exercice

### Objectif général
Créer une application de calendrier en Ruby utilisant la Programmation Orientée Objet (POO) avec deux classes principales : `User` et `Event`.

### Structure du projet
```
Poocalendar/
├── lib/
│   ├── user.rb      # Classe User
│   └── event.rb     # Classe Event
├── app.rb           # Point d'entrée qui appelle les classes
├── README.md
├── Gemfile
└── Gemfile.lock
```

---

## Phase 1 : Classe User (Échauffement)

### 1.1 Variables d'instance
- [x] `@email` (String) - accessible en lecture/écriture
- [x] `@age` (Integer) - accessible en lecture/écriture
- Utiliser `attr_accessor` pour les deux

### 1.2 Méthode initialize
- Permettre la création : `User.new("julie@email.com", 32)`
- Paramètres : email et age
- Stocker automatiquement chaque nouvel utilisateur dans une liste globale

### 1.3 Variable de classe
- Créer `@@all_users` (Array) pour stocker tous les utilisateurs
- À chaque création (dans `initialize`), ajouter `self` à `@@all_users`

### 1.4 Méthode de classe
- `User.all` : retourne l'array `@@all_users` avec tous les utilisateurs créés
- Syntaxe : `def self.all`

### 1.5 Méthode find_by_email (Section 2.3.5)
- Méthode de classe : `def self.find_by_email(email)`
- Parcourt `@@all_users`
- Retourne l'objet User dont l'@email correspond
- Exemple : `User.find_by_email("claude@claude.com")`

---

## Phase 2 : Classe Event (Cœur de l'application)

### 2.1 Variables d'instance

#### a) @start_date (Time)
- Type : objet `Time` (pas String)
- Conversion nécessaire : `Time.parse(string_date)`
- Nécessite `require 'time'`
- Format d'entrée : `"2019-01-13 09:00"`
- Accessible via `attr_accessor`

#### b) @duration (Integer)
- Durée en minutes
- Exemple : 30 pour 30 minutes
- Accessible via `attr_accessor`

#### c) @title (String)
- Nom de l'événement
- Exemple : "standup quotidien"
- Accessible via `attr_accessor`

#### d) @attendees (Array)
- Liste d'emails des participants
- Exemple : `["truc@machin.com", "bidule@chose.fr"]`
- Accessible via `attr_accessor`

### 2.2 Méthode initialize
- Création complète : `Event.new("2019-01-13 09:00", 10, "standup quotidien", ["email1", "email2"])`
- Paramètres dans l'ordre :
  1. start_date (string à convertir en Time)
  2. duration (integer)
  3. title (string)
  4. attendees (array)

### 2.3 Méthode postpone_24h
- Décale `@start_date` de 24 heures (86400 secondes)
- Modifie l'événement existant
- Utiliser : `@start_date = @start_date + 86400`

### 2.4 Méthodes d'information

#### a) end_date
- Calcule la date de fin
- Formule : `@start_date + (@duration * 60)` (convertir minutes en secondes)
- Retourne un objet Time

#### b) is_past?
- Retourne `true` si l'événement est passé
- Comparer : `@start_date < Time.now`
- Retourne un booléen

#### c) is_future?
- Inverse de `is_past?`
- Option 1 : `!is_past?`
- Option 2 : `@start_date > Time.now`

#### d) is_soon?
- Retourne `true` si l'événement commence dans moins de 30 minutes
- Condition : `@start_date <= Time.now + (30 * 60)` ET `is_future?`
- Attention : ne doit pas être déjà commencé

### 2.5 Méthode to_s
- Affiche joliment l'événement
- Format :
  ```
  >Titre : [titre]
  >Date de début : [start_date]
  >Durée : [duration] minutes
  >Invités : [liste d'emails séparés par des virgules]
  ```
- Utiliser des `puts` ou retourner un string formaté

---

## Phase 3 : Fichier app.rb

### 3.1 Structure
- Require les fichiers de lib
- Créer des utilisateurs de test
- Créer des événements de test
- Afficher des informations pour vérifier le fonctionnement

### 3.2 Tests à effectuer
1. Créer 2-3 utilisateurs
2. Vérifier `User.all`
3. Créer 2-3 événements (passés, futurs, bientôt)
4. Tester toutes les méthodes :
   - `postpone_24h`
   - `end_date`
   - `is_past?`
   - `is_future?`
   - `is_soon?`
   - `to_s`
5. Tester `User.find_by_email`

---

## Phase 4 : Fonctionnalités BONUS (optionnelles)

### 4.1 EventCreator
- Classe interactive pour créer des événements
- Utiliser `gets.chomp` pour les entrées utilisateur
- Menu guidé étape par étape
- Créer l'événement à la fin

### 4.2 CalendarDisplayer
- Affichage ASCII du calendrier mensuel
- Commencer simple : un mois fixe, un événement par jour
- Puis complexifier progressivement

### 4.3 DateParser
- Convertir langage naturel en dates
- Exemples : "lundi prochain à 9h", "le 14 octobre à 15h"
- Commencer par un format simple et structuré

---

## Ordre d'implémentation recommandé

1. **User.rb - Base** (15 min)
   - Variables d'instance
   - initialize
   - attr_accessor

2. **User.rb - Variables de classe** (15 min)
   - @@all_users
   - self.all

3. **Event.rb - @start_date** (20 min)
   - Comprendre Time
   - Time.parse
   - initialize avec start_date

4. **Event.rb - Autres attributs** (15 min)
   - @duration
   - @title
   - @attendees
   - Compléter initialize

5. **Event.rb - Méthode postpone_24h** (10 min)

6. **Event.rb - Méthodes d'information** (30 min)
   - end_date
   - is_past?
   - is_future?
   - is_soon?

7. **Event.rb - to_s** (15 min)

8. **User.rb - find_by_email** (20 min)

9. **app.rb - Tests** (20 min)

10. **BONUS** (si temps disponible)

---

## Points d'attention

### Manipulation de Time
- Toujours `require 'time'` en haut du fichier
- `Time.parse(string)` pour convertir
- `Time.now` pour l'heure actuelle
- Addition/soustraction en secondes
- Comparaisons avec `<`, `>`, `==`

### Variables de classe vs instance
- `@@variable` = variable de classe (partagée par tous les objets)
- `@variable` = variable d'instance (propre à chaque objet)
- `self` dans initialize = l'objet en cours de création
- `self.methode` = méthode de classe

### attr_accessor
- Crée automatiquement les getters et setters
- Évite d'écrire manuellement les méthodes d'accès

### Debugging
- Utiliser `binding.pry` pour débugger
- Tester chaque méthode dans app.rb avec des `puts`
- IRB pour tester des snippets de code Time

---

## Critères de validation

### User
- ✓ Création avec email et age
- ✓ Lecture/modification des attributs
- ✓ `User.all` retourne tous les users
- ✓ `User.find_by_email` trouve le bon user

### Event
- ✓ Création avec 4 paramètres
- ✓ @start_date est un objet Time
- ✓ Tous les attributs accessibles
- ✓ `postpone_24h` fonctionne
- ✓ `end_date` calcule correctement
- ✓ `is_past?` détecte les événements passés
- ✓ `is_future?` détecte les événements futurs
- ✓ `is_soon?` détecte les événements < 30 min
- ✓ `to_s` affiche proprement

### app.rb
- ✓ Teste toutes les fonctionnalités
- ✓ Code propre et commenté
- ✓ Exemples variés (événements passés, futurs, proches)

---

## Ressources

- Documentation Ruby Time : https://ruby-doc.org/core/Time.html
- POO Ruby : variables de classe et d'instance
- Méthodes de classe vs instance
- attr_accessor / attr_reader / attr_writer
