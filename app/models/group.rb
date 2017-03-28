class Group < ApplicationRecord
  belongs_to :user
  has_many :reviews
  validates :movie, presence: true
  validates :description, presence: true

  has_many :group_relationships
  has_many :members, through: :group_relationships, source: :user

  scope :recent, -> { order("created_at DESC")}
end
