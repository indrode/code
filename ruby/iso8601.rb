require "rspec"

# iso8601_duration_to_seconds
# pass it an ISO8601:2400 formatted string to get the number of seconds
# see http://en.wikipedia.org/wiki/ISO_8601#Durations
# indro.de@gmail.com

def iso8601_duration_to_seconds(duration_string)
  return 0 if duration_string.nil?
  hours = duration_string.match(/\d+H/).to_s.chop
  minutes = duration_string.match(/\d+M/).to_s.chop
  seconds = duration_string.match(/\d+\./).to_s.chop
  
  (hours.to_i*3600)+(minutes.to_i*60)+seconds.to_i
end

describe "#iso8601_duration_to_seconds" do
  
  it "should return 0 for nil strings" do
    iso8601_duration_to_seconds(nil).should eq(0)
  end
  
  it "should return 0 for invalid strings" do
    iso8601_duration_to_seconds("SRJOJ").should eq(0)
  end
  
  it "should return correct duration for seconds only" do
    iso8601_duration_to_seconds("PT2.000S").should eq(2)
  end
  
  it "should return correct duration for minutes only" do
    iso8601_duration_to_seconds("PT5M.000S").should eq(300)
  end
  
  it "should return correct duration for hours only" do
    iso8601_duration_to_seconds("PT1H").should eq(3600)
  end
  
  it "should return correct number of seconds" do
    iso8601_duration_to_seconds("PT3M7.000S").should eq(187)
    iso8601_duration_to_seconds("PT0H5M38.000S").should eq(338)
    iso8601_duration_to_seconds("PT0H3M2.000S").should eq(182)
    iso8601_duration_to_seconds("PT5M35.000S").should eq(335)
  end

end


arr = %w(PT2M36.000S PT0H2M36.000S PT3M7.000S PT0H3M7.000S PT3M22.000S PT0H3M22.000S PT5M38.000S PT0H5M38.000S PT3M2.000S PT0H3M2.000S PT2M55.000S PT0H2M55.000S PT5M20.000S PT0H5M20.000S PT5M35.000S)

arr.each { |d| puts "#{d} --> #{iso8601_duration_to_seconds(d)}" }


