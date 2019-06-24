class ChooseStore
    def Run
        StoreShower.new().Show
        print "Pilih Restoran: "
        userInput = gets.chomp.to_i
        if (Store.list[userInput-1].class == Store)
            Store.list[userInput-1]
        else
            puts "Invalid Input"
            ChooseStore
        end
    end
end