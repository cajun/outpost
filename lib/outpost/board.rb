# This is the chess board. It holds
# all the squares/pieces. There is
# on board per game. The board will
# be the central hub for the game.
#
# @author Zac Kleinpeter
class Outpost::Board
  attr_reader :squares, :pieces

  TYPE = [:standard, :'960']


  # Setting up the board. Loading it with all the
  # squares and pieces.
  def initialize opts={}
    @files   = opts[:files]
    @ranks   = opts[:ranks]
    @colors  = opts[:colors]
    @squares = Outpost::Squares::Create.squares self
    reset_cycled_colors
    @pieces  = Outpost::Piece::Create.pieces self
    setup_pieces
  end


  def setup_pieces
    @pieces.find(color: :white).each do |p|
      s        = @squares[@pieces.index(p)]
      p.square = s
      s.piece  = p
    end

    @pieces.find(color: :black).each do |p|
      s        = @squares.reverse[@pieces.index(p)]
      p.square = s
      s.piece  = p
    end
  end


  # The definition of the files for this board. By
  # default it will be files 'a' .. 'h'. You can
  # change this by initializing the board with a
  # different range.
  #
  # @returns [Range] # of alpha characters
  def files
    @files ||= 'a' .. 'h'
  end


  # The definition of the ranks for this board. By
  # default it will be files 1 .. 8. You can
  # change this by initializing the board with a
  # different range.
  #
  # @returns [Range] # of numeric values
  def ranks
    @ranks ||= 1 .. 8
  end


  # The definition of the colors for this board. By
  # default it will be files [ :black, :white ]. You can
  # change this by initializing the board with a
  # different array of colors.  This definition will be used to
  # generate the board.
  #
  # @returns [Array] # of numeric values
  def colors
    @colors ||= [:black, :white]
  end


  # This helper will give you a way to cycle the colors
  def cycled_colors
    @cycled_colors ||= colors.cycle
  end

  def reset_cycled_colors
    @cycled_colors = nil
  end


end
