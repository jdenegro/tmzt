class Movie < ApplicationRecord
  belongs_to :user
  has_many :bookmarks, dependent: :destroy

  validates :title, :overview, presence: true
  validates :title, uniqueness: true
end
