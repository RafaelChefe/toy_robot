class Position

  attr_reader :x, :y, :direction

  DIRECTIONS = %w(N E S W).freeze

  def initialize(x, y, direction)
    @x = x
    @y = y
    @direction = direction
  end

end
