class User
    attr_accessor :position
    def initialize(position)
        @position = position
    end
end
class Order
    attr_accessor :orderedItems, :totalCost
    attr_accessor :routeToStore, :routeToUser
    @routeToStore
    @routeToUser
    def initialize(store,map)
        @storeName = store.name
        @searchDriver = BFS.new(store.position,Driver,map)
        @driverName = @searchDriver.object.name
        @orderedItems = Array.new(){Array.new(2)}
        @routeToStore = @searchDriver.route.reverse
        @routeToUser = BFS.new(store.position,User,map).route
        @totalCost = (@routeToUser.length-1)*3000
    end
    def AddItem(item, count)
        #Tinggal implementasi set
        @totalCost += item.price*count
        @orderedItems << [item,count]
    end
    def Rating(rate)
        @searchDriver.object.Rating(rate)
    end
end