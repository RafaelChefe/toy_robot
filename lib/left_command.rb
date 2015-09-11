class LeftCommand

  def initialize(robot)
    @robot = robot
  end

  def execute
    unless @robot.not_placed?
      @robot.current_position = Position.new(@robot.current_position.x,
                                             @robot.current_position.y,
                                             @robot.current_position.direction_left)
    end
  end
end
