module Outpost::Squares
  def black
    select{ |square| square.color == :black }
  end

  def white
    select{ |square| square.color == :white }
  end

end
