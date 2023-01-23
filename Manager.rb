class Manager
    def initialize(player1, player2)
        @current_player = player1
        @other_player = player2
        @player1 = player1
        @player2 = player2
        @player1Name = "Player 1"
        @winner = nil
        @questions = [
            "What is 5 + 3?",
            "What is 10 - 7?",
            "What is 2 * 5?",
            "What is 10 / 2?",
            "What is 8 % 2?",
            "What is 3 * 4?",
            "What is 15 / 3?",
            "What is 8 + 3?"
        ]
        @answer = nil
        @answers = ["8","3","10","5","0","12","5","11"]
    end

    def ask_question(index)
        puts @questions[index]
    end
        
    def receive_answer
        @answer = gets.chomp
    end

    def check_answer(index)
        if @answer === @answers[index]
            puts "Correct!"
            return true
        else 
            puts "Nope! That is not the answer"
            @current_player.lose_life
            return false
        end
    end

    def check_winner
        puts @current_player.lives
        if @current_player.lives < 1
            @winner = @other_player
            puts "#{@other_player.name} has won with a score of #{@other_player.lives}/3"
            puts "---GAME OVER---"
            puts "Good Bye!"
            return true
        else 
            return nil
        end
    end

    def start
        count = 0
        @current_player = @player1
        while @winner == nil do
            self.ask_question(count)
            self.receive_answer
            self.check_answer(count) 
            break if self.check_winner
            if @current_player == @player1
                @current_player = @player2
                @other_player = @player1
            else
                @current_player = @player1
                @other_player = @player2
            end
            count = count + 1
            puts "---NEW TURN---"
            puts "Player 1 lives: #{@player1.lives}"
            puts "Player 2 lives: #{@player2.lives}"
        end
    end
end