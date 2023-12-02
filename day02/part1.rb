#!/usr/bin/env ruby
# https://adventofcode.com/2022/day/2

input = File.read('day02/input')

max = {
  "red" => 12,
  "green" => 13,
  "blue" => 14,
}

valid_games = {}

input.lines.each do |line|
  game, sets = line.strip.split(':')
  game = game[/\d+/]

  sets = sets.split('; ').map do |set|
    set.split(', ').map { _1.split(' ').reverse }.to_h
  end

  valid = true

  sets.each do |set|
    set.each do |color, count|
      if count.to_i > max[color]
        valid = false
      end
    end
  end

  if valid
    valid_games[game] = sets
  end
end

puts valid_games.keys.sum(&:to_i)
