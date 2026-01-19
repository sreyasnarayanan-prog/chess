module GamesHelper
  def render_piece(char)
    pieces = {
      'r' => '♜', 'n' => '♞', 'b' => '♝', 'q' => '♛', 'k' => '♚', 'p' => '♟',
      'R' => '♖', 'N' => '♘', 'B' => '♗', 'Q' => '♕', 'K' => '♔', 'P' => '♙',
      ' ' => ''
    }
    pieces[char]
  end
end
