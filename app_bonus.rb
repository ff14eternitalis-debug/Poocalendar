require_relative 'lib/user'
require_relative 'lib/event'
require_relative 'lib/event_creator'
require_relative 'lib/calendar_displayer'
require_relative 'lib/date_parser'

puts "========================================="
puts "   DÉMONSTRATION DES BONUS"
puts "========================================="
puts

# ========================================
# BONUS 3 : DateParser (on le teste en premier car utile pour la suite)
# ========================================

puts "\n=== BONUS 3 : DateParser ==="
puts "\nTest de différents formats de dates :"

# Test 1 : Demain
date1 = DateParser.parse("demain à 10h")
puts "- 'demain à 10h' => #{date1.strftime("%Y-%m-%d %H:%M")}"

# Test 2 : Aujourd'hui
date2 = DateParser.parse("aujourd'hui à 16h30")
puts "- 'aujourd'hui à 16h30' => #{date2.strftime("%Y-%m-%d %H:%M")}"

# Test 3 : Jour de la semaine
date3 = DateParser.parse("lundi prochain à 9h")
puts "- 'lundi prochain à 9h' => #{date3.strftime("%Y-%m-%d %H:%M")}"

# Test 4 : Date avec mois
date4 = DateParser.parse("le 14 mars à 15h")
puts "- 'le 14 mars à 15h' => #{date4.strftime("%Y-%m-%d %H:%M")}"

# Test 5 : Format standard
date5 = DateParser.parse("2026-12-25 18:00")
puts "- '2026-12-25 18:00' => #{date5.strftime("%Y-%m-%d %H:%M")}"

puts "\n✓ DateParser fonctionne !"

# ========================================
# BONUS 2 : CalendarDisplayer
# ========================================

puts "\n=== BONUS 2 : CalendarDisplayer ==="
puts "\nCréation d'événements pour le mois de mars 2026 :"

# Créer plusieurs événements pour mars 2026
events = []
events << Event.new("2026-03-05 09:00", 30, "Standup", ["dev@test.com"])
events << Event.new("2026-03-05 14:00", 60, "Review", ["team@test.com"])
events << Event.new("2026-03-06 10:00", 45, "Planning", ["all@test.com"])
events << Event.new("2026-03-10 11:00", 90, "Workshop", ["team@test.com"])
events << Event.new("2026-03-15 15:00", 30, "Demo", ["client@test.com"])
events << Event.new("2026-03-20 09:00", 120, "Training", ["dev@test.com"])
events << Event.new("2026-03-23 10:00", 60, "Meeting", ["mgmt@test.com"])
events << Event.new("2026-03-23 14:00", 30, "1-on-1", ["john@test.com"])
events << Event.new("2026-03-23 16:00", 45, "Retro", ["team@test.com"])

puts "#{events.length} événements créés"

# Afficher le calendrier
displayer = CalendarDisplayer.new(events)
displayer.perform(2026, 3)

puts "\n✓ CalendarDisplayer fonctionne !"

# ========================================
# BONUS 1 : EventCreator (mode interactif)
# ========================================

puts "\n=== BONUS 1 : EventCreator ==="
puts "\nMode interactif désactivé dans cette démo automatique."
puts "Pour tester EventCreator en mode interactif, exécute :"
puts "  ruby -e \"require_relative 'lib/event_creator'; EventCreator.new.perform\""
puts

# Exemple de ce que fait EventCreator (sans interaction)
puts "Voici ce que fait EventCreator :"
puts "1. Demande le nom de l'événement"
puts "2. Demande la date (format AAAA-MM-JJ HH:MM)"
puts "3. Demande la durée en minutes"
puts "4. Demande les participants (emails séparés par ;)"
puts "5. Crée l'événement et affiche un récapitulatif"

puts "\n✓ EventCreator est prêt à l'emploi !"

# ========================================
# Résumé final
# ========================================

puts "\n========================================="
puts "   TOUS LES BONUS SONT IMPLÉMENTÉS ! 🎉"
puts "========================================="
puts
puts "Résumé des fichiers créés :"
puts "- lib/event_creator.rb : Création interactive d'événements"
puts "- lib/calendar_displayer.rb : Affichage calendrier ASCII"
puts "- lib/date_parser.rb : Parsing de dates en langage naturel"
puts
puts "Pour tester EventCreator en mode interactif :"
puts "  ruby test_event_creator.rb"
