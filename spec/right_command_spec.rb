require 'spec_helper'
require 'place_command'
require 'right_command'
require 'position'
require 'robot'
require 'table'

describe RightCommand do

  describe '#execute' do

    let(:robot) { Robot.new }
    let(:table) { Table.new(5, 5) }
    let(:right_command) { RightCommand.new(robot) }

    it 'when facing NORTH turns EAST' do
      position = Position.new(1, 1, 'N')

      PlaceCommand.new(robot, table, position).execute

      right_command.execute

      expect(robot.report).to eq('1, 1, E')
    end

    it 'when facing EAST turns SOUTH' do
      position = Position.new(1, 1, 'E')

      PlaceCommand.new(robot, table, position).execute

      right_command.execute

      expect(robot.report).to eq('1, 1, S')
    end

    it 'when facing SOUTH turns WEST' do
      position = Position.new(1, 1, 'S')

      PlaceCommand.new(robot, table, position).execute

      right_command.execute

      expect(robot.report).to eq('1, 1, W')
    end

    it 'when facing WEST turns NORTH' do
      position = Position.new(1, 1, 'W')

      PlaceCommand.new(robot, table, position).execute

      right_command.execute

      expect(robot.report).to eq('1, 1, N')
    end
  end
end
