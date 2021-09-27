class CreateGamePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :game_players do |t|
      t.references :player, null: false, foreign_key: true
      t.references :game, null: false, foreign_key: true
      t.float :score

      t.timestamps
    end
  end
end
