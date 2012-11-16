class Outpost::Piece::Bishop < OpenStruct
  include Outpost::Piece

  def possible_moves
    diagonal
  end

end
