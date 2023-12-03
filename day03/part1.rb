#!/usr/bin/env ruby
# https://adventofcode.com/2023/day/3

require_relative '../lib/grid'
require 'byebug'

input = File.read('day03/input').lines.map(&:strip)
# input = File.read('day03/example').lines.map(&:strip)

grid = Grid.new

input.reverse.each_with_index do |line, y|
  line.chars.each_with_index do |c, x|
    grid[x, y] = c
  end
end

numbers = [[]]

grid.each do |col, row, v|
  # if surrounding value any is not a dot, it is part of the group
  if v.match?(/\d/) && grid.surrounding_values(col, row).any? { _1 != ?. }
    numbers[-1] << [col, row, v]
  # insert new group
  else
    numbers << []
  end
end

sum = 0

valid_numbers = numbers.map do |group|
  next unless group.any? { |col, row, v| grid.surrounding_values(col, row).any? { _1.match?(/[^\.\d]/) } }
  group.map { _1.last }.join.to_i
end

puts valid_numbers.compact.sum
