class RefactorGamesForUsersAndHistory < ActiveRecord::Migration[8.1]
  def change
    puts "!!! RAILS IS ACTUALLY RUNNING THIS FILE NOW !!!" # Add this line
    change_table :games do |t|
      # 1. Remove the old string-based player columns
      t.remove :white_player, type: :string
      t.remove :black_player, type: :string

      # 2. Add the integer ID columns for associations
      # 'index: true' makes searching for a user's games much faster
      t.integer :white_player_id, index: true
      t.integer :black_player_id, index: true

      # 3. Add the game history column
      t.json :moves, default: []
    end
    
    # Optional: Adds a formal foreign key constraint at the database level
    add_foreign_key :games, :users, column: :white_player_id
    add_foreign_key :games, :users, column: :black_player_id
  end
end
