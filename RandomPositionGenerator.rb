class RandomPositionGenerator
    def initialize(max)
        @max = max
    end
    def Generate
        Position.new(rand(@max),rand(@max))
    end
end