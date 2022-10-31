class Player
  attr_accessor :name, :marker
  def initialize(name, marker)
    @name = name
    @marker = marker
  end
end

class Game 
  def initialize(player1, player2)
    @player1 = player1.name
    @p1marker = player1.marker
    @player2 = player2.name
    @p2marker = player2.marker
    @i = "1"
    @ii = "2"
    @iii = "3"
    @iv = "4"
    @v = "5"
    @vi = "6"
    @vii = "7"
    @viii = "8"
    @ix = "9"
    @legal_numbers = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    @board = "
    #{@i} | #{@ii} | #{@iii}
    ---+---+---
    #{@iv} | #{@v} | #{@vi}
    ---+---+---
    #{@vii} | #{@viii} | #{@ix}
    \n\n"
    @winning_combos = [[@i, @ii, @iii], [@iv, @v, @vi], [@vii, @viii, @ix], 
                      [@i, @iv, @vii], [@ii, @v, @viii], [@iii, @vi, @ix], 
                      [@i, @v, @ix], [@iii, @v, @vii]]
  end

  def player_turn(player, marker)
    print "#{player}, please enter a number (1-9) that is available to " 
    print "place your marker: '#{marker}'\n"
    answer = gets.chomp
    until @legal_numbers.include?(answer) do
      puts "Sorry, that is an invalid answer. Please try again."
      answer = gets.chomp.to_s
    end
    marker_assigner(player, marker, answer)
    if game_over?() == true
      puts "GAME OVER. #{player} Wins!"
      return true
    end
  end

  def update_board()
    @board = "
    #{@i} | #{@ii} | #{@iii}
    ---+---+---
    #{@iv} | #{@v} | #{@vi}
    ---+---+---
    #{@vii} | #{@viii} | #{@ix}
    \n\n"
    @winning_combos = [[@i, @ii, @iii], [@iv, @v, @vi], [@vii, @viii, @ix], 
                      [@i, @iv, @vii], [@ii, @v, @viii], [@iii, @vi, @ix], 
                      [@i, @v, @ix], [@iii, @v, @vii]]
    puts @board
  end

  def marker_assigner(player, player_marker, num)
    case num
    when "1"
        @i = player_marker
        @legal_numbers.delete(num)
        update_board()
    when "2"
        @ii = player_marker
        @legal_numbers.delete(num)
        update_board()
    when "3"
        @iii = player_marker
        @legal_numbers.delete(num)
        update_board()
    when "4"
        @iv = player_marker
        @legal_numbers.delete(num)
        update_board()
    when "5"
        @v = player_marker
        @legal_numbers.delete(num)
        update_board()
    when "6"
        @vi = player_marker
        @legal_numbers.delete(num)
        update_board()
    when "7"
        @vii = player_marker
        @legal_numbers.delete(num)
        update_board()
    when "8"
        @viii = player_marker
        @legal_numbers.delete(num)
        update_board()
    when "9"
        @ix = player_marker
        @legal_numbers.delete(num)
        update_board()
    else 
      puts "Uh oh. Something went wrong."
    end
  end

  def game_over?()
    @winning_combos.any? { |subarray| subarray.uniq.size == 1 }
  end

  def play_game()
    update_board()
    until game_over?() == true do
      if player_turn(@player1, @p1marker) == true
        break
      end
      
      if player_turn(@player2, @p2marker) == true
        break
      end
    end
  end
end

