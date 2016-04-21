# asks the user for his choice of hand
# users inputs the hand choice
# computer randomly generates the hand
# compare the user_hand vs the computer_hand
# announce winner with colorful commentary

def prompt(message)
  puts "=> " + message
end

def compare_hands(user_hand, auto_hand)
  if user_hand == auto_hand
    prompt("It's a tie.")
  elsif user_hand == 1 && auto_hand == 2
    prompt("Your rock has been swallowed up by paper! You lose")
  elsif user_hand == 1 && auto_hand == 3
    prompt("Muhahaha, Opponent's scissors was a no match for your hard rock! You win")
  elsif user_hand == 2 && auto_hand == 1
    prompt("Gulp, That was the sound of your paper swallowing the opponent's tiny rock! You win")
  elsif user_hand == 2 && auto_hand == 3
    prompt("Ouch, Your paper has been split in half b the opponent's razor sharp scissors! You lose")
  elsif user_hand == 3 && auto_hand == 1
    prompt("Your scissors are bent backwards by the opponent's crushing rock! You lose")
  elsif user_hand == 3 && auto_hand == 2
    prompt("That's right, watch out for that paper cut! You win")
  end
end

hands = { 1 => 'rock', 2 => 'paper', 3 => 'scissors' }

prompt("<<<Welcome to the Ultimate RPS Challenge>>>")

loop do
  hand_prompt = <<-MSG
  Enter your choice of hand:
  1) rock
  2) paper
  3) scissors
  MSG

  user_hand = ''
  loop do
    prompt(hand_prompt)
    user_hand = gets.chomp.to_i
    break if hands.key?(user_hand.to_i)
    prompt("You need to enter a choice among 1, 2 and 3 to move forward.")
  end

  prompt("You've chosen the formidable #{hands[user_hand]}.")

  prompt("Opponent is determining its hand...")

  auto_hand = 1 + rand(3)

  prompt("Opponent has chosen #{hands[auto_hand]}.")

  compare_hands(user_hand, auto_hand)

  prompt("Would you like to play again? If so, click Y. If not, click any other key to exit")
  response = gets.chomp.downcase
  break if response != 'y'
end

prompt("Goodbye, We'll be here for your next challenge.")
