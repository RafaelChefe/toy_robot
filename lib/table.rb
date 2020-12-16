# frozen_string_literal: true

class Table
  def initialize(length, width)
    @length = length
    @width = width
  end

  # coordinates x and y can't be negative, and can't be larger than table size
  def position_is_valid?(position)
    position.x_coord < @length &&
      position.y_coord < @width &&
      position.x_coord >= 0 &&
      position.y_coord >= 0
  end
end
