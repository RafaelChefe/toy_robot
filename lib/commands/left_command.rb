# frozen_string_literal: true

require "commands/base_command"

class LeftCommand < BaseCommand
  # rotates the robot to the left.
  # coordinates stay the same, direction changes to the next cardinal direction to the left
  def execute
    return unless @robot.placed?

    @robot.current_position = Position.new(@robot.current_position.x_coord,
                                           @robot.current_position.y_coord,
                                           @robot.current_position.direction_left)
  end
end
