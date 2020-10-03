require 'rails_helper'

RSpec.describe Robot, type: :model do
  subject { FactoryBot.build(:robot) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:position_x) }
    it { is_expected.to validate_presence_of(:position_y) }
    it { is_expected.to validate_presence_of(:facing) }

    it do
      should
      validate_numericality_of(:position_x)
        .is_greater_than_or_equal_to(Robot::UNITS[:min])
        .is_less_than(Robot::UNITS[:max])
    end

    it do
      should
      validate_numericality_of(:position_y)
        .is_greater_than_or_equal_to(Robot::UNITS[:min])
        .is_less_than(Robot::UNITS[:max])
    end
  end

  it 'should turn left from north to west' do
    subject.update(facing: Robot::FACINGS[:north])
    subject.left!

    expect(subject.facing).to eq Robot::FACINGS[:west]
  end

  it 'should turn right from north to east' do
    subject.update(facing: Robot::FACINGS[:north])
    subject.right!

    expect(subject.facing).to eq Robot::FACINGS[:east]
  end

  it 'should move robot in north direction' do
    subject.update(facing: Robot::FACINGS[:north], position_y: 2)
    subject.move!

    expect(subject.position_y).to eq 3
  end

  it 'should move robot in east direction' do
    subject.update(facing: Robot::FACINGS[:east], position_x: 2)
    subject.move!

    expect(subject.position_x).to eq 3
  end

  it 'should give report for robot' do
    subject.update(facing: Robot::FACINGS[:east], position_x: 2, position_y: 3)

    expect(subject.report).to eq 'Robot is currently placed at: (2, 3) facing East'
  end

  it 'should be an invalid move' do
    subject.update(facing: Robot::FACINGS[:north], position_x: 2, position_y: 4)
    subject.move!

    expect(subject.invalid?).to eq true
  end
end
