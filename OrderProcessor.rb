class OrderProcessor
    attr_accessor :driver
    def initialize(store,map)
        @store = store
        @map = map
    end
    def Process
        searchDriver = BFS.new(@store.position,Driver,@map)
        @driver = searchDriver.object
        searchUser = BFS.new(@store.position,User,@map)
        Order.new(@store.name,@driver.name,Hash.new(0),
            searchDriver.route.reverse,
            searchUser.route,
            (searchUser.route.length-1)*1000)
    end
end