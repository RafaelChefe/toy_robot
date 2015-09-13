class PlaceCommand

  def initialize(robot, table, position)
    @robot = robot
    @table = table
    @position = position
  end

  def execute
    @robot.current_position = @position if @table.position_is_valid?(@position)
  end

end
