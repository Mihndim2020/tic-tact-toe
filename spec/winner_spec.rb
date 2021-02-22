#spec/player_spec.rb
# frozen_string_literal: true

require '../lib/winner.rb'

describe Winner do
  describe '#game_over' do
    it 'compares if player 1 is the winner' do
      win = Winner.new
      expect(win.game_over?([1, 0, 1, 0, 1, 0, 1, 0, 0])).to be true
    end

    it 'compares if player 2 is the winner' do
      win = Winner.new
      expect(win.game_over?([0, 1, 0, 0, 1, 0, 0, 1, 0])).to be true
    end

    it 'compares if game is a draw ' do
      win = Winner.new
      p1_arr = [1, 0, 1, 0, 0, 1, 1, 1, 0]
      p2_arr = [0, 1, 0, 1, 1, 0, 0, 0, 1]
      
      expect(win.game_over?(p1_arr)).to be false 
      expect(win.game_over?(p2_arr)).to be false
      
    end

  end
end