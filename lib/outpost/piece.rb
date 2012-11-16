module Outpost::Piece
  attr_accessor :square

  def notation
    file + rank.to_s
  end

  def file
    square.file
  end

  def rank
    square.rank
  end

  # Return and array of squares that are available for this
  # piece to move.
  #
  # @returns [[Squares]]
  def moves?
    []
  end


  # Instruct the piece to move to a given square.
  #
  # @returns [Boolean] - true if the move was made
  def move square
    false
  end


  # States if this piece is directly under threat of being taken
  # by another piece.
  #
  # @returns [Boolean] - true if a threat exists
  def threatened?
    false
  end


  # List out all the pieces that directly threatens to take this piece
  # in it's current location.
  #
  # @returns [[Piece]] - array of pieces that threatens this piece
  def threatened_by
    []
  end


  # List out if this piece is in an open file
  # ( a.k.a. no friendly pieces are on this file and no opponent pawns )
  #
  # @returns [Boolean] - true if no pieces block it's path
  def open_file?
    false
  end


  # List out if this piece is in a semi open file
  # ( a.k.a. no pawns are on this file )
  #
  # @returns [Boolean] - true if no pawns are on this file
  def semi_open_file?
    false
  end

  def diagonal limit=nil
    file_index = board.files.to_a.index square.file
    rank_index = board.ranks.to_a.index square.rank

    board.squares.find(piece: nil).select do |square|
      mod_file = board.files.to_a.index square.file
      mod_rank = board.ranks.to_a.index square.rank

      (mod_file - file_index).abs == (mod_rank - rank_index).abs

    end +
    board.squares.find(piece_color: other_color).select do |square|
      mod_file = board.files.to_a.index square.file
      mod_rank = board.ranks.to_a.index square.rank

      (mod_file - file_index).abs == (mod_rank - rank_index).abs

    end.uniq{|s| [s.rank, s.file]}

  end


  def horizontal limit=nil
    (board.squares.find( piece_color: other_color, rank: square.rank ) +
      board.squares.find( piece_color: other_color, file: square.file )).uniq{|s| [s.rank, s.file]} +
    (board.squares.find( piece: nil, rank: square.rank ) +
      board.squares.find( piece: nil, file: square.file )).uniq{|s| [s.rank, s.file]}
  end

  def other_color
    (board.colors - [self.color]).first
  end


end
