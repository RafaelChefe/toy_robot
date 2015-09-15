require 'spec_helper'
require 'move_command'
require 'place_command'
require 'position'
require 'robot'
require 'table'

describe MoveCommand do

  describe '#execute' do

    let(:robot) { Robot.new }
    let(:table) { Table.new(5, 5) }
    let(:move_command) { MoveCommand.new(robot, table) }

    it 'decreases X when robot is facing WEST' do
      position = Position.new(1, 1, 'W')

      PlaceCommand.new(robot, table, position).execute

      move_command.execute

      expect(robot.report).to eq('0, 1, W')
    end

    it 'increases X when robot is facing EAST' do
      position = Position.new(1, 1, 'E')

      PlaceCommand.new(robot, table, position).execute

      move_command.execute

      expect(robot.report).to eq('2, 1, E')
    end

    it 'increases Y when robot is facing NORTH' do
      position = Position.new(1, 1, 'N')

      PlaceCommand.new(robot, table, position).execute

      move_command.execute

      expect(robot.report).to eq('1, 2, N')
    end

    it 'decreases Y when robot is facing SOUTH' do
      position = Position.new(1, 1, 'S')

      PlaceCommand.new(robot, table, position).execute

      move_command.execute

      expect(robot.report).to eq('1, 0, S')
    end

    it 'does nothing when position is invalid' do
      position = Position.new(4, 4, 'N')

      PlaceCommand.new(robot, table, position).execute

      move_command.execute

      expect(robot.report).to eq('4, 4, N')
    end
  end
end
