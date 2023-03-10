class Movie < ApplicationRecord
  has_many :bookmarks, dependent: :destroy

  validates :title, :overview, presence: true
end
