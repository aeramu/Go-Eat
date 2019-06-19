require_relative 'Store'
require_relative 'Position'
require_relative 'Driver'
require_relative 'RandomGenerator'
require_relative 'Map'
require_relative 'BFS'
require_relative 'User'

def PrintOrderedList(*list,last)
    i = 0
    list.each do |elem|
        i+=1
        print i,". ",elem.to_s
        puts
    end
    print "99. ",last
    puts
end
def mapInitialization(argumentArray)
    if argumentArray[0].class == NilClass
        map = Map.new(10)
        map.Add(User.new(RandomGenerator.Position(10)).object_id)
        RandomGenerator.Map(map)
    else
        if argumentArray[1] == NilClass
            #ReadFile
        else
            map = Map.new(argumentArray[0].to_i)
            map.Add(User.new(Position.new(argumentArray[1].to_i,argumentArray[2].to_i)).object_id)
            RandomGenerator.Map(map)
        end
    end
    map
end
def ChooseItem(order, items)
    #PrintOrderedList(items,"Order")
    i = 0
    items.each do |elem|
        i+=1
        print i,". ",elem.name,": Rp. ",elem.price
        puts
    end
    puts "99. Order"
    userInput = gets.chomp.to_i-1
    if userInput == 98
        order
    elsif items[userInput].class == Item
        print "How Much? "
        count = gets.chomp.to_i
        order.AddItem(items[userInput],count)
        ChooseItem(order, items)
    else
        puts "Invalid Input"
        ChooseItem(order, items)
    end
end
def ChooseStore(map)
    i = 0
    Store.list.each do |elem|
        i+=1
        print i,". ",elem.name,": ",elem.position.x," ",elem.position.y
        puts
    end
    userInput = gets.chomp.to_i-1
    if (Store.list[userInput].class == Store)
        Store.list[userInput]
    else
        ChooseStore(map)
    end
end
def Exit(map)
    puts "Are you sure?(y/n)"
    userInput = gets.chomp
    while userInput != "y" && userInput != "n"
        userInput = gets.chomp
    end
    if userInput == "n"
        MainMenu(map)
    end    
end
def OrderFood(map)
    store = ChooseStore(map)
    order = ChooseItem(Order.new(store,map),store.items)
    order.orderedItems.each do |elem|
        print elem[0].name," ",elem[1]
        puts
        print "Total Cost: ",order.totalCost
        puts
    end
    order.routeToStore.each do |elem|
        print "Driver to ",elem.x," ",elem.y
        puts
    end
    puts "Driver Arrive at Store"
    order.routeToUser.each do |elem|
        print "Driver to ",elem.x," ",elem.y
        puts
    end
    puts "Driver Arrive at Your Position"
    print "Rating(0-5): "
    userInput = gets.chomp.to_f
    order.Rating(userInput)
end
def MainMenu(map)
    PrintOrderedList("Show Map","Order Food","View History","Exit")
    print "Choose the action's number you gonna do: "
    userInput = gets.chomp.to_i
    case userInput
    when 1
        map.Show
        MainMenu(map)
    when 2
        OrderFood(map)
        MainMenu(map)
    when 3
        MainMenu(map)
    when 99
        Exit(map)
    else
        puts "Invalid input"
        MainMenu(map)
    end
end

argumentArray = ARGV
map = mapInitialization(argumentArray)
ARGV.clear
MainMenu(map)