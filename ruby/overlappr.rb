# overlappr.rb
# by Indro De (indro.de@gmail.com)

require 'rspec'

# Usage
# team_hours = (8..17).to_a
# hours_to_overlap = 4 (defaults to 4)
# a = Overlappr.new(team_hours, hours_to_overlap)
#
# time difference between team and yourself
# time_difference = 6
# a.optimal(time_difference)
#
# with optional earliest start time (defaults to 8)
# a.optimal(time_difference, 8)
#
# Returns a hash of the following:
# - array of hours where you and your team overlap n hours
# - array of the overlapping hours in your time zone
# - array of the overlapping hours in team's time zone
# or returns 'impossible' if an overlapping time frame
# is simpley not possible with the given parameters

class Overlappr
  attr_reader :team_hours, :hours_to_overlap

  def initialize(team_hours, hours_to_overlap)
    @team_hours = team_hours
    @hours_to_overlap = hours_to_overlap || 4
  end

  def optimal(your_time_difference, your_earliest_start_time = 8)
    24.times do |i|
      arr = (i..i+team_hours.first).to_a
      your_arr = arr.map { |d| d + your_time_difference }
      if ((team_hours & arr).size >= hours_to_overlap) && your_arr.first >= (your_earliest_start_time)
        return your_arr.map! { |d| d >= 24 ? d - 24 : d }
      end
    end

    'impossible'
  end
end

RSpec.describe Overlappr do
  describe '#optimal_time' do
    let(:team_hours) { (8..17).to_a }
    let(:overlappr4) { Overlappr.new(team_hours, 4)}
    let(:overlappr2) { Overlappr.new(team_hours, 2)}

    it 'should find the optimal time frame' do
      expect(overlappr4.optimal(6)).to eq([9, 10, 11, 12, 13, 14, 15, 16, 17])
      expect(overlappr4.optimal(9)).to eq([12, 13, 14, 15, 16, 17, 18, 19, 20])
    end

    it 'should work with negative time difference' do
      expect(overlappr4.optimal(-6)).to eq([8, 9, 10, 11, 12, 13, 14, 15, 16])
    end

    it 'should not return anything before earliest start time' do
      expect(overlappr4.optimal(2)).to eq([8, 9, 10, 11, 12, 13, 14, 15, 16])
      expect(overlappr4.optimal(2, 7)).to eq([7, 8, 9, 10, 11, 12, 13, 14, 15])
      expect(overlappr4.optimal(6, 11)).to eq([11, 12, 13, 14, 15, 16, 17, 18, 19])
    end

    it 'should return \'impossible\' if it actually is impossible' do
      expect(overlappr4.optimal(-6, 16)).to eq('impossible')
    end

    it 'should work with different overlapping requirements' do
      expect(overlappr2.optimal(6)).to eq([8, 9, 10, 11, 12, 13, 14, 15, 16])
      expect(overlappr2.optimal(9)).to eq([10, 11, 12, 13, 14, 15, 16, 17, 18])
    end
  end
end

