class RandomDriverGenerator
    def initialize(map)
        @map = map
    end
    def Generate
        position = RandomPositionGenerator.new(@map.size).Generate
        while @map.GetObject(position).class != NilClass
            position = RandomPositionGenerator.new(@map.size).Generate
        end
        Driver.new("Abang Ganteng",position,0,0)
    end
end