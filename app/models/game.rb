class Game < ApplicationRecord
  validates :name, presence: true

  has_many :game_players, dependent: :destroy
	accepts_nested_attributes_for :game_players, reject_if: :all_blank, allow_destroy: true
end
