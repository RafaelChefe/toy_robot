require 'spec_helper'
require 'robot'

describe Robot do

  describe '#place' do

    let(:robot) { Robot.new }
    let(:table) { Table.new(5, 7) }
    let(:position) { Position.new(2, 3, 'N') }

    before do
      robot.place(table, position)
    end

    it 'places robot in a table' do
      expect(robot.table).to eq(table)
    end

    it 'places robot in the correct position' do
      expect(robot.position).to eq(position)
    end
  end
end
