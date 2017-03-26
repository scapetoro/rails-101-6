class Group < ApplicationRecord
  belongs_to :user
  has_many :reviews
  validates :movie, presence: true
  validates :description, presence: true
end
