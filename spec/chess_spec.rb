# What you need to test:

# Does the board successfully boot up? 
# Are all the right pieces on the appropriate squares?

# Is each piece capable of successfully moving to an appropriate square?

# Is each piece successfully prevented from moving to an inappropriate square?

# Are pawns, specifically, able to move two squares from rank 2/7, but not otherwise?

# Can kings and rooks castle at the appropriate time, but not otherwise?

# Can a piece take another piece of the opposite color?

# Is a piece prohibited from taking a piece of the same color?

# Does the "check" variable correctly respond to the king being placed in check by the piece that just moved?
	# What if a piece moves and opens up a line to the king for another piece?

# If the king is in check and moves, does he leave check?
# If the king is in check and a piece moves to protect it, does the king leave check?
# If the king is in check and a piece takes the piece that was threatening it, does the king leave check?

# If the king is in checkmate, does the game recognize that the other player wins?

# If a player resigns, does the game recognize that the other player wins?

require "chess"

describe Game do 

	let(:game) { Chess.new }

	describe "board" do

		it "has the right squares" do
			expect(game.board.length).to eq(8)
			expect(game.board[0].length).to eq(8)
			# expect(game.board[0][0][0]).to eq("a1")
			# expect(game.board[7][7][0]).to eq("h8")
		end

		it "has the correct starting position" do
			expect(game.board[0][0][1].class).to eq(Chess::Piece::Rook)
			expect(game.board[0][0][1].color).to eq("White")
			expect(game.board[7][0][1].class).to eq(Chess::Piece::Pawn)
			expect(game.board[7][0][1].color).to eq("Black")
		end

		context "squares" do
			it "has the right properties" do
				square = game.board[0][0]

				# expect(square).to respond_to() # Fill in when we know the properties of squares better
			end
		end
	end

	describe "pieces" do

		square = game.board[0][0]

		square[1] = nil # empty out the square so we can test adding a piece

		it "has the right properties" do
			piece = Piece.new(:color => "White",
												:rank => "A",
												:file => "1") # Will this work with the subdivision of pieces into other classes?

			expect(piece).to respond_to(:color)
			expect(piece).to respond_to(:rank)
			expect(piece).to respond_to(:file)
			expect(piece).to respond_to(:symbol) # e.g. "WK" for King
			expect(piece).to respond_to(:move_options)
			expect(piece).to respond_to(:has_moved)
			expect(piece).to respond_to(:just_moved)
		end

		it "exists on the board" do
			expect(game.board[0][0][1]).not_to be_empty
		end

		context "king" do
			king = King.new(:color => "White", # May need to create the class differently
											:rank => "E",
											:file => "1")

			it "has the right special properties" do
				expect(king).to respond_to(:in_check)
				expect(king).to respond_to(:in_checkmate)
			end

			it "has the right move options" do
				expect(king.move_options).to include(["D", "1"])
				expect(king.move_options).to include(["F", "2"])
				expect(king.move_options).not_to include(["E", "0"]) # No moving off the board!
			end

			it "knows when it's in check" do
			end
		end
	end
end











