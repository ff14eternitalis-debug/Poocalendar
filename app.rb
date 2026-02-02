require_relative 'lib/user'
require_relative 'lib/event'

# Point d'entrée de l'application
# Fichier pour tester les classes User et Event

puts "=== Bienvenue dans Poocalendar ==="
puts

# ========================================
# PHASE 1 : Tests de la classe User
# ========================================

puts "--- Test 1 : Création d'utilisateurs ---"
julie = User.new("julie@julie.com", 35)
jean = User.new("jean@jean.com", 23)
claude = User.new("claude@claude.com", 75)

puts "Utilisateur 1 créé : #{julie.email}, #{julie.age} ans"
puts "Utilisateur 2 créé : #{jean.email}, #{jean.age} ans"
puts "Utilisateur 3 créé : #{claude.email}, #{claude.age} ans"
puts

puts "--- Test 2 : Modification d'un utilisateur ---"
puts "Age de Julie avant : #{julie.age} ans"
julie.age = 36
puts "Age de Julie après : #{julie.age} ans"
puts

puts "--- Test 3 : User.all ---"
puts "Nombre total d'utilisateurs : #{User.all.length}"
puts "Liste des emails :"
User.all.each do |user|
  puts "  - #{user.email} (#{user.age} ans)"
end
puts

puts "--- Test 4 : User.find_by_email ---"
user_trouve = User.find_by_email("claude@claude.com")
if user_trouve
  puts "Utilisateur trouvé : #{user_trouve.email}, #{user_trouve.age} ans"
else
  puts "Utilisateur non trouvé"
end

user_inexistant = User.find_by_email("inconnu@test.com")
if user_inexistant
  puts "Utilisateur trouvé : #{user_inexistant.email}"
else
  puts "Recherche 'inconnu@test.com' : Aucun utilisateur trouvé (normal)"
end
puts

puts "=== Phase 1 terminée avec succès ! ==="
puts

# ========================================
# PHASE 2 : Tests de la classe Event
# ========================================

puts "--- Test 1 : Création d'événements ---"
# Événement passé
event_passe = Event.new("2026-01-15 10:00", 30, "Réunion passée", ["julie@julie.com", "jean@jean.com"])
# Événement futur
event_futur = Event.new("2026-03-15 14:00", 60, "Conférence future", ["claude@claude.com"])
# Événement bientôt (dans 15 minutes)
time_soon = Time.now + 15 * 60
event_bientot = Event.new(time_soon.strftime("%Y-%m-%d %H:%M"), 45, "Standup imminent", ["julie@julie.com"])

puts "3 événements créés avec succès"
puts

puts "--- Test 2 : Affichage d'un événement (to_s) ---"
event_futur.to_s
puts

puts "--- Test 3 : end_date ---"
puts "Début : #{event_futur.start_date.strftime("%Y-%m-%d %H:%M")}"
puts "Fin : #{event_futur.end_date.strftime("%Y-%m-%d %H:%M")}"
puts

puts "--- Test 4 : is_past? / is_future? ---"
puts "Événement passé (15 jan) est passé ? #{event_passe.is_past?} (devrait être true)"
puts "Événement passé (15 jan) est futur ? #{event_passe.is_future?} (devrait être false)"
puts "Événement futur (15 mars) est passé ? #{event_futur.is_past?} (devrait être false)"
puts "Événement futur (15 mars) est futur ? #{event_futur.is_future?} (devrait être true)"
puts

puts "--- Test 5 : is_soon? ---"
puts "Événement passé est bientôt ? #{event_passe.is_soon?} (devrait être false)"
puts "Événement futur est bientôt ? #{event_futur.is_soon?} (devrait être false)"
puts "Événement dans 15 min est bientôt ? #{event_bientot.is_soon?} (devrait être true)"
puts

puts "--- Test 6 : postpone_24h ---"
puts "Date avant postpone : #{event_futur.start_date.strftime("%Y-%m-%d %H:%M")}"
event_futur.postpone_24h
puts "Date après postpone : #{event_futur.start_date.strftime("%Y-%m-%d %H:%M")}"
puts

puts "=== Phase 2 terminée avec succès ! ==="
puts

puts "========================================="
puts "Toutes les phases sont terminées ! 🎉"
puts "========================================="
