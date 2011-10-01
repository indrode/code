# gets the last x tracks scrobbled to last.fm service for a specific user

require "rubygems"
require "httparty"
require "crack"

def getXML(user, limit)
  response = HTTParty.get("http://ws.audioscrobbler.com/2.0/?method=user.getrecenttracks&user=#{user}&api_key=b25b959554ed76058ac220b7b2e0a026&limit=#{limit}")  
  xml = Crack::XML.parse(response.body)
  
  xml["lfm"]['recenttracks']['track'].each do |t|
    puts "#{t['date']}: #{t['artist']} - #{t['name']}"
  end
  
end

begin
  getXML(ARGV[1] || 'zenpunch', ARGV[0] || 5)
rescue
  puts "Sorry! You are using wrong arguments."
end
