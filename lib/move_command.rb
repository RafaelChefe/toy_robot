class MoveCommand

  def initialize(robot, table)
    @robot = robot
    @table = table
  end

  # attempts to move the robot 1 unit forward. If the new position is valid,
  # updates the robot's position. If it's invalid, nothing happens.
  def execute
    unless @robot.not_placed?
      new_position =
        case @robot.current_position.direction
        when 'W'
          Position.new(@robot.current_position.x - 1,
                       @robot.current_position.y,
                       @robot.current_position.direction)
        when 'E'
          Position.new(@robot.current_position.x + 1,
                       @robot.current_position.y,
                       @robot.current_position.direction)
        when 'N'
          Position.new(@robot.current_position.x,
                       @robot.current_position.y + 1,
                       @robot.current_position.direction)
        when 'S'
          Position.new(@robot.current_position.x,
                       @robot.current_position.y - 1,
                       @robot.current_position.direction)
        end

      @robot.current_position = new_position if @table.position_is_valid?(new_position)
    end
  end
end
