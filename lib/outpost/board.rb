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
    @squares = []
    ('a' .. 'h').each do |letter|
      1.upto(8) do |number|
        @squares << Outpost::Square.new(letter: letter, number: number)
      end
    end
  end

end
