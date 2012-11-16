class Outpost::Piece::King < OpenStruct
  include Outpost::Piece

  def possible_moves
    board.squares.find( file: left_file, rank: rank ) +
    board.squares.find( file: left_file, rank: top_rank ) +
    board.squares.find( file: left_file, rank: bottom_rank ) +

    board.squares.find( file: right_file, rank: rank ) +
    board.squares.find( file: right_file, rank: top_rank ) +
    board.squares.find( file: right_file, rank: bottom_rank ) +

    board.squares.find( file: file, rank: top_rank ) +
    board.squares.find( file: file, rank: top_rank )

  end

  def left_file
    board.files.to_a[ board.files.to_a.index(file) - 1]
  end

  def right_file
    board.files.to_a[ board.files.to_a.index(file) + 1]
  end

  def top_rank
    board.ranks.to_a[ board.ranks.to_a.index(rank) - 1]
  end

  def bottom_rank
    board.ranks.to_a[ board.ranks.to_a.index(rank) + 1]
  end
end
