class Outpost::Square
  attr_reader :letter, :number, :color

  def initialize opts
    @letter = opts[:letter]
    @number = opts[:number]
    @color  = opts[:color]
  end
end
