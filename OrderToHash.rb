class OrderToHash
    def initialize(order)
        @order = order
    end
    def result
        Hash["storeName",@order.storeName,
            "driverName",@order.driverName,
            "orderedItems",OrderedItemsToHash.new(@order.orderedItems).result,
            "routeToStore",RouteToHash.new(@order.routeToStore).result,
            "routeToUser",RouteToHash.new(@order.routeToUser).result,
            "totalCost",@order.totalCost]
    end
end