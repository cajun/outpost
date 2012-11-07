module Outpost::Piece::Create
  module_function

  def pieces board =nil
    board.colors.map do |color|
      pawns(color) + knights(color) + bishops(color) + rooks(color) + queen(color) + king(color)
    end.flatten.extend Outpost::Pieces
  end


  def pawns color
    (1..8).map { Outpost::Piece::Pawn.new color: color   }
  end

  def knights color
    (1..2).map { Outpost::Piece::Knight.new color: color }
  end

  def bishops color
    (1..2).map { Outpost::Piece::Bishop.new color: color }
  end

  def rooks color
    (1..2).map { Outpost::Piece::Rook.new color: color   }
  end

  def queen color
    [ Outpost::Piece::Queen.new(color: color) ]
  end

  def king color
    [ Outpost::Piece::King.new(color: color) ]
  end
end
