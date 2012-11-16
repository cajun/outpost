module Outpost::Piece::Create
  module_function

  def pieces board
    board.colors.map do |color|
      pawns(board, color) +
        knights(board, color) +
        bishops(board, color) +
        rooks(board, color) +
        queen(board, color) +
        king(board, color)
    end.flatten.extend Outpost::Pieces
  end


  def pawns board, color
    (1..8).map { Outpost::Piece::Pawn.new board: board, color: color   }
  end

  def knights board, color
    (1..2).map { Outpost::Piece::Knight.new board: board, color: color }
  end

  def bishops board, color
    (1..2).map { Outpost::Piece::Bishop.new board: board, color: color }
  end

  def rooks board, color
    (1..2).map { Outpost::Piece::Rook.new board: board, color: color   }
  end

  def queen board, color
    [ Outpost::Piece::Queen.new(board: board, color: color) ]
  end

  def king board, color
    [ Outpost::Piece::King.new(board: board, color: color) ]
  end

end
