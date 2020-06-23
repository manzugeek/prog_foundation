
require 'pry'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

def prompt(message)
  puts "=> #{message}"
end

def display_board(brd)
  system 'clear'
puts ""
puts "     |     |"
puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}  "
puts "     |     |"
puts "-----+-----+-----"
puts "     |     |"
puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}  "
puts "     |     |"
puts "-----+-----+-----"
puts "     |     |"
puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}  "
puts "     |     |"
puts ""
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER}
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER}
end

def joinor(arr, delimiter=', ', word='or')
  case arr.size
  when 0 then ''
  when 1 then arr.first
  when 2 then arr.join(" #{word} ")
  else
    arr[-1] = "#{word}  #{arr.last}"
    arr.join(delimiter)
  end
end

def player_place_piece!(brd)
  square = ''
  loop do
    prompt "Choose a position to place a piece: #{joinor(empty_squares(brd))}"
    #prompt "Choose a square (#{empty_squares(brd).join(', ')}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
      prompt "Sorry, that's not a valid choice."
    end
    brd[square] = PLAYER_MARKER
  end

def computer_places_piece!(brd)
  square = empty_squares(brd).sample
  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  winning_lines = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                  [[1, 5, 9], [3, 5, 7]]              # diagonals

  winning_lines.each do |line|
    if brd[line[0]] == PLAYER_MARKER &&
       brd[line[1]] == PLAYER_MARKER &&
       brd[line[2]] == PLAYER_MARKER
       return 'Player'
     elsif
       brd[line[0]] == COMPUTER_MARKER &&
       brd[line[1]] == COMPUTER_MARKER &&
       brd[line[2]] == COMPUTER_MARKER
       return 'Computer'
    end
  end
  nil
end

score = { player_score: 0, computer_score: 0}

def display_score(score)
  prompt "Player score: #{score[:player_score]} | Computer score: #{score[:computer_score]}"
end

def update_score(brd, score)
  if detect_winner(brd) == 'Player'
    score[:player_score] += 1
  elsif detect_winner(brd) == 'Computer'
    score[:computer_score] += 1
  end
end

def display_round_winner(brd, score)
  if someone_won?(brd)
    prompt "#{detect_winner(brd)} won!"
  else
    prompt "it's a tie"
  end
  display_score(score)
end

def match_over?(score)
  score[:player_score] == 3 || score[:computer_score] == 3
end

def display_match_winner(score)
  if score[:player_score] == 3
    prompt "Player is the Grand Winner!"
  else
    prompt "Computer is the Grand Winner!"
  end
end

def match_reset(score)
  score[:player_score] = 0 && score[:computer_score] = 0
  prompt "Match re-set if wanna play again..."
end

# MAIN LOOP .....
loop do
  board = initialize_board

# PLAYERS INPUT LOOP
  loop do
    display_board(board)

    player_place_piece!(board)
    break if someone_won?(board) || board_full?(board)

    computer_places_piece!(board)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)

  update_score(board, score)
  display_round_winner(board, score)

  if match_over?(score)
  display_match_winner(score)
  match_reset(score)
end

  prompt "Play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing Tic Tac Toe! Good bye!"
