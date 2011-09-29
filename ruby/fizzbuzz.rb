# fizzbuzz.rb

# Write a program that prints the numbers from 1 to 100.
# But for multiples of three print "Fizz" instead of the number and for the multiples of five print "Buzz".
# For numbers which are multiples of both three and five print "FizzBuzz".

def mod(x,m)
  x % m == 0 ? true : false
end

(1..100).each do |i|
  case
  when mod(i, 15)
    puts "FizzBuzz"
  when mod(i, 3)
    puts "Fizz"
  when mod(i, 5)
    puts "Buzz"
  else
    puts i
  end
end
