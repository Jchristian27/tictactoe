class Game 
  
  @@i = "1"
  @@ii = "2"
  @@iii = "3"
  @@iv = "4"
  @@v = "5"
  @@vi = "6"
  @@vii = "7"
  @@viii = "8"
  @@ix = "9"

  @@legal_numbers = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

  def initialize(player1, p1marker, player2, p2marker)
    @player1 = player1
    @p1marker = p1marker
    @player2 = player2
    @p2marker = p2marker
  end

  def display_board()
    board = "
    #{@@i} | #{@@ii} | #{@@iii}
    ---+---+---
    #{@@iv} | #{@@v} | #{@@vi}
    ---+---+---
    #{@@vii} | #{@@viii} | #{@@ix}
    \n\n"
    puts board
  end

  def marker_assigner(player, player_marker, num)
    case num
    when "1"
        @@i = player_marker
        @@legal_numbers.delete(num)
        display_board()
    when "2"
        @@ii = player_marker
        @@legal_numbers.delete(num)
        display_board()
    when "3"
        @@iii = player_marker
        @@legal_numbers.delete(num)
        display_board()
    when "4"
        @@iv = player_marker
        @@legal_numbers.delete(num)
        display_board()
    when "5"
        @@v = player_marker
        @@legal_numbers.delete(num)
        display_board()
    when "6"
        @@vi = player_marker
        @@legal_numbers.delete(num)
        display_board()
    when "7"
        @@vii = player_marker
        @@legal_numbers.delete(num)
        display_board()
    when "8"
        @@viii = player_marker
        @@legal_numbers.delete(num)
        display_board()
    when "9"
        @@ix = player_marker
        @@legal_numbers.delete(num)
        display_board()
    else 
      puts "Uh oh. Something went wrong."
    end
  end

  def game_over?()
    (@@i == @@ii && @@ii == @@iii) ||
    (@@iv == @@v && @@v == @@vi) ||
    (@@vii == @@viii && @@viii == @@ix) ||
    (@@i == @@iv && @@iv == @@vii) ||
    (@@ii == @@v && @@v == @@viii) ||
    (@@iii == @@vi && @@vi == @@ix) ||
    (@@i == @@v && @@v == @@ix) ||
    (@@iii == @@v && @@v == @@vii)
  end

  def play_game()
    display_board()
    until game_over?() == true do
      print "#{@player1}, please enter a number (1-9) that is available to " 
      print "place your marker: '#{@p1marker}'\n"
      answer1 = gets.chomp
      until @@legal_numbers.include?(answer1) do
        puts "Sorry, that is an invalid answer. Please try again."
        answer1 = gets.chomp.to_s
      end
      marker_assigner(@player1, @p1marker, answer1)
      if game_over?() == true
        puts "GAME OVER. #{@player1} Wins!"
        break
      end
        
      print "#{@player2}, please enter a number (1-9) that is available to " 
      print "place your marker: '#{@p2marker}'\n"
      answer2 = gets.chomp
      until @@legal_numbers.include?(answer2) do
        puts "Sorry, that is an invalid answer. Please try again."
        answer2 = gets.chomp.to_s
      end
      marker_assigner(@player2, @p2marker, answer2)
      if game_over?() == true
        puts "GAME OVER. #{@player2} Wins!"
        break
      end
    end
  end
end

puts "Let's play a simple Tic-Tac-Toe game in the console!"

puts "What is the name of Player 1?"
p1_name = gets.chomp

puts "What 1 letter/special character would you like to be your game marker?"
p1_marker = gets.chomp
until p1_marker.length == 1 
  puts "Sorry, that is an invalid answer. Please, try again."
  p1_marker = gets.chomp
end

puts "What is the name of Player 2?"
p2_name = gets.chomp

puts "What 1 letter/special character would you like to be your game marker?"
puts "It cannot be '#{p1_marker}'"
p2_marker = gets.chomp
until p2_marker.length == 1 && p2_marker != p1_marker 
  puts "Sorry, that is an invalid answer. Please, try again."
  p2_marker = gets.chomp
end

Game.new(p1_name, p1_marker, p2_name, p2_marker).play_game()

puts "Would you like to play again?"
puts "Enter 'y' to play again or 'n' to quit"
answer = gets.chomp.downcase

if answer == 'y'
  true
elsif answer == 'n'
  system("clear")
else 
  puts "Uh oh. Something went wrong."
end