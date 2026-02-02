require_relative 'event'
require_relative 'user'

# Classe EventCreator
# Permet de créer des événements de manière interactive via un menu

class EventCreator
  def initialize
    puts "\n========================================="
    puts "    CRÉATION D'UN NOUVEL ÉVÉNEMENT"
    puts "========================================="
  end

  def perform
    # Demande le titre
    puts "\nQuel est le nom de l'événement ?"
    print "> "
    title = gets.chomp

    # Demande la date
    puts "\nSuper. Quand aura-t-il lieu ?"
    puts "(Format : AAAA-MM-JJ HH:MM, ex: 2026-03-20 14:30)"
    print "> "
    start_date = gets.chomp

    # Demande la durée
    puts "\nAu top. Combien de temps va-t-il durer (en minutes) ?"
    print "> "
    duration = gets.chomp.to_i

    # Demande les participants
    puts "\nGénial. Qui va participer ? Balance leurs e-mails"
    puts "(Sépare-les par des points-virgules, ex: julie@test.com ; jean@test.com)"
    print "> "
    attendees_input = gets.chomp
    attendees = attendees_input.split(';').map(&:strip)

    # Création de l'événement
    event = Event.new(start_date, duration, title, attendees)

    # Confirmation
    puts "\n========================================="
    puts "Super, c'est noté, ton événement a été créé !"
    puts "========================================="
    puts "\nVoici un récapitulatif :"
    event.to_s

    event
  end
end
