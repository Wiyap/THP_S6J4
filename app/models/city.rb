class City < ApplicationRecord
  has_many :users
  validates :name, presence: true
  validates :zip_code, uniqueness: true, presence: true
end
