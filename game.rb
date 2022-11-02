class Game 
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @board = Board.new
  end

  def player_turn(player)
    print "#{player.name}, please enter a number (1-9) that is available to " 
    print "place your marker: '#{player.marker}'\n"
    answer = gets.chomp
    until @board.legal_numbers.include?(answer) do
      puts "Sorry, that is an invalid answer. Please try again."
      answer = gets.chomp
    end
    marker_assigner(player, answer)
    if @board.game_over? == true
      puts "Game Over. #{player.name} Wins!"
      return true
    end
  end

  def marker_assigner(player, num)
    @board.update_board(num, player.marker)
    @board.legal_numbers.delete(num)
    @board.display_board
  end

  def game_over?
    @winning_combos.any? { |subarray| subarray.uniq.size == 1 }
  end

  def play_game
    @board.display_board
    until @board.game_over? == true do
      if player_turn(@player1) == true
        break
      end
      
      if player_turn(@player2) == true
        break
      end
    end
  end
end