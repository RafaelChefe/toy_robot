# frozen_string_literal: true

class Robot
  attr_accessor :current_position

  def initialize
    @current_position = nil
  end

  # returns current x coordinate, y coordinate and direction in readable format:
  # x, y, d
  def report
    if !placed?
      "not in place"
    else
      [@current_position.x_coord, @current_position.y_coord, @current_position.direction].join(",")
    end
  end

  def placed?
    !@current_position.nil?
  end
end
