# spec/functions_spec.rb
require_relative '../lib/player'
require_relative '../lib/functions'

describe 'functions - validations of public methods' do
  describe '#change_marker - return a valid marker' do
    it "player 1 chooses 'X' - so return 'O' " do
      expect(change_marker('X')).to eq('O')
    end

    it "player 1 chooses 'O' - so return 'X' " do
      expect(change_marker('O')).to eq('X')
    end
  end

  describe '#validate_marker - entered a valid marker' do
    marker1 = %w[X O]
    let(:player_one) { Player.new('player 1', marker1[rand(2)], Array.new(9, 0)) }

    it "players 1 chooses 'X' or 'O' " do
      expect(validate_marker(player_one, player_one.marker)).to be true
    end
  end

  describe '#validate_marker - entered invalid marker' do
    marker2 = %w[Y Z]
    let(:player_two) { Player.new('player 1', marker2[rand(2)], Array.new(9, 0)) }

    it "players enter Marker other than 'X' or 'O' " do
      expect(validate_marker(player_two, player_two.marker)).to be false
    end
  end
end
