class Initialization
    attr_accessor :map, :user
    def initialize(argumentArray)
        @argumentArray = argumentArray
    end
    def Initialize
        if @argumentArray[0].class == NilClass
            @map = Map.new(20)
            @user = RandomUserGenerator.new(map).Generate
            @map.Add(user)
            RandomMapGenerator.new(@map).Generate
        elsif @argumentArray[1].class == NilClass
            file = FileHandler.Read(@argumentArray[0])
            @map = file[0]
            @user = file[1]
        else
            @map = Map.new(@argumentArray[0].to_i)
            @user = User.new(Position.new(@argumentArray[1].to_i,@argumentArray[2].to_i))
            @map.Add(user)
            RandomMapGenerator.new(@map).Generate
        end
    end
end
