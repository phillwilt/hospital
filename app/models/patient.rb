class Patient < ActiveRecord::Base
  has_many :physicians, through: :appointments
  has_many :appointments
  validates :name, presence: true
end
