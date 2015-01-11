class TicTacToe

WIN = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

  def initialize
    @board = Array.new(9, " ")
  end

  def end_game
    display_board
    puts "\nPlay again?\n"
    yes_no = gets.chomp.downcase
      if yes_no == "yes"
        TicTacToe.new.start_game
      else
        "OK, maybe later!"
        exit!
      end
  end

  def win
    if @board[0] == "X" && @board[1] == "X" && @board[2] == "X"
    else
      "no"
    end
  end


  def display_board
    puts
    puts  " #{@board[0]} | #{@board[1]} | #{@board[2]}"
    puts  "-" * 11
    puts  " #{@board[3]} | #{@board[4]} | #{@board[5]}"
    puts  "-" * 11
    puts  " #{@board[6]} | #{@board[7]} | #{@board[8]}"
    puts
  end

  def one_player_game
    turn = rand(1)
    available_turns = 9
    while available_turns > 0 && win == "no"
      display_board
      if turn % 2 == 1
        puts "Player 1, please pick a square from 1 to 9"
        p1 = gets.chomp.to_i
        if @board[p1-1] == " "
          @board.delete_at(p1-1)
          @board.insert(p1 - 1, "X")
          available_turns -= 1
          turn += 1
        else
          puts "That square is already taken - please try another."
      end
      else
          p2 = rand(9)
          if @board[p2-1] == " "
            @board.delete_at(p2-1)
            @board.insert(p2-1, "O")
            puts "Computer player chooses square #{p2}"
            available_turns -= 1
            turn += 1
          else
            puts "That square is already taken - please try another."
          end
      end
    end
    end_game
  end

  def two_player_game
    turn = rand(1)
    available_turns = 9
    while available_turns > 0 && win == "no"
      display_board
      if turn % 2 == 1
        puts "Player 1, please pick a square from 1 to 9"
        p1 = gets.chomp.to_i
        if @board[p1-1] == " "
          @board.delete_at(p1-1)
          @board.insert(p1 - 1, "X")
          available_turns -= 1
          turn += 1
        else
          puts "That square is already taken - please try another."
      end
      else
          puts "Player 2, please pick a square from 1 to 9"
          p2 = gets.chomp.to_i
          if @board[p2-1] == " "
            @board.delete_at(p2-1)
            @board.insert(p2-1, "O")
            available_turns -= 1
            turn += 1
          else
            puts "That square is already taken - please try another."
          end
      end
    end
    end_game
  end

  def start_game
    available_turns = 9
    while available_turns == 9
      puts
      puts "*" * 36
      puts "Are you ready for some Tic-Tac-Toe?!"
      puts "*" * 36
      puts
      input = gets.chomp.downcase
        if input == "yes"
          puts
          puts "*" * 36
          puts "One player or two?"
          puts "*" * 36
          puts
          player_num = gets.chomp.downcase
            if player_num == "one"
              one_player_game
            else
              two_player_game
            end
        else
          puts "Your loss, buddy!"
          exit!
        end
    end
  end
end

TicTacToe.new.start_game
