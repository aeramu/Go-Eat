class RandomPositionGenerator
    def initialize(max)
        @max = max
    end
    def Generate
        Position.new(rand(@max),rand(@max))
    end
end

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

class RandomStoreGenerator
    def initialize(map)
        @map = map
    end
    def Generate
        position = RandomPositionGenerator.new(@map.size).Generate
        while @map.GetObject(position).class != NilClass
            position = RandomPositionGenerator.new(@map.size).Generate
        end
        Store.new("Nasgor Bang Jali",position,[Item.new("Nasi Goreng",10000),Item.new("Es Teh Manis",3000)])
    end
end

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

class RandomMapGenerator
    def initialize(map)
        @map = map
    end
    def Generate
        3.times do
            @map.Add(RandomStoreGenerator.new(@map).Generate)
        end
        5.times do
            @map.Add(RandomDriverGenerator.new(@map).Generate)
        end
        @map
    end
end