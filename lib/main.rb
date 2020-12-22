# frozen_string_literal: true

$LOAD_PATH.unshift(File.dirname(__FILE__))

require "commander"
require "table"
require "robot"
require "position"
require "commands/move_command"
require "commands/left_command"
require "commands/place_command"
require "commands/right_command"
require "commands/report_command"

# initializes a new 5x5 table, a new robot, and a new command interpreter
table = Table.new(5, 5)
robot = Robot.new
commander = Commander.new(robot, table)

puts "welcome to the toy robot simulator!"

# keeps reading commands from stdin until user types EXIT
loop do
  puts "input command (EXIT to quit): "

  input = gets

  command = commander.parse(input)

  command&.execute

  break if input =~ /exit/i
end
