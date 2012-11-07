
module Outpost::Pieces

  # Find any given piece on the board
  #
  # @example
  #   board = Outpost::Board.new
  #   board.pieces.find file: 'e'      # => [[Outpost::Piece]] that are in file 'e'
  #   board.pieces.find rank: '3'      # => [[Outpost::Piece]] that are in rank '3'
  #   board.pieces.find notation: 'b3' # => [[Outpost::Piece]] that are in file 'b' rank '3'
  #
  # @returns [[Outpost::Piece]] the discovered pieces
  def find opts
    opts.inject(self) do |pieces,option|
      pieces.select{ |piece| piece.method(option.first).call == option.last }
    end
  end

end
