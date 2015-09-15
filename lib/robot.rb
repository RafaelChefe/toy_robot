class Robot

  attr_accessor :current_position

  def initialize
    @current_position = nil
  end

  # returns current x coordinate, y coordinate and direction in readable format:
  # x, y, d
  def report
    if not_placed?
      'not in place'
    else
      "#{@current_position.x}, #{@current_position.y}, #{@current_position.direction}"
    end
  end

  def not_placed?
    @current_position.nil?
  end
end
