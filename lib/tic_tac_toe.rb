WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, current_player)
  board[index] = current_player
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
  if position_taken?(board, index)
    false
  elsif index.between?(0,8)
    true
  end
end

def turn_count(board)
turns = 0
board.each do |space| # space is a local variable to hold each position in the board array
if space == "X" || space == "O"
  turns += 1
end
end
return turns
end

def current_player(board)
  count = turn_count(board)
if count % 2 == 0
  return "X"
else
  return "O"
end
end

def turn(board)
  puts "Please enter 1-9:"
  answer = gets.chomp
  answer = input_to_index(answer)
  if valid_move?(board, answer)
    move(board, answer)
    puts display_board(board)
  else
    puts "Please enter 1-9:"
    turn(board)
end
end
