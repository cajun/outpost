# This is the chess board. It holds
# all the squares/pieces. There is
# on board per game. The board will
# be the central hub for the game.
#
# @author Zac Kleinpeter
class Outpost::Board
  attr_reader :squares, :pieces

  # Setting up the board. Loading it with all the
  # squares and pieces.
  def initialize
    @squares = Outpost::Squares::Create.squares
    @pieces  = {
      black: Outpost::Piece::Create.create_pieces(:black),
      white: Outpost::Piece::Create.create_pieces(:white)
    }
  end



end
