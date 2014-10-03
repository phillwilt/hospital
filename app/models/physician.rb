class Physician < ActiveRecord::Base
  has_many :patients, through: :appointments
  has_many :appointments
  validates :name, presence: true
end
