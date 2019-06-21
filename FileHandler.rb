
def ReadFile(fileName)
    file = JSON.parse(File.read(fileName))
    map = Map.new(file["mapSize"])
    map.Add(User.new(Position.FromHash(file["userPosition"])).object_id)
    file["orderHistory"].each do |elem|
        routeToStore = Array.new()
        routeToUser = Array.new()
        orderedItems = Hash.new()
        elem["orderedItems"].each do |hash|
            orderedItems[Item.FromHash(hash["key"])] = hash["value"]
        end
        elem["routeToStore"].each do |position|
            routeToStore << Position.FromHash(position)
        end
        elem["routeToUser"].each do |position|
            routeToUser << Position.FromHash(position)
        end
        User.AddOrder(Order.new(elem["storeName"],elem["driverName"],
            orderedItems,routeToStore,routeToUser,elem["totalCost"]))
    end
    file["storeList"].each do |elem|
        items = Array.new()
        elem["items"].each do |item|
            items << Item.FromHash(item)
        end
        map.Add(Store.new(elem["name"],Position.FromHash(elem["position"]),
            items).object_id)
    end
    file["driverList"].each do |elem|
        map.Add(Driver.new(elem["name"],Position.FromHash(elem["position"]),
            elem["rating"],elem["ratedBy"]).object_id)
    end
    map
end

def WriteFile(map)
    hash = Hash.new
    hash["mapSize"]=map.size
    hash["userPosition"] = User.position.to_hash
    hash["orderHistory"] = User.orderHistoryHash
    storeList = Array.new()
    Store.list.each do |elem|
        storeList << elem.to_hash
    end
    hash["storeList"] = storeList
    driverList = Array.new()
    Driver.list.each do |elem|
        driverList << elem.to_hash
    end
    hash["driverList"] = driverList
    File.open("tmp.json","w") do |f|
        f.write(JSON.pretty_generate(hash))
    end
end