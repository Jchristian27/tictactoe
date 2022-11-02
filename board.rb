class Board
  attr_accessor :board_values, :legal_numbers, :winning_combos
  def initialize
    @board_values = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    @legal_numbers = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    @winning_combos = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6],
                      [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
  end

  def display_board
    puts <<-HEREDOC

    #{board_values[0]} | #{board_values[1]} | #{board_values[2]}
    ---+---+---
    #{board_values[3]} | #{board_values[4]} | #{board_values[5]}
    ---+---+---
    #{board_values[6]} | #{board_values[7]} | #{board_values[8]}

    HEREDOC
  end

  def update_board(num, marker)
    @board_values[num.to_i - 1] = marker
  end

  def game_over?
    @winning_combos.any? do |combo|
      [board_values[combo[0]], board_values[combo[1]], 
      board_values[combo[2]]].uniq.length == 1
    end
  end
end