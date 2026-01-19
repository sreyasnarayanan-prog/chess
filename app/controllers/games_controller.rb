# app/controllers/games_controller.rb
class GamesController < ApplicationController
  def show
    @game = Game.find(params[:id])
    
    # We convert the FEN string into an 8x8 array so the view can loop over it easily
    # We take the first part of the FEN (the piece positions)
    fen_board = @game.board_state.split(' ')[0]
    @rows = fen_board.split('/').map do |row|
      # Metaprogramming/Regex trick: expand numbers (like '8') into empty spaces
      row.gsub(/\d/) { |n| " " * n.to_i }.chars
    end
  end

  def update
    @game = Game.find(params[:id])
    new_move = params[:move]

    # Because of our 'last_move_must_be_legal' validation, 
    # .save will return false if the move is illegal!
    @game.moves << new_move
    
    if @game.save
      redirect_to @game, notice: "Move played: #{new_move}"
    else
      # If validation fails, we redirect back with the error message
      redirect_to @game, alert: @game.errors.full_messages.to_sentence
    end
  end
end