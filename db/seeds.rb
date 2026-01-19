# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# 1. Create the Users
# We only need the username based on your schema
magnus  = User.find_or_create_by!(username: "magnus")
fabiano = User.find_or_create_by!(username: "fabiano")
hikaru  = User.find_or_create_by!(username: "hikaru")

puts "Users created: #{User.count}"

# 2. Create the Games
# We associate them using the white_player_id and black_player_id
# 'board_state' and 'status' are strings in your schema

# Game 1: Magnus vs Fabiano
Game.find_or_create_by!(white_player_id: magnus.id, black_player_id: fabiano.id) do |g|
  g.board_state = "rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1"
  g.status      = "in_progress"
end

# Game 2: Fabiano vs Hikaru
Game.find_or_create_by!(white_player_id: fabiano.id, black_player_id: hikaru.id) do |g|
  g.board_state = "rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1"
  g.status      = "in_progress"
end

# Game 3: Hikaru vs Magnus
Game.find_or_create_by!(white_player_id: hikaru.id, black_player_id: magnus.id) do |g|
  g.board_state = "rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1"
  g.status      = "completed"
end

puts "Games created: #{Game.count}"