class LeftCommand

  def initialize(robot)
    @robot = robot
  end

  # rotates the robot to the left.
  # coordinates stay the same, direction changes to the next cardinal direction to the left
  def execute
    if @robot.placed?
      @robot.current_position = Position.new(@robot.current_position.x,
                                             @robot.current_position.y,
                                             @robot.current_position.direction_left)
    end
  end
end
