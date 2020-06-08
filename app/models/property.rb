class Property < ApplicationRecord
  belongs_to :user
  has_many :reviews

  validates :address, presence: true
  validates :lat, presence: true
  validates :long, presence: true
end
