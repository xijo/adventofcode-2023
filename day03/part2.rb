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

gear_numbers = {}

numbers.each do |group|
  next unless group.any? { |col, row, v| grid.surrounding_values(col, row).any? { _1 == ?* } }
  ast_position = group.map { |col, row| grid.surrounding(col, row) }.flatten(1).select { |f| grid.get(*f) == ?* }.uniq
  gear_numbers[ast_position] ||= []
  gear_numbers[ast_position] << group.map(&:last).join.to_i
end.compact

puts gear_numbers.select { |_, v| v.size == 2 }.values.map { _1.inject(&:*) }.sum
