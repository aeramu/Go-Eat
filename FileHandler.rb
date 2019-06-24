class FileHandler
    def self.Read(fileName)
        file = JSON.parse(File.read(fileName))
        map = Map.new(file["mapSize"])
        user = User.new(HashToPosition.new(file["userPosition"]).result)
        map.Add(user)
        file["orderHistory"].each do |elem|
            user.AddOrder(HashToOrder.new(elem).result)
        end
        file["storeList"].each do |store|
            map.Add(HashToStore.new(store).result)
        end
        file["driverList"].each do |driver|
            map.Add(HashToDriver.new(driver).result)
        end
        [map,user]
    end

    def self.Write(fileName,map,user)
        hash = Hash.new
        hash["mapSize"]=map.size
        hash["userPosition"] = PositionToHash.new(user.position).result
        hash["orderHistory"] = OrderHistoryToHash.new(user.orderHistory).result
        storeList = Array.new()
        Store.list.each do |store|
            storeList << StoreToHash.new(store).result
        end
        hash["storeList"] = storeList
        driverList = Array.new()
        Driver.list.each do |driver|
            driverList << DriverToHash.new(driver).result
        end
        hash["driverList"] = driverList
        File.open(fileName,"w") do |f|
            f.write(JSON.pretty_generate(hash))
        end
    end
end