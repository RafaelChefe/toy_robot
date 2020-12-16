# frozen_string_literal: true

class Commander
  def initialize(robot, table)
    @robot = robot
    @table = table
  end

  # parses user input and issues the appropriate commands to the robot
  def parse(command)
    case command
    when /^PLACE\s+\d+\s*,\s*\d+\s*,\s*(NORTH|SOUTH|EAST|WEST)$/
      _command, x, y, direction = command.gsub(",", " ").split

      PlaceCommand.new(@robot, @table, Position.new(x.to_i, y.to_i, direction))
    when /^MOVE$/
      MoveCommand.new(@robot, @table)
    when /^LEFT$/
      LeftCommand.new(@robot)
    when /^RIGHT$/
      RightCommand.new(@robot)
    when /^REPORT$/
      ReportCommand.new(@robot)
    end
  end
end
