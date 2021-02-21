class FindWinner
  COMBOS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]].freeze

  def game_over?(arr)
    win = arr.map.with_index { |num, idx| num.odd? ? idx : nil }.compact
    COMBOS.any? { |combo| (combo & win).size > 2 }
  end
end
