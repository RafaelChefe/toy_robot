# frozen_string_literal: true

require "spec_helper"
require "commander"
require "commands/left_command"
require "commands/move_command"
require "commands/place_command"
require "commands/right_command"
require "commands/report_command"
require "position"
require "robot"
require "table"

describe Commander do
  let(:robot) { Robot.new }
  let(:table) { Table.new(5, 5) }
  let(:commander) { Commander.new(robot, table) }

  describe "#parse" do
    context "PLACE command" do
      input = "PLACE 1, 1, NORTH"

      it "creates command with the correct arguments" do
        position = instance_double("Position", x_coord: 1, y_coord: 1, direction: "NORTH")

        expect(Position).to receive(:new).with(1, 1, "NORTH").and_return(position)

        expect(PlaceCommand).to receive(:new).with(robot, table, position)

        commander.parse(input)
      end

      it "returns command" do
        expect(commander.parse(input)).to be_a PlaceCommand
      end
    end

    context "MOVE command" do
      input = "MOVE"

      it "creates command with the correct arguments" do
        expect(MoveCommand).to receive(:new).with(robot, table)

        commander.parse(input)
      end

      it "returns command" do
        expect(commander.parse(input)).to be_a MoveCommand
      end
    end

    context "LEFT command" do
      input = "LEFT"

      it "creates command with the correct arguments" do
        expect(LeftCommand).to receive(:new).with(robot)

        commander.parse(input)
      end

      it "returns command" do
        expect(commander.parse(input)).to be_a LeftCommand
      end
    end

    context "RIGHT command" do
      input = "RIGHT"

      it "creates command with the correct arguments" do
        expect(RightCommand).to receive(:new).with(robot)

        commander.parse(input)
      end

      it "returns command" do
        expect(commander.parse(input)).to be_a RightCommand
      end
    end

    context "REPORT command" do
      input = "REPORT"

      it "creates command with the correct arguments" do
        expect(ReportCommand).to receive(:new).with(robot)

        commander.parse(input)
      end

      it "returns command" do
        expect(commander.parse(input)).to be_a ReportCommand
      end
    end

    context "INVALID command" do
      it "returns nil" do
        input = "asdfjoaifjçj"

        expect(commander.parse(input)).to be nil
      end
    end
  end
end
