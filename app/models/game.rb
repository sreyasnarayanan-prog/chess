class Game < ApplicationRecord
    belongs_to :white_player, class_name: "User"
    belongs_to :black_player, class_name: "User"

    attribute :moves, :json, default: []

    validate :last_move_must_be_legal

    before_validation :set_default_board_state, on: :create

    def last_move_must_be_legal
        return if moves.blank?

        begin
            test_engine = new_game
            if board_state_was
                test_engine.set_fen!(board_state_was)
            end

            if !test_engine.move(moves.last)
                errors.add(:moves, "contains an illegal move: #{moves.last}")
                return
            end

            if test_engine.board.checkmate?
                if test_engine.active_player == :black
                    status = "white wins by checkmate"
                else
                    status = "black wins by checkmate"
                end
                puts("Game over, #{status}")
            end
            self.board_state = test_engine.board.to_fen
        rescue StandardError => e
            puts(e.message)
            errors.add(:moves, "triggered an error: #{moves.last}")
        end
    end

    private
    
    def set_default_board_state
        self.board_state = default_fen
    end
    
    def default_fen
        new_game.board.to_fen
    end

    def new_game
        Chess::Game.new
    end

end
