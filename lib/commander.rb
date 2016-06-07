class Commander

  def initialize(robot, table)
    @robot = robot
    @table = table
  end

  # parses user input and issues the appropriate commands to the robot
  def parse(command)
    if command =~ /^PLACE\s+\d+\s*,\s*\d+\s*,\s*(NORTH|SOUTH|EAST|WEST)$/
      command, x, y, direction = command.gsub(',', ' ').split

      PlaceCommand.new(@robot, @table, Position.new(x.to_i, y.to_i, direction))
    elsif command =~ /^MOVE$/
      MoveCommand.new(@robot, @table)
    elsif command =~ /^LEFT$/
      LeftCommand.new(@robot)
    elsif command =~ /^RIGHT$/
      RightCommand.new(@robot)
    elsif command =~ /^REPORT$/
      ReportCommand.new(@robot)
    end
  end

end
