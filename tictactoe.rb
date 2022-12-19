
class TicTacToe
  def initialize
    @board = Array.new(3) { Array.new(3, " ") }
  end

  def play
    current_player = "X"

    while true
      display_board
      puts "Player #{current_player}, enter a row and column to place your symbol."
      row = gets.chomp.to_i
      col = gets.chomp.to_i

      if valid_move?(row, col)
        @board[row][col] = current_player
        if win?(current_player)
          puts "Player #{current_player} wins!"
          break
        end
        current_player = current_player == "X" ? "O" : "X"
      else
        puts "Invalid move. Please try again."
      end
    end
  end

  def display_board
    puts " #{@board[0][0]} | #{@board[0][1]} | #{@board[0][2]} "
    puts "-----------"
    puts " #{@board[1][0]} | #{@board[1][1]} | #{@board[1][2]} "
    puts "-----------"
    puts " #{@board[2][0]} | #{@board[2][1]} | #{@board[2][2]} "
  end

  def valid_move?(row, col)
    row.between?(0, 2) && col.between?(0, 2) && @board[row][col] == " "
  end

  def win?(player)
    # check rows
    (0..2).each do |row|
      return true if @board[row].all? { |cell| cell == player }
    end

    # check columns
    (0..2).each do |col|
      return true if @board[0][col] == player && @board[1][col] == player && @board[2][col] == player
    end

    # check diagonals
    return true if @board[0][0] == player && @board[1][1] == player && @board[2][2] == player
    return true if @board[0][2] == player && @board[1][1] == player && @board[2][0] == player

    false
  end
end

game = TicTacToe.new
game.play