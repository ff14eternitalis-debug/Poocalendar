require 'time'

# Classe DateParser
# Interprète des dates en langage naturel et les convertit en objets Time

class DateParser
  JOURS_SEMAINE = {
    "lundi" => 1, "mardi" => 2, "mercredi" => 3, "jeudi" => 4,
    "vendredi" => 5, "samedi" => 6, "dimanche" => 0
  }

  MOIS = {
    "janvier" => 1, "février" => 2, "mars" => 3, "avril" => 4,
    "mai" => 5, "juin" => 6, "juillet" => 7, "août" => 8,
    "septembre" => 9, "octobre" => 10, "novembre" => 11, "décembre" => 12
  }

  def self.parse(date_string)
    date_string = date_string.downcase.strip

    # Format 1 : "lundi prochain à 9h" ou "lundi prochain à 14h30"
    if date_string =~ /(\w+) prochain à (\d+)h(\d*)/
      day_name = $1
      hour = $2.to_i
      minute = $3.empty? ? 0 : $3.to_i
      return next_weekday(day_name, hour, minute)
    end

    # Format 2 : "le 14 octobre à 15h" ou "le 14 octobre à 15h30"
    if date_string =~ /le (\d+) (\w+) à (\d+)h(\d*)/
      day = $1.to_i
      month_name = $2
      hour = $3.to_i
      minute = $4.empty? ? 0 : $4.to_i
      return parse_day_month(day, month_name, hour, minute)
    end

    # Format 3 : "demain à 10h" ou "demain à 10h30"
    if date_string =~ /demain à (\d+)h(\d*)/
      hour = $1.to_i
      minute = $2.empty? ? 0 : $2.to_i
      tomorrow = Time.now + 24 * 60 * 60
      return Time.new(tomorrow.year, tomorrow.month, tomorrow.day, hour, minute)
    end

    # Format 4 : "aujourd'hui à 16h" ou "aujourd'hui à 16h45"
    if date_string =~ /aujourd'hui à (\d+)h(\d*)/
      hour = $1.to_i
      minute = $2.empty? ? 0 : $2.to_i
      now = Time.now
      return Time.new(now.year, now.month, now.day, hour, minute)
    end

    # Format 5 : Format standard "AAAA-MM-JJ HH:MM"
    begin
      return Time.parse(date_string)
    rescue
      raise "Format de date non reconnu : #{date_string}"
    end
  end

  private

  def self.next_weekday(day_name, hour, minute)
    target_wday = JOURS_SEMAINE[day_name]
    return nil unless target_wday

    today = Time.now
    current_wday = today.wday

    # Calculer le nombre de jours à ajouter
    days_ahead = target_wday - current_wday
    days_ahead += 7 if days_ahead <= 0

    target_date = today + (days_ahead * 24 * 60 * 60)
    Time.new(target_date.year, target_date.month, target_date.day, hour, minute)
  end

  def self.parse_day_month(day, month_name, hour, minute)
    month = MOIS[month_name]
    return nil unless month

    year = Time.now.year
    # Si le mois est déjà passé cette année, prendre l'année prochaine
    if month < Time.now.month || (month == Time.now.month && day < Time.now.day)
      year += 1
    end

    Time.new(year, month, day, hour, minute)
  end
end
