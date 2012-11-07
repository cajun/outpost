module Outpost::Squares::Create
  module_function
  # Method to create the initial squares on the board
  #
  # @returns [[Outpost::Square]] squares
  def squares board
    board.files.map do |file|
      board.ranks.map do |rank|
        Outpost::Square.new(file: file, rank: rank, color: board.cycled_colors.next)
      end
    end.flatten.extend Outpost::Squares
  end


end

