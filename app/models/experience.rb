class Experience < ApplicationRecord

  validates_presence_of :name, :rating
  validates :client_ip, presence: true, uniqueness: true

  def self.amount_rating
    Experience.average('rating')
  end
end
