require 'spec_helper'
require './lib/toy_robot/command'

RSpec.describe ToyRobot::Command do
  context 'when place command issues' do
    it 'process a PLACE command' do
      command, *args = ToyRobot::Command.process("PLACE 1,2,NORTH")
      expect(command).to eq(:place)
      expect(args).to eq([1, 2, "NORTH"])
    end
  end

  context 'when move command issues' do
    it 'process a MOVE command' do
      command, *args = ToyRobot::Command.process("MOVE")
      expect(command).to eq(:move)
      expect(args).to be_empty
    end
  end

  context 'when left command issues' do
    it 'process a LEFT command' do
      command, *args = ToyRobot::Command.process("LEFT")
      expect(command).to eq(:turn_left)
      expect(args).to be_empty
    end
  end

  context 'when right command issues' do
    it 'process a RIGHT command' do
      command, *args = ToyRobot::Command.process("RIGHT")
      expect(command).to eq(:turn_right)
      expect(args).to be_empty
    end
  end

  context 'when report command issues' do
    it 'process a REPORT command' do
      command, *args = ToyRobot::Command.process("REPORT")
      expect(command).to eq(:report)
      expect(args).to be_empty
    end
  end
end
