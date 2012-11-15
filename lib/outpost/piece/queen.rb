class Outpost::Piece::Queen < OpenStruct
  include Outpost::Piece

  def possible_moves
  end


  def diagonal
    file_index = board.files.index_at square.file
    rank_index = board.ranks.index_at square.rank

    board.files.map do |file|
      file_mod_index = board.files.index_at file
      board.ranks.map do |rank|

        rank_mod_index = board.ranks.index_at rank
        board.squares.find({
          file: board.files[file_index - file_mod_index],
          rank: board.ranks[rank_index - rank_mod_index]
        })

      end.flatten
    end.flatten.uniq
  end


end
