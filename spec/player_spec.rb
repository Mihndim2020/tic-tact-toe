# spec/player_spec.rb
require_relative '../lib/player'

describe Player do
  describe 'Player.new' do
    marker = %w[X O]
    let(:player_one) { Player.new('player 1', marker[rand(2)], Array.new(9, 0)) }

    it "players 1 chooses 'Name' of atleast 1 letter " do
      expect(player_one.name.length).to be.positive?
      expect(player_one.name.length).not_to be.negative?
    end

    it "players 1 chooses 'X' or 'O' " do
      expect(player_one.marker).to eq('X').or eq('O')
    end

    it 'players moves-array limits length of 9' do
      expect(player_one.moves_arr.length).to eq(9)
      expect(player_one.moves_arr.length).not_to be.negative?
    end

    it 'players moves-array all values are set to 0' do
      expect(player_1.moves_arr).to eql(Array.new(9, 0))
    end
  end
end
