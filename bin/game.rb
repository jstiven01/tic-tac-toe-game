class Game
  attr_accessor :board

  def initialize
    @turn_x = true
    @board = [nil]*9
  end

  public
  def move_game(position)

    return puts "Position occupied with #{ @board[position-1] }" if @board[position-1] != nil
    return puts "Position out of boundaries. Please numbers from 1 to 9" if !(position >=1 && position <= 9)

    @board[position-1] = (@turn_x) ? 'X': 'O'
    @turn_x = !@turn_x
    status_game(position-1)
  end

  def status_game(last_p)
    current_value = @turn_x ? "O" : "X"
    winner_cases = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    winner_cases.each do |x|
      if x.include? last_p
        return current_value if current_value == @board[x[0]] && current_value == @board[x[1]] && current_value == @board[x[2]]
      end
    end
    false
  end

  def show_board
    n_s = [1, 4, 7]
    board = ""
    9.times { |x|
      board +=  (n_s.include? x) ? "|" : ""
      board += " #{x+1} "
      board +=  (n_s.include? x) ? "|" : ""
      board +=  (n_s.include? x+2) ? "\n---|---|---\n" : ""
    }
    board
  end
end

test = Game.new

puts test.show_board
puts test.move_game(15)
test.move_game(2)
test.move_game(6)
test.move_game(2)

print test.board

