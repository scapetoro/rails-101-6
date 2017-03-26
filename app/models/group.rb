class Group < ApplicationRecord
  validates :movie, presence: true
  validates :description, presence: true
end
