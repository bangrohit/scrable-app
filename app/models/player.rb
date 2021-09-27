class Player < ApplicationRecord
  validates :name, presence: true

  has_many :game_players, dependent: :destroy
end
