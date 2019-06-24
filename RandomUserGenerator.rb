class RandomUserGenerator
    def initialize(map)
        @map = map
    end
    def Generate
        position = RandomPositionGenerator.new(@map.size).Generate
        while @map.GetObject(position).class != NilClass
            position = RandomPositionGenerator.new(@map.size).Generate
        end
        User.new(position)
    end
end