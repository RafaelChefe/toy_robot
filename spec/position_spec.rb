require 'spec_helper'
require 'position'

describe Position do

  describe '#go_to' do
    it 'goes NORTH' do
      position = Position.new(1, 1, 'N')

      expect(position.go_to('N')).to eq(Position.new(1, 2, 'N'))
    end

    it 'goes SOUTH' do
      position = Position.new(1, 1, 'S')

      expect(position.go_to('S')).to eq(Position.new(1, 0, 'S'))
    end

    it 'goes EAST' do
      position = Position.new(1, 1, 'E')

      expect(position.go_to('E')).to eq(Position.new(2, 1, 'E'))
    end

    it 'goes WEST' do
      position = Position.new(1, 1, 'W')

      expect(position.go_to('W')).to eq(Position.new(0, 1, 'W'))
    end
  end

  describe '#==' do
    it 'returns true when coordinantes are the same in both positions' do
      position_one = Position.new(1, 1, 'N')
      position_two = Position.new(1, 1, 'N')

      expect(position_one).to eq(position_two)
    end
  end

  describe '#direction_left' do
    it 'when facing NORTH returns WEST' do
      position = Position.new(1, 2, 'N')

      expect(position.direction_left).to eq('W')
    end

    it 'when facing WEST returns SOUTH' do
      position = Position.new(1, 2, 'W')

      expect(position.direction_left).to eq('S')
    end

    it 'when facing SOUTH returns EAST' do
      position = Position.new(1, 2, 'S')

      expect(position.direction_left).to eq('E')
    end

    it 'when facing EAST returns NORTH' do
      position = Position.new(1, 2, 'E')

      expect(position.direction_left).to eq('N')
    end
  end

  describe '#direction_right' do
    it 'when facing NORTH returns EAST' do
      position = Position.new(1, 2, 'N')

      expect(position.direction_right).to eq('E')
    end

    it 'when facing EAST returns SOUTH' do
      position = Position.new(1, 2, 'E')

      expect(position.direction_right).to eq('S')
    end

    it 'when facing SOUTH returns WEST' do
      position = Position.new(1, 2, 'S')

      expect(position.direction_right).to eq('W')
    end

    it 'when facing WEST returns NORTH' do
      position = Position.new(1, 2, 'S')

      expect(position.direction_right).to eq('W')
    end
  end
end
