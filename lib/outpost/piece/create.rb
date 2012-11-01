module Outpost::Piece::Create
  module_function

  def create_pieces color=nil
    (1..8).map { Outpost::Piece::Pawn.new   } +
    (1..2).map { Outpost::Piece::Knight.new } +
    (1..2).map { Outpost::Piece::Bishop.new } +
    (1..2).map { Outpost::Piece::Rook.new   } +
    [ Outpost::Piece::Queen.new ]             +
    [ Outpost::Piece::King.new ]
  end
end
