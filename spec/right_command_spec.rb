require 'spec_helper'
require 'right_command'
require 'position'
require 'robot'
require 'table'

describe RightCommand do

  describe '#get_new_position' do

    let(:robot) { Robot.new }
    let(:table) { Table.new(5, 5) }
    let(:right_command) { RightCommand.new }

    it 'when facing NORTH turns EAST' do
      position = Position.new(1, 1, 'N')

      robot.place(table, position)

      robot.execute(right_command)

      expect(robot.report).to eq('position report: x == 1, y == 1, direction == E')
    end

    it 'when facing EAST turns SOUTH' do
      position = Position.new(1, 1, 'E')

      robot.place(table, position)

      robot.execute(right_command)

      expect(robot.report).to eq('position report: x == 1, y == 1, direction == S')
    end

    it 'when facing SOUTH turns WEST' do
      position = Position.new(1, 1, 'S')

      robot.place(table, position)

      robot.execute(right_command)

      expect(robot.report).to eq('position report: x == 1, y == 1, direction == W')
    end

    it 'when facing WEST turns NORTH' do
      position = Position.new(1, 1, 'W')

      robot.place(table, position)

      robot.execute(right_command)

      expect(robot.report).to eq('position report: x == 1, y == 1, direction == N')
    end
  end
end
