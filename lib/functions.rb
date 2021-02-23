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

def position_available(marker_pos, player1_obj, player2_obj)
  # test - marker_pos - index has a limit of 1 to 9
  return false if marker_pos.negative? || (marker_pos > 8)

  # test - new move - does not overlap any previous moves done.
  return true if (player1_obj.moves_arr[marker_pos].zero? && player2_obj.moves_arr[marker_pos].zero?) == true

  false
end
