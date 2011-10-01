# quicksort.rb

def quicksort(arr)
  qs(arr, 0, arr.length-1)
end

def qs(arr, low, high)
  if low < high
    pivot = partition(arr, low, high)
    qs(arr, low, pivot-1)
    qs(arr, pivot + 1, high)
  end
end

def partition(arr, low, high)
  pivot, leftwall = arr[low], low
  
  (low+1..high).each do |i|
    if arr[i] < pivot
      leftwall += 1
      arr[i], arr[leftwall] = arr[leftwall], arr[i]
    end
  end
  
  arr[low], arr[leftwall] = arr[leftwall], arr[low]
  return leftwall
end

begin
  print "Enter comma-separated list of values: "
  the_array = eval("[#{gets.gsub(/ /, "")}]")
  puts "Unsorted: #{the_array.inspect}"
  quicksort(the_array)
  puts "Sorted:   #{the_array.inspect}"
rescue
  puts "Invalid array! Use comma-separated values, e.g. 5,2,4,9"
end