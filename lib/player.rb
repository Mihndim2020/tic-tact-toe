#lib/player.rb
# frozen_string_literal: true

class Player
  attr_accessor :name, :marker, :moves_arr

  def initialize(name, marker, moves_arr=Array.new(9, 0))
    @name = name
    @marker = marker
    @moves_arr = moves_arr
  end
end
