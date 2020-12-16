# frozen_string_literal: true

require "commands/base_command"

class PlaceCommand < BaseCommand
  # puts the robot at the given position, if position is valid.
  # if the position is not valid, nothing happens
  def execute
    @robot.current_position = @position if @table.position_is_valid?(@position)
  end
end
