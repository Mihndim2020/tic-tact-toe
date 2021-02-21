#spec/player_spec.rb
# frozen_string_literal: true

require '../lib/player.rb'

describe Player do
    describe "Player.new" do
        marker=%[X O]
        let(:player_1) { Player.new('player 1', marker[rand(1)], Array.new(9, 0)) }

        it "players 1 chooses 'Name' of atleast 1 letter " do
            expect(player_1.name.length).to be > 0
        end
        
        it "players 1 chooses 'X' or 'O' " do
            expect(player_1.marker).to eq('X').or eq('O')
        end

        it "players moves-array limits length of 9" do
            expect(player_1.moves_arr.length).to eq(9)
        end

        it "players moves-array all values are set to 0" do
            expect(player_1.moves_arr).to eql(Array.new(9, 0))
        end        
    end
end