require 'spec_helper'
require 'place_command'

describe PlaceCommand do

  describe '#execute' do
    let(:robot) { Robot.new }
    let(:table) { Table.new(5, 5) }
    let(:place_command) { PlaceCommand.new(robot, table, position) }

    context 'with valid position' do
      let(:position) { Position.new(1, 1, 'N') }

      it 'places robot ' do
        place_command.execute

        expect(robot.report).to eq('position report: x == 1, y == 1, direction == N')
      end
    end

    context 'with INVALID position' do
      let(:position) { Position.new(-1, 1, 'N') }

      it 'places robot ' do
        place_command.execute

        expect(robot.report).to eq('robot not in place')
      end
    end
  end
end
