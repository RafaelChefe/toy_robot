# frozen_string_literal: true

require "spec_helper"
require "position"
require "table"

describe Table do
  describe "#position_is_valid?" do
    let(:table) { Table.new(5, 5) }

    it "returns true when x and y are valid" do
      position = Position.new(2, 3, "NORTH")

      expect(table.position_is_valid?(position)).to be true
    end

    it "returns false when X is too big" do
      position = Position.new(8, 2, "NORTH")

      expect(table.position_is_valid?(position)).to be false
    end

    it "returns false when Y is too big" do
      position = Position.new(2, 8, "NORTH")

      expect(table.position_is_valid?(position)).to be false
    end

    it "returns false when X and Y are too big" do
      position = Position.new(8, 8, "NORTH")

      expect(table.position_is_valid?(position)).to be false
    end

    it "returns false when X is negative" do
      position = Position.new(-1, 2, "NORTH")

      expect(table.position_is_valid?(position)).to be false
    end

    it "returns false when Y is negative" do
      position = Position.new(2, -1, "NORTH")

      expect(table.position_is_valid?(position)).to be false
    end

    it "returns false when X and Y are too big" do
      position = Position.new(-1, -1, "NORTH")

      expect(table.position_is_valid?(position)).to be false
    end
  end
end
