require_relative 'lib/event_creator'

# Script pour tester EventCreator en mode interactif
# Exécute : ruby test_event_creator.rb

puts "Ce script va te permettre de créer un événement de manière interactive."
puts

# Créer un événement de manière interactive
creator = EventCreator.new
event = creator.perform

puts "\n✓ Événement créé avec succès !"
