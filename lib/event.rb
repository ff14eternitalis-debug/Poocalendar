require 'time'

# Classe Event
# Gère les événements du calendrier

class Event
  # Accesseurs pour tous les attributs
  attr_accessor :start_date, :duration, :title, :attendees

  def initialize(start_date, duration, title, attendees)
    # Conversion du string en objet Time
    @start_date = Time.parse(start_date)

    # Durée en minutes (integer)
    @duration = duration

    # Titre de l'événement (string)
    @title = title

    # Liste des participants (array d'emails)
    @attendees = attendees
  end

  # Décale l'événement de 24 heures (86400 secondes)
  def postpone_24h
    @start_date = @start_date + 24 * 60 * 60
  end

  # Calcule et retourne la date de fin
  def end_date
    @start_date + @duration * 60
  end

  # Retourne true si l'événement est déjà passé
  def is_past?
    @start_date < Time.now
  end

  # Retourne true si l'événement est dans le futur
  def is_future?
    !is_past?
  end

  # Retourne true si l'événement commence dans moins de 30 minutes
  def is_soon?
    time_until_start = @start_date - Time.now
    time_until_start > 0 && time_until_start <= 30 * 60
  end

  # Affiche l'événement de manière formatée
  def to_s
    puts ">Titre : #{@title}"
    puts ">Date de début : #{@start_date.strftime("%Y-%m-%d %H:%M")}"
    puts ">Durée : #{@duration} minutes"
    puts ">Invités : #{@attendees.join(', ')}"
  end
end
