# frozen_string_literal: true

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
  attr_reader :x_coord, :y_coord, :direction

  # these are the four main cardinal directions: North, East, South and West
  # see the chart below:
  #      N
  #      |
  #      |
  # W----+-----E
  #      |
  #      |
  #      S
  DIRECTIONS = %w[NORTH EAST SOUTH WEST].freeze

  def initialize(x_coord, y_coord, direction)
    @x_coord = x_coord
    @y_coord = y_coord
    @direction = direction
  end

  def go_to(direction)
    case direction
    when "NORTH"
      go_north
    when "EAST"
      go_east
    when "SOUTH"
      go_south
    when "WEST"
      go_west
    end
  end

  def ==(other)
    @x_coord == other.x_coord && @y_coord == other.y_coord && @direction == other.direction
  end

  # these helper methods return THE NEXT cardinal direction of a given position,
  # to the LEFT and to the RIGHT, respectively
  def direction_left
    DIRECTIONS[(DIRECTIONS.index(direction) - 1) % 4]
  end

  def direction_right
    DIRECTIONS[(DIRECTIONS.index(direction) + 1) % 4]
  end

  private

  def go_north
    Position.new(@x_coord, @y_coord + 1, @direction)
  end

  def go_south
    Position.new(@x_coord, @y_coord - 1, @direction)
  end

  def go_west
    Position.new(@x_coord - 1, @y_coord, @direction)
  end

  def go_east
    Position.new(@x_coord + 1, @y_coord, @direction)
  end
end
