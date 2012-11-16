class Outpost::Piece::Queen < OpenStruct
  include Outpost::Piece

  def possible_moves
    diagonal + horizontal
  end


end
