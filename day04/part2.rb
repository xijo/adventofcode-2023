#!/usr/bin/env ruby
# https://adventofcode.com/2023/day/4

input = File.read('day04/input').lines.map(&:strip)
# input = File.read('day04/example').lines.map(&:strip)

cards = {}
counts = Hash.new(1)

input.map do |line|
  card, content = line.split(?:)
  card_no = card[/\d+/].to_i
  winning, actual = content.split(?|).map { _1.scan(/\d+/).map(&:to_i) }
  copies = (winning & actual).size

  counts.key?(card_no) or counts[card_no] = 1

  counts[card_no].times do
    ((card_no + 1)...(card_no + copies + 1)).to_a.each { counts[_1] += 1 }
  end
end.sum

puts counts.values.sum
