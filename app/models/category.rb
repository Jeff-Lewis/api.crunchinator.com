class Category < ActiveRecord::Base
  has_many :companies
  validates :name, uniqueness: true, presence: true

  # Categories associated with the passed in companies
  # @param [Array<Company>] A list of Company instances
  scope :associated_with_companies, lambda{|companies| joins(:companies).where('companies.id' => companies)}
end
