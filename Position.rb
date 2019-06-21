class Position
    attr_accessor :x, :y
    def initialize(x,y)
        @x = x
        @y = y
    end
    def adjacent
        [Position.new(@x+1,@y),Position.new(@x-1,@y),Position.new(@x,@y+1),Position.new(@x,@y-1)]
    end
    def self.FromHash(hash)
        Position.new(hash["x"],hash["y"])
    end
    def to_hash
        hash = Hash.new()
        hash["x"]=@x
        hash["y"]=@y
        hash
    end
end