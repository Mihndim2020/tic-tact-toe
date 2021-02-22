# Validate input from the players

def validate_marker(player_one, marker)
  game_markers = %w[X O]
  return false unless game_markers.include? marker

  puts "#{player_one} selects #{marker}"
  true
end

def change_marker(marker)
  other_marker = %w[X O].reject { |ch| ch == marker }
  other_marker[0]
end
