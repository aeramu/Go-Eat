class Order
    attr_accessor :orderedItems, :totalCost
    attr_accessor :routeToStore, :routeToUser
    attr_accessor :storeName, :driverName
    def initialize(storeName,driverName,orderedItems,routeToStore,routeToUser,totalCost)
        @storeName = storeName
        @driverName = driverName
        @orderedItems = orderedItems
        @routeToStore = routeToStore
        @routeToUser = routeToUser
        @totalCost = totalCost
    end
    def AddItem(item, count)
        @totalCost += item.price*count
        @orderedItems[item] += count
    end
end