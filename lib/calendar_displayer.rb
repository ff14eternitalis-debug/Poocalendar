require 'time'

# Classe CalendarDisplayer
# Affiche un calendrier mensuel en ASCII avec les événements

class CalendarDisplayer
  attr_accessor :events

  def initialize(events)
    @events = events
  end

  def perform(year = Time.now.year, month = Time.now.month)
    puts "\n========================================="
    puts "   CALENDRIER - #{month_name(month)} #{year}"
    puts "========================================="
    puts

    # Calcul des jours du mois
    first_day = Time.new(year, month, 1)
    # Pour obtenir le dernier jour : on va au premier jour du mois suivant et on retire un jour
    if month == 12
      next_month = Time.new(year + 1, 1, 1)
    else
      next_month = Time.new(year, month + 1, 1)
    end
    last_day = next_month - 1
    num_days = last_day.day

    # Affichage du calendrier par semaine
    current_day = 1
    while current_day <= num_days
      end_day = [current_day + 6, num_days].min
      display_week(year, month, current_day, end_day)
      current_day += 7
    end
  end

  private

  def display_week(year, month, start_day, max_day)
    # Ligne de séparation
    puts "-" * 73

    # Affichage des 7 jours (ou moins si fin de mois)
    days_in_week = []
    7.times do |i|
      day_num = start_day + i
      if day_num <= max_day
        days_in_week << day_num
      else
        days_in_week << nil
      end
    end

    # Ligne 1 : Numéro du jour
    print "|"
    days_in_week.each do |day|
      if day
        print "#{day.to_s.ljust(9)}|"
      else
        print "         |"
      end
    end
    puts

    # Lignes 2-4 : Événements (on affiche max 3 événements par jour)
    3.times do |line_num|
      print "|"
      days_in_week.each do |day|
        if day
          event_text = get_event_for_day(year, month, day, line_num)
          print "#{event_text.ljust(9)}|"
        else
          print "         |"
        end
      end
      puts
    end
  end

  def get_event_for_day(year, month, day, line_num)
    # Trouve les événements pour ce jour
    day_start = Time.new(year, month, day, 0, 0, 0)
    day_end = Time.new(year, month, day, 23, 59, 59)

    day_events = @events.select do |event|
      event.start_date >= day_start && event.start_date <= day_end
    end

    if line_num == 0 && day_events.length > 1
      # Si plus d'un événement, afficher le nombre
      "#{day_events.length} events"
    elsif line_num <= 1 && day_events.length > 0
      # Afficher le premier événement
      event = day_events[line_num == 0 ? 0 : 1] || day_events[0]
      if line_num == 0
        # Heure
        event.start_date.strftime("%H:%M")
      else
        # Titre tronqué
        event.title[0..8]
      end
    else
      ""
    end
  end

  def month_name(month)
    months = ["", "Janvier", "Février", "Mars", "Avril", "Mai", "Juin",
              "Juillet", "Août", "Septembre", "Octobre", "Novembre", "Décembre"]
    months[month]
  end
end
