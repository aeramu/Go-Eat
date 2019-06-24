class Map
    attr_reader :size
    def initialize(size)
        @objectMap = ObjectMap.new(size){ObjectMap.new(size)}
        @visualMap = VisualMap.new(size){VisualMap.new(size,".")}
        @size = size
    end
    def Add(object)
        @objectMap.Add(object)
        @visualMap.Add(object)
    end
    def Delete(position)
        @objectMap.Delete(position)
        @visualMap.Delete(position)
    end
    def GetObject(position)
        @objectMap[position.x][position.y]
    end
    def GetVisual(position)
        @visualMap[position.x][position.y]
    end
    def isInside(position)
        position.x>=0&&position.x<@size&&position.y>=0&&position.y<@size
    end
end