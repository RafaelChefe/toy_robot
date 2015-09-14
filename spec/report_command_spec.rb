require 'spec_helper'
require 'place_command'
require 'report_command'
require 'position'
require 'robot'
require 'table'

describe ReportCommand do

  describe '#execute' do

    let(:robot) { Robot.new }
    let(:table) { Table.new(5, 5) }

    context 'with valid position' do
      let!(:position) { Position.new(1, 1, 'N') }

      it 'prints report to stdout' do
        report_command = ReportCommand.new(robot)

        PlaceCommand.new(robot, table, position).execute

        expected_report = "1, 1, N\n"

        expect { ReportCommand.new(robot).execute }.to output(expected_report).to_stdout
      end
    end

    context 'with invalid position' do
      let!(:position) { Position.new(-1, 1, 'N') }

      it 'prints report to stdout' do
        report_command = ReportCommand.new(robot)

        PlaceCommand.new(robot, table, position).execute

        expected_report = "robot not in place\n"

        expect { ReportCommand.new(robot).execute }.to output(expected_report).to_stdout
      end
    end
  end
end
