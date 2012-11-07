module Outpost::Piece::Create
  module_function

  def pieces board
    pawns + knights + bishops + rooks + queen + king
  end


  def pawns
    (1..8).map { Outpost::Piece::Pawn.new   }
  end

  def knights
    (1..2).map { Outpost::Piece::Knight.new }
  end

  def bishops
    (1..2).map { Outpost::Piece::Bishop.new }
  end

  def rooks
    (1..2).map { Outpost::Piece::Rook.new   }
  end

  def queen
    [ Outpost::Piece::Queen.new ]
  end

  def king
    [ Outpost::Piece::King.new ]
  end
end
