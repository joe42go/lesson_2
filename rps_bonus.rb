VALID_PAIRS = { 'r' => 'rock', 'p' => 'paper', 's' => 'scissors', 'l' => 'lizard', 'k' => 'spock' }.freeze
VALID_CHOICES = %w(rock paper scissors lizard spock).freeze
MAXIMUM_WINS = 5
WINNING_COMBOS = { 'rock' => %w(scissors lizard'), 'paper' => %w(rock spock), 'scissors' => %w(paper lizard), 'lizard' => %w(spock paper), 'spock' => %w(scissors rock) }.freeze

def clear_screen
  system('clear') || system('cls')
end

def prompt(message)
  puts("=> #{message}")
end

# def win?(first, second)
#   (first == 'rock' && (second == 'scissors' || second == 'lizard')) ||
#     (first == 'paper' && (second == 'rock' || second == 'spock')) ||
#     (first == 'scissors' && (second == 'paper' || second == 'lizard')) ||
#     (first == 'lizard' && (second == 'spock' || second == 'paper')) ||
#     (first == 'spock' && (second == 'scissors' || second == 'rock'))
# end

def win?(first, second)
  WINNING_COMBOS[first].include?(second)
end

def display_result(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

def user_keep_score(player, computer, user_wins)
  if win?(player, computer)
    user_wins + 1
  else
    user_wins
  end
end

def computer_keep_score(player, computer, computer_wins)
  if win?(computer, player)
    computer_wins + 1
  else
    computer_wins
  end
end

def display_score(user_wins, computer_wins) # keeps track of number of wins for each side
  if user_wins == MAXIMUM_WINS
    prompt("Congratulations, You collected #{MAXIMUM_WINS} wins. You won the entire game!")
  elsif computer_wins == MAXIMUM_WINS
    prompt("Sorry, Computer has won #{MAXIMUM_WINS} times before you #sad_day")
  else
    prompt("Current Score is #{user_wins}(User):#{computer_wins}(Computer)")
  end
end

prompt("<<<Wecome to the Ultimate Game of Rock-Paper-Scissors-Lizard-Spock>>>")
prompt("Objective of the game is to accumulate #{MAXIMUM_WINS} wins before the computer does.")
prompt("Got it? Good. Let us begin.")

loop do
  hand_prompt = <<-MSG
  Enter the letter of your choice for your hand:
  r) rock
  p) paper
  s) scissors
  l) lizard
  k) spock
  MSG

  user_wins = 0
  computer_wins = 0
  choice = ''
  user_choice = ''

  loop do
    loop do
      prompt(hand_prompt)
      choice = gets.chomp.downcase
      user_choice = VALID_PAIRS[choice] # converts into fully spelled out choice e.g. 'r' to 'rock'

      break if VALID_CHOICES.include?(user_choice)
      prompt("That's not a valid choice.")
    end

    computer_choice = VALID_CHOICES.sample

    puts("You chose: #{user_choice}; Computer chose: #{computer_choice}")

    display_result(user_choice, computer_choice)

    user_wins = user_keep_score(user_choice, computer_choice, user_wins)
    computer_wins = computer_keep_score(user_choice, computer_choice, computer_wins)

    display_score(user_wins, computer_wins)

    sleep 1

    clear_screen

    break if user_wins == MAXIMUM_WINS || computer_wins == MAXIMUM_WINS
  end

  answer = ''

  loop do
    prompt("Do you want to play again? Click 'Y' or 'N'")
    answer = gets.chomp
    break if answer.downcase.start_with?('y', 'n')
    prompt("Erroneous entry. Please try entering either Y or N.")
  end

  break if answer.downcase.start_with?('n')
end

prompt("Thank you for playing. Good bye!")
