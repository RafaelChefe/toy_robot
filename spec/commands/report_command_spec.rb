# frozen_string_literal: true

require "spec_helper"
require "commands/place_command"
require "commands/report_command"
require "position"
require "robot"
require "table"

describe ReportCommand do
  describe "#execute" do
    let(:robot) { Robot.new }
    let(:table) { Table.new(5, 5) }

    context "with valid position" do
      let!(:position) { Position.new(1, 1, "NORTH") }

      it "prints report to stdout" do
        report_command = ReportCommand.new(robot)

        PlaceCommand.new(robot, table, position).execute

        expected_report = "1,1,NORTH\n"

        expect { report_command.execute }.to output(expected_report).to_stdout
      end
    end

    context "with invalid position" do
      let!(:position) { Position.new(-1, 1, "NORTH") }

      it "prints report to stdout" do
        report_command = ReportCommand.new(robot)

        PlaceCommand.new(robot, table, position).execute

        expected_report = "not in place\n"

        expect { report_command.execute }.to output(expected_report).to_stdout
      end
    end
  end
end
