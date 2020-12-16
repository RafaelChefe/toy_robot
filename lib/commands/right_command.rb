# frozen_string_literal: true

require "commands/base_command"

class RightCommand < BaseCommand
  # rotates the robot to the right.
  # coordinates stay the same, direction changes to the next cardinal direction to the right
  def execute
    return unless @robot.placed?

    @robot.current_position = Position.new(@robot.current_position.x_coord,
                                           @robot.current_position.y_coord,
                                           @robot.current_position.direction_right)
  end
end
