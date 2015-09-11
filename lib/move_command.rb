class MoveCommand

  def initialize(robot)
    @robot = robot
  end

  def execute
    unless @robot.not_placed?
      case @robot.current_position.direction
      when 'W'
        @robot.current_position = Position.new(@robot.current_position.x - 1,
                                               @robot.current_position.y,
                                               @robot.current_position.direction)
      when 'E'
        @robot.current_position = Position.new(@robot.current_position.x + 1,
                                               @robot.current_position.y,
                                               @robot.current_position.direction)
      when 'N'
        @robot.current_position = Position.new(@robot.current_position.x,
                                               @robot.current_position.y + 1,
                                               @robot.current_position.direction)
      when 'S'
        @robot.current_position = Position.new(@robot.current_position.x,
                                               @robot.current_position.y - 1,
                                               @robot.current_position.direction)
      end
    end
  end
end
