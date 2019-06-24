class AdjacentPosition
    def initialize(position)
        @position = position
    end
    def adjacent
        [Position.new(@position.x+1,@position.y),
            Position.new(@position.x-1,@position.y),
            Position.new(@position.x,@position.y+1),
            Position.new(@position.x,@position.y-1)]
    end
end