module Outpost::Squares::Create
  module_function
  # Method to create the initial squares on the board
  #
  # @returns [[Outpost::Square]] squares
  def squares board
    board.files.map do |file|
      board.ranks.map do |rank|
        Outpost::Square.new(file: file, rank: rank, color: self.cycled_colors(board).next)
      end
    end.flatten.extend Outpost::Squares
  end


  def cycled_colors(board)
    @cycled_colors ||= board.colors.cycle
  end

end

