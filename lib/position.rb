# x is the robot's HORIZONTAL position
# y is the robot's VERTICAL position
# see the chart below:
# Y cooordinate
#       ^
#       |
#       |
#       |
#       +-------> X coordinate
class Position
  attr_reader :x, :y, :direction

  # these are the four main cardinal directions: North, East, South and West
  # see the chart below:
  #      N
  #      |
  #      |
  # W----+-----E
  #      |
  #      |
  #      S
  DIRECTIONS = %w(N E S W).freeze

  def initialize(x, y, direction)
    @x = x
    @y = y
    @direction = direction
  end

  def ==(other)
    @x == other.x && @y == other.y && @direction == other.direction
  end

  # these helper methods return THE NEXT cardinal direction of a given position,
  # to the LEFT and to the RIGHT, respectively
  def direction_left
    DIRECTIONS[(DIRECTIONS.index(direction) - 1) % 4]
  end

  def direction_right
    DIRECTIONS[(DIRECTIONS.index(direction) + 1) % 4]
  end
end
