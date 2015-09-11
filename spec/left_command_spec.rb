require 'spec_helper'
require 'left_command'
require 'position'
require 'robot'
require 'table'

describe LeftCommand do

  describe '#get_new_position' do

    let(:robot) { Robot.new }
    let(:table) { Table.new(5, 5) }
    let(:left_command) { LeftCommand.new(robot) }

    it 'when facing NORTH turns WEST' do
      position = Position.new(1, 1, 'N')

      robot.place(table, position)

      left_command.execute

      expect(robot.report).to eq('position report: x == 1, y == 1, direction == W')
    end

    it 'when facing WEST turns SOUTH' do
      position = Position.new(1, 1, 'W')

      robot.place(table, position)

      left_command.execute

      expect(robot.report).to eq('position report: x == 1, y == 1, direction == S')
    end

    it 'when facing SOUTH turns EAST' do
      position = Position.new(1, 1, 'S')

      robot.place(table, position)

      left_command.execute

      expect(robot.report).to eq('position report: x == 1, y == 1, direction == E')
    end

    it 'when facing EAST turns NORTH' do
      position = Position.new(1, 1, 'E')

      robot.place(table, position)

      left_command.execute

      expect(robot.report).to eq('position report: x == 1, y == 1, direction == N')
    end
  end
end
