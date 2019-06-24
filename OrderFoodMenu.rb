class OrderFoodMenu
    def initialize(user,map)
        @user = user
        @map = map
    end
    def Run
        store = ChooseStore.new().Run
        orderProcessor = OrderProcessor.new(store,@map)
        order = orderProcessor.Process
        ChooseItem.new(order,store.items).Run
        @user.AddOrder(order)
        OrderedItemsShower.new(order.orderedItems).Show
        TotalCostShower.new(order.totalCost).Show
        RouteShower.new(order.routeToStore).Show
        puts "Driver arrive at store"
        RouteShower.new(order.routeToUser).Show
        puts "Driver arrive at your position"
        RateDriver.new(orderProcessor.driver).Run
        DriverRatingExecutor.new(orderProcessor.driver,@map).Execute
        DriverAroundChecker.new(@map).Check
        FileHandler.Write("output.json",@map,@user)
    end
end