class Menu
    def self.MainMenu
        PrintOrderedList("Show Map","Order Food","View History","Exit")
        print "Choose the action's number you gonna do: "
        userInput = gets.chomp.to_i
        case userInput
        when 1
            $map.Show
            MainMenu()
        when 2
            OrderFood()
            FileHandler.Write("output.json")
            MainMenu()
        when 3
            User.ShowHistory()
            MainMenu()
        when 99
            Exit()
        else
            puts "Invalid input"
            MainMenu()
        end
    end
    def self.ChooseItem(order, items)
        #PrintOrderedList(items,"Order")
        puts "Pilih makanan atau minuman yang ingin dipesan: "
        i = 0
        items.each do |elem|
            i+=1
            print i,". ",elem.name,": Rp. ",elem.price
            puts
        end
        puts "99. Pesan"
        userInput = gets.chomp.to_i-1
        if userInput == 98
            order
        elsif items[userInput].class == Item
            print "Beli berapa banyak? "
            count = gets.chomp.to_i
            order.AddItem(items[userInput],count)
            ChooseItem(order, items)
        else
            puts "Invalid Input"
            ChooseItem(order, items)
        end
    end
    def self.ChooseStore
        i = 0
        Store.list.each do |elem|
            i+=1
            print i,". ",elem.name," (",elem.position.x,",",elem.position.y,")"
            puts
        end
        userInput = gets.chomp.to_i-1
        if (Store.list[userInput].class == Store)
            Store.list[userInput]
        else
            ChooseStore
        end
    end
    def self.OrderFood
        store = ChooseStore()
        order = ChooseItem(Order.MakeOrder(store),store.items)
        order.orderedItems.each do |elem|
            print elem[0].name," ",elem[1]
            puts
            print "Total Cost: ",order.totalCost
            puts
        end
        order.routeToStore.each do |elem|
            print "Driver to ",elem.x,",",elem.y
            puts
        end
        puts "Driver Arrive at Store"
        order.routeToUser.each do |elem|
            print "Driver to ",elem.x,",",elem.y
            puts
        end
        puts "Driver Arrive at Your Position"
        User.AddOrder(order)
        print "Rating(0-5): "
        userInput = gets.chomp.to_f
        if $map.GetObject(order.routeToStore[0]).Rating(userInput) < 3
            $map.Delete(order.routeToStore[0])
        end
    end
    def self.Exit
        puts "Are you sure?(y/n)"
        userInput = gets.chomp
        while userInput != "y" && userInput != "n"
            userInput = gets.chomp
        end
        if userInput == "n"
            MainMenu
        end    
    end
end