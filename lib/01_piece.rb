class Piece
    attr_reader :color, :board
    attr_accessor :pos
    COLOR = [:white, :black]

    def initialize(color, board, pos)
        raise 'Invalid color' if !COLOR.include?(color)
        raise 'Invalid position' if !pos.all? {|cord| cord.between?(0,7)}
        
        @color = color
        @pos = pos
        @board = board
    end

    def symbol
        raise NotImplementedError
    end

    def to_s
        "#{self.symbol}"
    end
end