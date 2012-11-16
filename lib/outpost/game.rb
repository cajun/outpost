class Outpost::Game
  attr_accessor :history, :iteration

  def initialize
    @iteration = 1
    @history = { @iteration => Outpost::Board.new }
  end

  def board
    @history[@iteration]
  end


  def move piece, square
    if piece.possible_moves.include? square
      piece.square.piece = nil
      piece.square, square.piece = square, piece
    end
  end

end
