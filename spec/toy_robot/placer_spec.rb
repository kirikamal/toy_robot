require 'spec_helper'
require './lib/toy_robot/placer'

RSpec.describe ToyRobot::Placer do
  let(:table) { ToyRobot::Table.new(5, 5) }
  subject { ToyRobot::Placer.new(table) }

  context 'when robot places in a valid position' do
    it 'should not return nil' do
      expect(ToyRobot::Robot).to receive(:new).with(0, 0, "NORTH").and_return(double)

      subject.place(0, 0, "NORTH")
      expect(subject.robot).not_to be_nil
    end
  end

  context 'when robot places an invalid position' do
    it 'should return nil' do
      expect(ToyRobot::Robot).not_to receive(:new)
      subject.place(4,5, 'NORTH')
      expect(subject.robot).to be_nil
    end
  end

  context'when robot has been placed' do
    let(:robot) { instance_double(ToyRobot::Robot, next_move: [0, 0]) }
    before { 
      allow(subject).to receive(:robot).and_return(robot)
    }

    it 'should tell the robot to move' do
      expect(robot).to receive(:move)
      subject.move
    end
    
    it 'should tell the robot to turn right' do
      expect(robot).to receive(:turn_right)
      subject.turn_right
    end

    it 'should tell the robot to turn left' do
      expect(robot).to receive(:turn_left)
      subject.turn_left
    end

    it 'should tell the robot to report' do
      expect(robot).to receive(:report) { { north: 3, east: 3, direction: "NORTH" } }
      msg = "Robot's current position is: 3,3,NORTH\n"
      expect { subject.report }.to output(msg).to_stdout
    end
  end

  context 'when robot is placed at table boundary' do
    before do
      subject.place(0, 4, "NORTH")
    end

    it 'should not move past the table boundary' do
      subject.move
      msg = "Robot's current position is: 0,4,NORTH\n"
      expect { subject.report }.to output(msg).to_stdout
    end
  end

  context '#next_move' do
    context 'when facing north' do
      subject { ToyRobot::Robot.new(0, 0, "NORTH") }
  
      it 'should move to (0, 1)' do
        expect(subject.next_move).to eq([0, 1])
      end
    end
  
    context 'when facing east' do
      subject { ToyRobot::Robot.new(0, 0, "EAST") }
  
      it 'should next move to (0, 1)' do
        expect(subject.next_move).to eq([1, 0])
      end
    end
  
    context 'when facing south' do
      subject { ToyRobot::Robot.new(0, 0, "SOUTH") }
  
      it 'should next move to (0, -1)' do
        expect(subject.next_move).to eq([0, -1])
      end
    end
  
    context 'when facing west' do
      subject { ToyRobot::Robot.new(0, 0, "WEST") }
  
      it 'should move to (0, 1)' do
        expect(subject.next_move).to eq([-1, 0])
      end
    end
  end  
end
