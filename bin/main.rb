#!/usr/bin/env ruby

require_relative '../lib/player'
require_relative '../lib/winner'
require_relative '../lib/functions'

# Define the board layout
def board(moved_cells = %w[1 2 3 4 5 6 7 8 9])
  cells = moved_cells
  puts <<-GRID

                #{cells[0]} | #{cells[1]} | #{cells[2]}
               ---+---+---
                #{cells[3]} | #{cells[4]} | #{cells[5]}
               ---+---+---
                #{cells[6]} | #{cells[7]} | #{cells[8]}

  GRID
end

# rubocop:disable Lint/LiteralInInterpolation
# Add the banner
def game_banner
  puts <<-GRID

        #######             #######               ########{'              '}
          #                   #                     ##{'                 '}
          #                   #                     ##{'                 '}
          #    ##   ####      #    ####   ####      #     ####   ####{'  '}
          #     #  #   #      #       #  #   #      #    ##  ## #   ##{' '}
          #     #  #          #    ####  #          #    #    # ######{' '}
          #     #  ##         #    #  #  ##         #    ##  ## ##{'     '}
         ###   ###  ####     ###   #####  ####     ###    ####   ####
  GRID
end
# rubocop:enable Lint/LiteralInInterpolation

def board_is_full(cells)
  return true if cells.count { |x| x.is_a? Integer }.zero?

  false
end

# checks moves array for Player 1 & 2
# allow move position & returns true
# checks against moves array of both players
def position_available(marker_pos, player1_obj, player2_obj)
  # test - marker_pos - index has a limit of 1 to 9
  return false if marker_pos.negative? || (marker_pos > 8)

  # test - new move - does not overlap any previous moves done.
  return true if (player1_obj.moves_arr[marker_pos].zero? && player2_obj.moves_arr[marker_pos].zero?) == true

  false
end

# *******************************
# TIC TAC TOE PROGRAM BEGINS HERE
# *******************************

# Use getters to collect input from players
puts "Let's play tic-tac-toe!"
puts 'Enter your name player one'
name = gets.chomp
puts "Welcome #{name}, select either 'X' or 'O' as your marker"
marker = gets.chomp.upcase

while validate_marker(name, marker) == false
  puts "Oops! Wrong input. Select either 'X' or 'O' as your marker"
  marker = gets.chomp.upcase
end

# Create Player 1 object
obj_player_one = Player.new(name, marker)

puts 'Enter your name player two'
name = gets.chomp

# Create Player 2 object
obj_player_two = Player.new(name, change_marker(marker))

puts "Welcome #{obj_player_two.name}, your marker is #{obj_player_two.marker}"

puts 'Remember: The player with a row, column or diagonal of the same marker wins'
puts "Ready? Let's begin!"

cells = [1, 2, 3, 4, 5, 6, 7, 8, 9]
game_banner # BANNER - to show ASCII TIC TAC TOE
board(cells)

check = Winner.new
while cells.any? { |n| n.is_a? Integer }
  # Checks if other player made a winning move
  if check.game_over? obj_player_two.moves_arr
    puts "Brilliant! #{obj_player_two.name} wins!!"
    break
  end

  puts 'Select a number from the GRID to make your move.'
  puts "#{obj_player_one.name}'s Turn : "
  marker_pos = gets.chomp.to_i - 1
  while position_available(marker_pos, obj_player_one, obj_player_two) == false
    puts 'Oops! Invalid input. Try Again.'
    marker_pos = gets.chomp.to_i - 1
  end
  # Holds player one's move
  obj_player_one.moves_arr[marker_pos] = 1

  # Sends player_object.marker to DISPLAY GRID
  cells[marker_pos] = obj_player_one.marker

  board(cells)

  # Checks if previous player made a winning move
  if check.game_over? obj_player_one.moves_arr
    puts "Brilliant! #{obj_player_one.name} wins!!"
    break
  end

  next if board_is_full(cells)

  puts 'Select a number from the GRID to make your move.'
  puts "#{obj_player_two.name}'s Turn : "
  marker_pos = gets.chomp.to_i - 1
  while position_available(marker_pos, obj_player_one, obj_player_two) == false
    puts 'Oops! Invalid input. Try Again.'
    marker_pos = gets.chomp.to_i - 1
  end
  # Holds player two's move
  obj_player_two.moves_arr[marker_pos] = 1

  # Sends player marker to DISPLAY GRID
  cells[marker_pos] = obj_player_two.marker

  board(cells)
end

puts "It's a Tie. Play again?" unless
  check.game_over? obj_player_one.moves_arr or check.game_over? obj_player_two.moves_arr

game_banner # BANNER - to show ASCII TIC TAC TOE
