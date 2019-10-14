#!/usr/bin/env ruby
# frozen_string_literal: true

puts 'Hello welcome to the Tic Tac Toe Game'
puts 'What is your name? (player X)'
player_x = gets.chomp
puts 'What is your name? (player O)'
player_o = gets.chomp
puts '--------------------------------------'
puts 'This our board'
puts '_1_|_2_|_3_'
puts '_4_|_5_|_6_'
puts ' 7 | 8 | 9 '

there_turns = 9
there_is_a_winner = false
move_game = false

while there_turns.positive?

  player_turn = (there_turns % 2).zero? ? 'O' : 'X'
  name_player = (there_turns % 2).zero? ? player_o : player_x
  puts "#{name_player}, Pick a valid position to set the turn player #{player_turn}"
  move = gets.chomp
  status_game = move_game
  # Calling move_game(move) method to check if the move is valid

  if status_game # status game is true when there is an error
    puts 'ERROR your move is invalid' # We inform that there is an error and ask again for the position.
    next # We keep the same turn,skipping the rest of the code and asking again for the position.
  else
    puts 'Next turn' # We let the loop continue and change the turn
  end

  puts 'Now, your move is displayed on the board'
  puts "Your move is #{move}"
  puts '--------------------------------------'
  puts '_1_|_2_|_3_'
  puts '_4_|_5_|_6_'
  puts ' 7 | 8 | 9 '
  # if turn is valid
  winner = there_is_a_winner
  # there_is_a_winner should be a method that is going to return the winner if exist,
  # otherwise returns false.
  if winner
    puts "the winner is #{winner}"
    there_turns = 0 # if there is a winner we set the turns to 0 so the loop ends
  elsif !winner && there_turns == 1
    puts "it's a draw"
    there_turns = 0
  else
    # if there is no changes here the loop repeats again and we subtract one turn
    there_turns -= 1
  end
end
