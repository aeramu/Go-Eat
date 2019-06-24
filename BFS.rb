class BFS
    attr_accessor :route, :object
    def initialize(position,searchedClass,map)
        @map = map
        @queue = Array.new()
        @route = Array.new()
        @trail = Array.new(map.size){Array.new(map.size)}
        @searchedClass = searchedClass
        AddAdjecent(position)
        @trail[position.x][position.y] = Position.new(-999,-999)
        Search()
    end
    def Search
        position = @queue.shift
        if @map.GetObject(position).class == @searchedClass
            TrackingRoute(position)
            @object = @map.GetObject(position)
        else
            AddAdjecent(position)
            Search()
        end
    end
    def AddAdjecent(position)
        AdjacentPosition.new(position).adjacent.each do |elem|
            if @map.isInside(elem) && @trail[elem.x][elem.y].class == NilClass
                @queue << elem
                @trail[elem.x][elem.y] = position
            end
        end
    end
    def TrackingRoute(position)
        if position.x != -999 && position.y != -999
            @route.unshift(position)
            TrackingRoute(@trail[position.x][position.y])
        end
    end
end