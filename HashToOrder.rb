class HashToOrder
    def initialize(hash)
        @hash = hash
    end
    def result
        Order.new(@hash["storeName"],
            @hash["driverName"],
            HashToOrderedItems.new(@hash["orderedItems"]).result,
            HashToRoute.new(@hash["routeToStore"]).result,
            HashToRoute.new(@hash["routeToUser"]).result,
            @hash["totalCost"])
    end
end