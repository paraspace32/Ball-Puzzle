f = File.open("input.txt")
f_lines = f.read.split("\n")

bags = []
size = f_lines[0].to_i
input = f_lines[1].split(",")
puts "#{input}"
count = f_lines[2].to_i

input.each do |ball|
	bags << ball.to_i
end

sort_bags = bags.sort #sort uses O(nlogn)
min_diff = sort_bags[count - 1] - sort_bags[0]
max_index = count - 1
min_index = 0

sort_bags.each_with_index do |ball, index|
	if((index + count - 1 < size) && (sort_bags[index + count - 1] - sort_bags[index] < min_diff))
		min_diff = sort_bags[index + count - 1] - sort_bags[index]
		max_index = index + count -1
		min_index = index
	end
end

puts sort_bags[min_index..max_index].join(',')