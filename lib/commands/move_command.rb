# frozen_string_literal: true

require "commands/base_command"

class MoveCommand < BaseCommand
  # attempts to move the robot 1 unit forward. If the new position is valid,
  # updates the robot's position. If it's invalid, nothing happens.
  def execute
    return unless @robot.placed?

    new_position = @robot.current_position.go_to(@robot.current_position.direction)

    @robot.current_position = new_position if @table.position_is_valid?(new_position)
  end
end
