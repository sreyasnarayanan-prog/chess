json.extract! game, :id, :board_state, :white_player, :black_player, :status, :created_at, :updated_at
json.url game_url(game, format: :json)
