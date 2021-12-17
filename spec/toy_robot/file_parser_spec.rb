require 'spec_helper'
require './lib/toy_robot/file_parser'

RSpec.describe ToyRobot::FileParser do
  subject { ToyRobot::FileParser.new }

  context '#load_commands' do
    it 'loads commands from a file' do
      path = File.dirname(__FILE__) + "/../fixtures/commands.txt"
      commands = subject.load_commands(path)
      expect(commands).to eq([[:place, 0,0, "NORTH"], [:move], [:turn_right], [:turn_left], [:report]])
    end
  end

  context '#run' do
    let(:placer) { instance_double(ToyRobot::Placer) }
   
    before do
      allow(subject).to receive(:placer) { placer }
    end
   
    context 'place command' do
      it 'shoould pass a place command to the placer' do
        expect(placer).to receive(:place).with(0, 0, "NORTH")
        subject.run([[:place, 0, 0, "NORTH"]])
      end
    end

    context 'move command' do
      it 'shoould pass a move command to the placer' do
        expect(placer).to receive(:move)
        subject.run([[:move]])
      end
    end

    context 'right command' do
      it 'shoould pass a right command to the placer' do
        expect(placer).to receive(:turn_right)
        subject.run([[:turn_right]])
      end
    end

    context 'left command' do
      it 'shoould pass a left command to the placer' do
        expect(placer).to receive(:turn_left)
        subject.run([[:turn_left]])
      end
    end

    context 'report command' do
      it 'shoould pass a report command to the placer' do
        expect(placer).to receive(:report)
        subject.run([[:report]])
      end
    end
  end
end