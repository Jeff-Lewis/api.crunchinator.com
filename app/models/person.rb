class Person < ActiveRecord::Base
  has_many :investments, :as => :investor
  has_many :office_locations, :as => :tenant, :dependent => :destroy

  validates :permalink, uniqueness: true, presence: true

  # companies whose name attribute does not begin with an alphabetical character
  scope :non_alpha, lambda{ where("substr((SELECT COALESCE(people.firstname, '') || COALESCE(people.lastname, '')),1,1) NOT IN (?)", [*('a'..'z'),*('A'..'Z')]).order('people.firstname, people.lastname asc')}

  # companies whose name attribute begins with the specified character
  def self.starts_with(char)
    where("Upper(substr((SELECT COALESCE(people.firstname, '') || COALESCE(people.lastname, '')),1,1)) = :char", {char: char.upcase}).order('people.firstname, people.lastname asc')
  end

  # @return [String] - returns a name value for the person it is called on
  # it will return 'Unknown Name' if the Person has no name values
  def name
    (return 'Unknown Name') if !firstname && !lastname
    (return firstname+' '+lastname) if firstname && lastname
    (return firstname) if firstname
    lastname
  end
end
