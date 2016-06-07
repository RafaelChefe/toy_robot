class MoveCommand

  def initialize(robot, table)
    @robot = robot
    @table = table
  end

  # attempts to move the robot 1 unit forward. If the new position is valid,
  # updates the robot's position. If it's invalid, nothing happens.
  def execute
    if @robot.placed?
      new_position = @robot.current_position.go_to(@robot.current_position.direction)

      @robot.current_position = new_position if @table.position_is_valid?(new_position)
    end
  end
end
