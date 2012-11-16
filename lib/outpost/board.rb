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
    setup_pawns

    setup_rooks files.first, files.last
    setup_knights files.to_a[1], files.to_a[-2]
    setup_bishops files.to_a[2], files.to_a[-3]

    setup_queens files.to_a[4]
    setup_kings  files.to_a[3]

  end


  def setup_pawns
    @pieces.find(color: :white, class: Outpost::Piece::Pawn).each_with_index do |p|
      @files.each do |file|
        s        = @squares.find( file: file, rank: ranks.to_a[1] ).first
        p.square = s
        s.piece  = p
      end
    end

    @pieces.find(color: :black, class: Outpost::Piece::Pawn).each_with_index do |p|
      @files.each do |file|
        s        = @squares.find( file: file, rank: ranks.to_a[-2] ).first
        p.square = s
        s.piece  = p
      end
    end

  end

  def setup_rooks *files
    setup_piece Outpost::Piece::Rook, :white, files, ranks.first
    setup_piece Outpost::Piece::Rook, :black, files, ranks.last
  end

  def setup_knights *files
    setup_piece Outpost::Piece::Knight, :white, files, ranks.first
    setup_piece Outpost::Piece::Knight, :black, files, ranks.last
  end

  def setup_bishops *files
    setup_piece Outpost::Piece::Bishop, :white, files, ranks.first
    setup_piece Outpost::Piece::Bishop, :black, files, ranks.last
  end

  def setup_kings file
    setup_single Outpost::Piece::King, :white, file, ranks.first
    setup_single Outpost::Piece::King, :black, file, ranks.last
  end

  def setup_queens file
    setup_single Outpost::Piece::Queen, :white, file, ranks.first
    setup_single Outpost::Piece::Queen, :black, file, ranks.last
  end

  def setup_piece klass, color, files, rank
    left, right  = *@pieces.find(color: color, class: klass)

    square       = @squares.find( file: files.first, rank: rank ).first
    left.square  = square
    square.piece = left

    square       = @squares.find( file: files.last, rank: rank ).first
    right.square  = square
    square.piece = right
  end

  def setup_single klass, color, file, rank
    piece        = @pieces.find(color: color, class: klass).first
    square       = @squares.find( file: file, rank: rank ).first
    piece.square = square
    square.piece = piece
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
