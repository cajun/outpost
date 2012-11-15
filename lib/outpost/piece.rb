module Outpost::Piece
  attr_accessor :board, :square

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

end
