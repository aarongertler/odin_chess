class Piece

	attr_reader :color, :symbol
	attr_accessor :position, :rank, :file, :has_moved, :just_moved, :move_options 

	def initialize(input)
		@color = input.fetch(:color)
		@position = input.fetch(:position)
		@rank = @position[0]
		@file = @position[1]
		@has_moved = false
		@just_moved = false
	end
end

class Pawn < Piece
	def initialize(input)
		super
		@symbol = "P"
		@move_options = moves(@rank, @file)
	end

	def moves(rank, file)
		return 7
		# Fill in later
	end
end

pawn = Pawn.new(:color => "White", :position => "a2")
puts pawn.color
puts pawn.position
puts pawn.rank
puts pawn.file
puts pawn.has_moved
puts pawn.just_moved
puts pawn.symbol
puts pawn.move_options
