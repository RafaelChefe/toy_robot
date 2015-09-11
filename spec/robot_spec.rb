require 'spec_helper'
require 'robot'
require 'position'
require 'table'
require 'left_command'
require 'right_command'
require 'move_command'

describe Robot do

  let(:robot) { Robot.new }
  let(:table) { Table.new(5, 7) }

  describe '#place' do
    context 'with valid position' do
      let(:position) { Position.new(2, 3, 'N') }

      before do
        robot.place(table, position)
      end

      it 'places robot in a table' do
        expect(robot.table).to eq(table)
      end

      it 'places robot in the correct position' do
        expect(robot.current_position).to eq(position)
      end
    end

    context 'with invalid position' do
      let(:position) { Position.new(9, 9, 'N') }

      before do
        robot.place(table, position)
      end

      it 'will not place robot in a table' do
        expect(robot.table).to be nil
      end

      it 'will not place robot in an invalid position' do
        expect(robot.table).to be nil
      end
    end

  end

  describe '#report' do
    let(:position) { Position.new(2, 3, 'N') }

    context 'after inicial placement of the robot' do
      it 'reports current position correctly' do
        robot.place(table, position)

        expect(robot.report).to eq('position report: x == 2, y == 3, direction == N')
      end
    end

    context 'before initial placement of the robot' do
      it 'reports error message' do
        expect(robot.report).to eq('robot not in place')
      end
    end
  end

  describe '#short_report' do
    it 'returns a short report' do
      position = Position.new(1, 1, 'N')

      robot.place(table, position)

      expect(robot.short_report).to eq('1, 1, N')
    end
  end

  describe '#execute_command' do
    context 'when placed correctly' do
      it 'correctly turns to the left' do
        position = Position.new(1, 1, 'N')

        robot.place(table, position)

        LeftCommand.new(robot).execute

        expect(robot.short_report).to eq('1, 1, W')
      end

      it 'correctly turns to the right' do
        position = Position.new(1, 1, 'N')

        robot.place(table, position)

        RightCommand.new(robot).execute

        expect(robot.short_report).to eq('1, 1, E')
      end

      it 'correctly moves NORTH' do
        position = Position.new(1, 1, 'N')

        robot.place(table, position)

        robot.execute(MoveCommand.new)

        expect(robot.short_report).to eq('1, 2, N')
      end

      it 'correctly moves SOUTH' do
        position = Position.new(1, 1, 'S')

        robot.place(table, position)

        robot.execute(MoveCommand.new)

        expect(robot.short_report).to eq('1, 0, S')
      end

      it 'correctly moves EAST' do
        position = Position.new(1, 1, 'E')

        robot.place(table, position)

        robot.execute(MoveCommand.new)

        expect(robot.short_report).to eq('2, 1, E')
      end

      it 'correctly moves WEST' do
        position = Position.new(1, 1, 'W')

        robot.place(table, position)

        robot.execute(MoveCommand.new)

        expect(robot.short_report).to eq('0, 1, W')
      end
    end

    context 'before being placed in a table' do
      it 'ignores other commands' do
        robot.execute(MoveCommand.new)
        LeftCommand.new(robot).execute
        RightCommand.new(robot).execute

        expect(robot.short_report).to eq('not in place')
      end
    end
  end

  describe '#not_placed?' do
    context 'before robot is placed' do
      it 'returns true' do
        expect(robot.not_placed?).to be true
      end
    end

    context 'after robot is placed' do
      it 'returns false' do
        robot.place(table, Position.new(1, 2, 'E'))

        expect(robot.not_placed?).to be false
      end
    end
  end
end
