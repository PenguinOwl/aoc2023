#! /usr/bin/crystal
require "../shared.cr"

input = File.read("input.txt").strip

nums = {
  "zero" => 0,
  "one" => 1,
  "two" => 2,
  "three" => 3,
  "four" => 4,
  "five" => 5,
  "six" => 6,
  "seven" => 7,
  "eight" => 8,
  "nine" => 9
}

reverse_nums = nums.transform_keys{|k, v| k.reverse}

def find_first_num(string, map)
  regex = Regex.new(".*?(\\d|#{map.keys.join("|")})")
  match = string.match!(regex)
  if result = match[1].to_i?
    return result
  else
    return map[match[1]]
  end
end

calibrations = input.lines.map do |line|
  num1 = find_first_num(line, nums)
  num2 = find_first_num(line.reverse, reverse_nums)
  num1 * 10 + num2
end

# input.lines.zip(calibrations)[0..6].each do |input, calibration|
#   puts "#{input} => #{calibration}"
# end

puts calibrations.sum
