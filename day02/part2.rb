input = File.read('day02/input')

powers = input.lines.map do |line|
  game, sets = line.strip.split(':')
  game = game[/\d+/]

  sets = sets.split('; ').map do |set|
    set.split(', ').map { _1.split(' ').reverse }.to_h
  end

  mins = %w[red green blue].map do |color|
    sets.map { |set| set[color] }.compact.map(&:to_i).max
  end

  mins.inject(&:*)
end

puts powers.inject(&:+)
