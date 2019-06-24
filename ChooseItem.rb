class ChooseItem
    def initialize(order,items)
        @order = order
        @items = items
    end
    def Run
        ItemsShower.new(@items).Show
        puts "Pilih makanan atau minuman:"
        userInput = gets.chomp.to_i
        if userInput == 99
            @order
        elsif @items[userInput-1].class == Item
            print "Berapa banyak? "
            count = gets.chomp.to_i
            @order.AddItem(@items[userInput-1],count)
            self.Run
        else
            puts "Invalid Input"
            self.Run
        end
    end
end