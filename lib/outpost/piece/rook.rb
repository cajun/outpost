class Outpost::Piece::Rook < OpenStruct
  include Outpost::Piece

  def possible_moves
    horizontal
  end
end

