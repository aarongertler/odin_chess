# Next steps:

# Set up piece class in its own file, link to the game class correctly



class Game
	Player = Struct.new(:name, :color)
	# Board = Struct.new()

	attr_accessor :player_1, :player_2, :active_player, :winner
	attr_reader :board

	def initialize(player_1_name, player_2_name, rows, columns)
		@player_1 = Player.new(:name => player_1_name, 
													 :color => "White")
		@player_2 = Player.new(:name => player_2_name, 
													 :color => "Black")
		@board = []

		for rank in (0..7)
			@board << []
			for file in (0..7)
				@board[rank] << []
			end
		end

		for file in (0..7)
			@board[1][file] = Pawn.new(:position => convert(file) + "2", :color => "White")
			@board[6][file] = Pawn.new(:position => convert(file) + "7", :color => "Black")
		end

		@board[0][0], @board[0][7] = Rook.new(:position => "a1", :color => "White"), Rook.new(:position => "h1", :color => "White")
		@board[0][1], @board[0][6] = Knight.new(:position => "b1", :color => "White"), Knight.new(:position => "g1", :color => "White")
		@board[0][2], @board[0][5] = Bishop.new(:position => "c1", :color => "White"), Bishop.new(:position => "f1", :color => "White")
		@board[0][3], @board[0][4] = Queen.new(:position => "d1", :color => "White"), King.new(:position => "e1", :color => "White")

		@board[7][7], @board[7][7] = Rook.new(:position => "a8", :color => "Black"), Rook.new(:position => "h8", :color => "Black")
		@board[7][1], @board[7][6] = Knight.new(:position => "b8", :color => "Black"), Knight.new(:position => "g8", :color => "Black")
		@board[7][2], @board[7][5] = Bishop.new(:position => "c8", :color => "Black"), Bishop.new(:position => "f8", :color => "Black")
		@board[7][3], @board[7][4] = Queen.new(:position => "d8", :color => "Black"), King.new(:position => "e8", :color => "Black")

		@active_player = @player_1
		@winner = nil
	end

	def convert(n) # Converts numerical ranks to chess letter ranks
		letters = ["a", "b", "c", "d", "e", "f", "g", "h"]
		return letters(n - 1)
	end


	class Piece # Turn this into a separate file!
		attr_accessor :color, :symbol

	end