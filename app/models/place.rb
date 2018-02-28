class Place < ApplicationRecord
  belongs_to :user
  validates :address, :description, :name, presence: { message: "This field is required." }
  validates :name, length: { minimum: 4 }
end
