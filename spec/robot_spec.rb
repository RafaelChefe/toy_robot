require 'spec_helper'
require 'robot'

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
end
