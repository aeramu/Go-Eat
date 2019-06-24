class PositionToHash
    def initialize(position)
        @position = position
    end
    def result
        hash = Hash["x",@position.x,"y",@position.y]
    end
end