#!/usr/bin/env ruby
# https://adventofcode.com/2023/day/4

input = File.read('day04/input').lines.map(&:strip)
# input = File.read('day04/example').lines.map(&:strip)

foo = input.map do |line|
  winning, actual = line.split(?:).last.split(?|).map { _1.scan(/\d+/).map(&:to_i) }
  size = (winning & actual).size
  size.zero? ? 0 : (2 ** (size - 1))
  # puts winning.inspect
end.sum

puts foo
