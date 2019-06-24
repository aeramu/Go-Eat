class HashToPosition
    def initialize(hash)
        @hash = hash
    end
    def result
        Position.new(@hash["x"],@hash["y"])
    end
end