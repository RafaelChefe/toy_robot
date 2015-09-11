require_relative 'lib/table'
require_relative 'lib/robot'
require_relative 'lib/position'
require_relative 'lib/move_command'
require_relative 'lib/left_command'
require_relative 'lib/right_command'

table = Table.new(5, 5)
robot = Robot.new

loop do
  puts "input command: "
  command = gets

  if command =~ /PLACE\s*\d*,\s*\d*,\s*[NSEW]/
    command, x, y, direction = command.delete(',').split

    robot.place(table, Position.new(x.to_i, y.to_i, direction))
  elsif command =~ /MOVE/
    robot.execute(MoveCommand.new)
  elsif command =~ /LEFT/
    LeftCommand.new(robot).execute
  elsif command =~ /RIGHT/
    RightCommand.new(robot).execute
  elsif command =~ /REPORT/
    puts robot.report
  end
end
