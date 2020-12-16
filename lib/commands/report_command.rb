# frozen_string_literal: true

require "commands/base_command"

class ReportCommand < BaseCommand
  # prints the robot's current position to the standard output, in readable format
  def execute
    puts @robot.report
  end
end
