#!/usr/bin/env ruby
# https://adventofcode.com/2022/day/1

require 'byebug'

# input = File.read('day01/input').lines.map(&:strip)
input = File.read('input').lines.map(&:strip)

numbers = {
  "zero" => "0",
  "one" => "1",
  "two" => "2",
  "three" => "3",
  "four" => "4",
  "five" => "5",
  "six" => "6",
  "seven" => "7",
  "eight" => "8",
  "nine" => "9",
}

foo = input.map do |line|
  f = line
    .scan(/zero|one|two|three|four|five|six|seven|eight|nine|\d/)
    .map { |n| numbers[n] || n }
    .first

  l = line
    .reverse
    .scan(/orez|eno|owt|eerht|ruof|evif|xis|neves|thgie|enin|\d/)
    .map { |n| numbers[n.reverse] || n }
    .first

  r = "#{f}#{l}".to_i
  puts line
  puts r
  r
end.sum

puts foo
