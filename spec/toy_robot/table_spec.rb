require 'spec_helper'
require './lib/toy_robot/table'

RSpec.describe ToyRobot::Table do
  subject { ToyRobot::Table.new(5, 5) }

  context 'when position is valid' do
    it { should be_valid_position(0, 0) }
    it { should be_valid_position(4, 4) }
  end

  context 'when position is invalid' do
    it { should_not be_valid_position(5, 0) }
    it { should_not be_valid_position(-1, -3) }
  end
end
