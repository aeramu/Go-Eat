class Position
    attr_accessor :x, :y
    def initialize(x,y)
        @x = x
        @y = y
    end
    def adjacent
        [Position.new(@x+1,@y),Position.new(@x-1,@y),Position.new(@x,@y+1),Position.new(@x,@y-1)]
    end
end