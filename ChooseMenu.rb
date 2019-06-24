class ChooseMenu
    def initialize(user,map)
        @user = user
        @map = map
    end
    def Run
        MenuShower.new().Show
        print "Pilih Menu: "
        userInput = gets.chomp.to_i
        case userInput
        when 1
            ShowMapMenu.new(@map)
        when 2
            OrderFoodMenu.new(@user,@map)
        when 3
            ViewHistoryMenu.new(@user)
        when 99
            ExitMenu.new()
        else
            puts "Invalid input"
            self.Run
        end
    end
end