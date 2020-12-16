# frozen_string_literal: true

require "spec_helper"
require "commands/place_command"
require "commands/right_command"
require "position"
require "robot"
require "table"

describe RightCommand do
  describe "#execute" do
    let(:robot) { Robot.new }
    let(:table) { Table.new(5, 5) }
    let(:right_command) { RightCommand.new(robot) }

    it "when facing NORTH turns EAST" do
      position = Position.new(1, 1, "NORTH")

      PlaceCommand.new(robot, table, position).execute

      right_command.execute

      expect(robot.report).to eq("1,1,EAST")
    end

    it "when facing EAST turns SOUTH" do
      position = Position.new(1, 1, "EAST")

      PlaceCommand.new(robot, table, position).execute

      right_command.execute

      expect(robot.report).to eq("1,1,SOUTH")
    end

    it "when facing SOUTH turns WEST" do
      position = Position.new(1, 1, "SOUTH")

      PlaceCommand.new(robot, table, position).execute

      right_command.execute

      expect(robot.report).to eq("1,1,WEST")
    end

    it "when facing WEST turns NORTH" do
      position = Position.new(1, 1, "WEST")

      PlaceCommand.new(robot, table, position).execute

      right_command.execute

      expect(robot.report).to eq("1,1,NORTH")
    end
  end
end
