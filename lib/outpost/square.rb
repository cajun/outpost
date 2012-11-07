class Outpost::Square
  attr_reader :file, :rank, :color

  def initialize opts
    @file  = opts[:file]
    @rank   = opts[:rank]
    @color = opts[:color]
  end

  def notation
    @file + @rank.to_s
  end
end
