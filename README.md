# Poocalendar

Application de calendrier en Ruby utilisant la Programmation Orientée Objet (POO).

## Description

Ce projet est un exercice de POO qui permet de :
- Créer et gérer des utilisateurs
- Créer et gérer des événements avec dates, durées, titres et participants
- Manipuler et afficher des événements

## Structure

```
Poocalendar/
├── lib/
│   ├── user.rb      # Classe User
│   └── event.rb     # Classe Event
├── app.rb           # Point d'entrée
├── README.md
├── Gemfile
└── PLAN_ACTION.md   # Plan d'implémentation détaillé
```

## Installation

```bash
bundle install
```

## Utilisation

```bash
ruby app.rb
```

## Classes

### User
Gère les utilisateurs avec :
- Email
- Âge
- Méthodes de recherche et listage

### Event
Gère les événements avec :
- Date de début (Time)
- Durée (en minutes)
- Titre
- Liste de participants
- Méthodes de manipulation et d'information

## Auteur

Exercice POO Ruby - The Hacking Project
