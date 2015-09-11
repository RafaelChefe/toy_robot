class Position

  attr_reader :x, :y, :direction

  DIRECTIONS = %w(N E S W).freeze

  def direction_left
    DIRECTIONS[(DIRECTIONS.index(direction) - 1) % 4]
  end

  def direction_right
    DIRECTIONS[(DIRECTIONS.index(direction) + 1) % 4]
  end

  def initialize(x, y, direction)
    @x = x
    @y = y
    @direction = direction
  end

end
