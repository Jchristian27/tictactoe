require_relative 'tictactoe.rb'

puts "Let's play a simple Tic-Tac-Toe game in the console!"

puts "What is the name of Player 1?"
p1_name = gets.chomp

puts "What 1 letter/special character would you like to be your game marker?"
p1_marker = gets.chomp
until p1_marker.length == 1 
  puts "Sorry, that is an invalid answer. Please, try again."
  p1_marker = gets.chomp
end
p1 = Player.new(p1_name, p1_marker)

puts "What is the name of Player 2?"
p2_name = gets.chomp

puts "What 1 letter/special character would you like to be your game marker?"
puts "It cannot be '#{p1_marker}'"
p2_marker = gets.chomp
until p2_marker.length == 1 && p2_marker != p1_marker 
  puts "Sorry, that is an invalid answer. Please, try again."
  p2_marker = gets.chomp
end
p2 = Player.new(p2_name, p2_marker)


Game.new(p1, p2).play_game()