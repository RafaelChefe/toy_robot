# frozen_string_literal: true

require "spec_helper"
require "commands/place_command"
require "robot"
require "table"
require "position"

describe PlaceCommand do
  describe "#execute" do
    let(:robot) { Robot.new }
    let(:table) { Table.new(5, 5) }
    let(:place_command) { PlaceCommand.new(robot, table, position) }

    context "with valid position" do
      let(:position) { Position.new(1, 1, "NORTH") }

      it "places robot " do
        place_command.execute

        expect(robot.report).to eq("1,1,NORTH")
      end
    end

    context "with INVALID position" do
      let(:position) { Position.new(-1, 1, "NORTH") }

      it "places robot " do
        place_command.execute

        expect(robot.report).to eq("not in place")
      end
    end
  end
end
