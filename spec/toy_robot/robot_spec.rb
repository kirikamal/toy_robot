require 'spec_helper'
require './lib/toy_robot/robot'

RSpec.describe ToyRobot::Robot do
  context "when facing north" do
    subject { ToyRobot::Robot.new(0, 0, "NORTH") }
    
    it "should move north" do
      subject.move
      expect(subject.north).to eq(1)
    end
    
    it "should turn left to face west" do
     subject.turn_left
     expect(subject.direction).to eq("WEST")
    end

    it "should turn right to face east" do
      subject.turn_right
      expect(subject.direction).to eq("EAST")
     end
  end

  context "when facing south" do
    subject { ToyRobot::Robot.new(0, 0, "SOUTH") }
    
    it "should move south" do
      subject.move
      expect(subject.north).to eq(-1)
    end
    
    it "should turn left to face east" do
     subject.turn_left
     expect(subject.direction).to eq("EAST")
    end

    it "should turn right to face west" do
      subject.turn_right
      expect(subject.direction).to eq("WEST")
     end
  end

  context "when facing east" do
    subject { ToyRobot::Robot.new(0, 0, "EAST") }
    
    it "should move east" do
      subject.move
      expect(subject.east).to eq(1)
    end
    
    it "should turn left to face north" do
     subject.turn_left
     expect(subject.direction).to eq("NORTH")
    end

    it "should turn right to face south" do
      subject.turn_right
      expect(subject.direction).to eq("SOUTH")
     end
  end

  context "when facing west" do
    subject { ToyRobot::Robot.new(0, 0, "WEST") }
    
    it "should move west" do
      subject.move
      expect(subject.east).to eq(-1)
    end
    
    it "should turn left to face south" do
     subject.turn_left
     expect(subject.direction).to eq("SOUTH")
    end

    it "should turn right to face north" do
      subject.turn_right
      expect(subject.direction).to eq("NORTH")
     end
  end

  context "#report" do
    subject { ToyRobot::Robot.new(3, 3, "WEST") }

    it 'should return the current location & direction of the robot' do
      expect(subject.report).to eq({north: 3, east: 3, direction: "WEST"})
    end
  end  
end
