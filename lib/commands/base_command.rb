# frozen_string_literal: true

class BaseCommand
  def initialize(robot = nil, table = nil, position = nil)
    @robot = robot
    @table = table
    @position = position
  end
end
