# Classe User
# Gère les utilisateurs de l'application calendrier

class User
  # Accesseurs pour lire et modifier email et age
  attr_accessor :email, :age

  # Variable de classe pour stocker tous les utilisateurs créés
  @@all_users = []

  def initialize(email, age)
    # Initialisation des variables d'instance
    @email = email
    @age = age

    # Ajout de l'utilisateur créé dans la liste globale
    @@all_users << self
  end

  # Méthode de classe : retourne tous les utilisateurs
  def self.all
    @@all_users
  end

  # Méthode de classe : trouve un utilisateur par son email
  def self.find_by_email(email)
    @@all_users.find { |user| user.email == email }
  end
end
