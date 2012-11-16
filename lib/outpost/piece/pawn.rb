class Outpost::Piece::Pawn < OpenStruct
  include Outpost::Piece

  def possible_moves
    board.squares.find(file: file, rank: next_rank)
  end

  def next_file
    board.ranks.to_a[ board.ranks.to_a.index(rank) + 1]
  end
end
