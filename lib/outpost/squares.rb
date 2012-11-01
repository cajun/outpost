module Outpost::Squares
  # Select only the black squares
  #
  # @returns [[Outpost::Square]] black squares
  def black
    find color: :black
  end

  # Select only the white squares
  #
  # @returns [[Outpost::Square]] white squares
  def white
    find color: :white
  end


  # Find any given square on the board
  #
  # @example
  #   board = Outpost::Board.new
  #   board.squares.find file: 'e'      # => [[Outpost::Square]] that are in file 'e'
  #   board.squares.find row: '3'       # => [[Outpost::Square]] that are in row '3'
  #   board.squares.find notation: 'b3' # => [[Outpost::Square]] that are in file 'b' row '3'
  #
  # @returns [[Outpost::Square]] the discovered squares
  def find opts
    opts.inject(self) do |squares,option|
      squares.select{ |square| square.method(option.first).call == option.last }
    end
  end

end
