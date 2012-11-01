module Outpost::Squares::Create
  module_function
  # Method to create the initial squares on the board
  #
  # @returns [[Outpost::Square]] squares
  def squares
    self.files.map do |letter|
      self.rows.map do |number|
        Outpost::Square.new(letter: letter, number: number, color: self.cycled_colors.next)
      end
    end.flatten.extend Outpost::Squares
  end

  def files
    'a' .. 'h'
  end

  def rows
    1 .. 8
  end

  def colors
    [:black, :white]
  end

  def cycled_colors
    @cycled_colors ||= colors.cycle
  end

end

