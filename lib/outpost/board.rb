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
    @squares = create_squares
    @pieces = {
      black: create_pieces(:black),
      white: create_pieces(:white)
    }
  end


  def create_squares
    colors = [:black,:white].cycle
    ('a' .. 'h').map do |letter|
      (1 .. 8 ).map do |number|
        Outpost::Square.new(letter: letter, number: number, color: colors.next)
      end
    end.flatten.extend Squares
  end

  def create_pieces color=nil
    (1..8).map { Outpost::Piece::Pawn.new   } +
    (1..2).map { Outpost::Piece::Knight.new } +
    (1..2).map { Outpost::Piece::Bishop.new } +
    (1..2).map { Outpost::Piece::Rook.new   } +
    [ Outpost::Piece::Queen.new ]             +
    [ Outpost::Piece::King.new ]
  end


end
