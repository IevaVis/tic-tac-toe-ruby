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
  puts " #{board[0]} | #{board[1]}  | #{board[2]}   "
  puts " __________"
  puts " #{board[3]} | #{board[4]}  | #{board[5]}   "
  puts " __________ "
  puts " #{board[6]} | #{board[7]}  | #{board[8]}   "
end

def input_to_index(input)
	input.to_i - 1
end

def move(board, index, token)
	board[index] = token
end

#is the index in this board occupied?
def position_taken?(board, index) 
	board[index] != " "
end

def valid_move?(board, index)
	index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
	puts "Where would you like to go?"
	input = gets.chomp
	index = input_to_index(input)

	if valid_move?(board, index)
		token = current_player(board)
		move(board, index, token)
		display_board(board)
	else
		puts "Invalid move, try again"
		turn(board)
	end 
end

#count how many spaces have been occupied
def turn_count(board)

	occupied_spaces = 0

	counter = 0
	while counter < board.size
	  if position_taken?(board, counter)
		 occupied_spaces += 1		 
end 
counter += 1
end
occupied_spaces
end

def current_player(board)
	if turn_count(board).odd?
		"O"
	else
		"X"
	end
end

def won?(board)
	winning_combo = nil

	WIN_COMBINATIONS.each do |combo|

	position_1 = combo[0]
	position_2 = combo[1]
	position_3 = combo[2]

	if board[position_1] == "X" && board[position_2] == "X" && board[position_3] == "X"

		winning_combo = combo

	elsif board[position_1] == "O" && board[position_2] == "O" && board[position_3] == "O"

		winning_combo = combo

	end
end

winning_combo

end



def over?(board)
	won?(board) || turn_count(board) == 9 && !won?(board)
end

def winner(board)
	if winning_combo = won?(board)
		board[winning_combo.first]
	
	end
end



def play(board)
	until over?(board)
		turn(board)
	end 
	if won?(board)
	winner = winner(board)
	puts "Congratulations #{winner}"
elsif turn_count(board) == 9 && !won?(board)
	puts "Draw! Start new game!"
end
end

board = Array.new(9, " ")
play(board)







































