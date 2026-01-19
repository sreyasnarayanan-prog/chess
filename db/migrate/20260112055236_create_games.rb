class CreateGames < ActiveRecord::Migration[8.1]
  def change
    create_table :games do |t|
      t.string :board_state
      t.string :white_player
      t.string :black_player
      t.string :status

      t.timestamps
    end
  end
end
