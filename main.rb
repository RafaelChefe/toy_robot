require_relative 'lib/commander'
require_relative 'lib/table'
require_relative 'lib/robot'
require_relative 'lib/position'
require_relative 'lib/move_command'
require_relative 'lib/left_command'
require_relative 'lib/place_command'
require_relative 'lib/right_command'
require_relative 'lib/report_command'

table = Table.new(5, 5)
robot = Robot.new
commander = Commander.new(robot, table)

puts "welcome to the toy robot simulator!"

loop do
  puts "input command (EXIT to quit): "

  input = gets

  command = commander.parse(input)

  command.execute unless command.nil?

  break if input =~ /exit/i
end
