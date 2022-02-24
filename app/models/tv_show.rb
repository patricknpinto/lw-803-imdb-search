class TvShow < ApplicationRecord
  include PgSearch::Model

  multisearchable against: [:title, :synopsis]

  validates :title, presence: true
end
