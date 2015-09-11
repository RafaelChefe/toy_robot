require 'spec_helper'
require 'move_command'

describe MoveCommand do

  describe '#execute' do

    let(:robot) { Robot.new }
    let(:table) { Table.new(5, 5) }
    let(:move_command) { MoveCommand.new(robot) }

    it 'decreases X when robot is facing WEST' do
      position = Position.new(1, 1, 'W')

      robot.place(table, position)

      move_command.execute

      expect(robot.report).to eq('position report: x == 0, y == 1, direction == W')
    end

    it 'increases X when robot is facing EAST' do
      position = Position.new(1, 1, 'E')

      robot.place(table, position)

      move_command.execute

      expect(robot.report).to eq('position report: x == 2, y == 1, direction == E')
    end

    it 'increases Y when robot is facing NORTH' do
      position = Position.new(1, 1, 'N')

      robot.place(table, position)

      move_command.execute

      expect(robot.report).to eq('position report: x == 1, y == 2, direction == N')
    end

    it 'decreases Y when robot is facing SOUTH' do
      position = Position.new(1, 1, 'S')

      robot.place(table, position)

      move_command.execute

      expect(robot.report).to eq('position report: x == 1, y == 0, direction == S')
    end
  end
end
