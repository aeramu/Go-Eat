class ExitMenu
    def Run
        puts "Are you sure?(y/n)"
        userInput = gets.chomp
        while userInput != "y" && userInput != "n"
            userInput = gets.chomp
        end
        if userInput == "y"
            exit(true)
        end    
    end
end