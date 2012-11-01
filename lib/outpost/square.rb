class Outpost::Square
  attr_reader :file, :row, :color

  def initialize opts
    @file  = opts[:file]
    @row   = opts[:row]
    @color = opts[:color]
  end

  def notation
    @file + @row.to_s
  end
end
