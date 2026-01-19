class User < ApplicationRecord
  has_many :white_games, class_name: "Game", foreign_key: "white_player_id"
  has_many :black_games, class_name: "Game", foreign_key: "black_player_id"

  validates :bio, length: {maximum: 50}, allow_blank: true

  def games
    Game.where("white_player_id = ? OR black_player_id = ?", id, id)
  end

end
