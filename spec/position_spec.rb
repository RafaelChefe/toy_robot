# frozen_string_literal: true

require "spec_helper"
require "position"

describe Position do
  describe "#go_to" do
    it "goes NORTH" do
      position = Position.new(1, 1, "NORTH")

      expect(position.go_to("NORTH")).to eq(Position.new(1, 2, "NORTH"))
    end

    it "goes SOUTH" do
      position = Position.new(1, 1, "SOUTH")

      expect(position.go_to("SOUTH")).to eq(Position.new(1, 0, "SOUTH"))
    end

    it "goes EAST" do
      position = Position.new(1, 1, "EAST")

      expect(position.go_to("EAST")).to eq(Position.new(2, 1, "EAST"))
    end

    it "goes WEST" do
      position = Position.new(1, 1, "WEST")

      expect(position.go_to("WEST")).to eq(Position.new(0, 1, "WEST"))
    end
  end

  describe "#==" do
    it "returns true when coordinantes are the same in both positions" do
      position_one = Position.new(1, 1, "NORTH")
      position_two = Position.new(1, 1, "NORTH")

      expect(position_one).to eq(position_two)
    end
  end

  describe "#direction_left" do
    it "when facing NORTH returns WEST" do
      position = Position.new(1, 2, "NORTH")

      expect(position.direction_left).to eq("WEST")
    end

    it "when facing WEST returns SOUTH" do
      position = Position.new(1, 2, "WEST")

      expect(position.direction_left).to eq("SOUTH")
    end

    it "when facing SOUTH returns EAST" do
      position = Position.new(1, 2, "SOUTH")

      expect(position.direction_left).to eq("EAST")
    end

    it "when facing EAST returns NORTH" do
      position = Position.new(1, 2, "EAST")

      expect(position.direction_left).to eq("NORTH")
    end
  end

  describe "#direction_right" do
    it "when facing NORTH returns EAST" do
      position = Position.new(1, 2, "NORTH")

      expect(position.direction_right).to eq("EAST")
    end

    it "when facing EAST returns SOUTH" do
      position = Position.new(1, 2, "EAST")

      expect(position.direction_right).to eq("SOUTH")
    end

    it "when facing SOUTH returns WEST" do
      position = Position.new(1, 2, "SOUTH")

      expect(position.direction_right).to eq("WEST")
    end

    it "when facing WEST returns NORTH" do
      position = Position.new(1, 2, "SOUTH")

      expect(position.direction_right).to eq("WEST")
    end
  end
end
