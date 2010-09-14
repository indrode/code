#!/usr/bin/ruby

# by Indro De (www.indrode.com / indro.de@gmail.com)

# countLetters(aString)
# ----------------------------------------------------------------------------------------------
# function that takes in a string and returns the letter that appears the most in that string
# returns: the letter that appears most often within that string

# note: Function does differentiate between cases (lowercase / uppercase).
# To change this, convert text to lowercase before checking.

# to test in your browser, open the following:
# count.cgi?yourtext
# where yourtext is the string to be analyzed

require "cgi"

def countLetters(text)
  @chars = Hash.new(0)
  CGI::unescape(text).each_byte do |ch|
    @chars[ch] +=1
  end
  @chars.max { |a,b| a.last <=> b.last }.first.chr
end

puts "Content-type: text/html\n\n"
cgi_request = CGI::new("html4")
puts countLetters(cgi_request.query_string)