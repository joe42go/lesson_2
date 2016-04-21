
def prompt(message)
  puts "=> " + message
end

def float_it(num)
  num.to_f
end

def monthly_calc(loan_amount, monthly_rate, duration)
  loan_amount * (monthly_rate * (1 + monthly_rate)**duration) / ((1 + monthly_rate)**duration - 1)
end

def format_result(pre_result)
  pre_result.round(2) # unless pre_result >= 1000
  # pre_result.to_s.split(//).insert(1, ",").join.to_f
end

prompt("<<<Welcome to the Mortgage Calculator>>>")

loop do
  loan_amount = ''
  loop do
    prompt("Enter your loan amount:")
    loan_amount = gets.chomp
    break unless loan_amount.empty? || loan_amount.match(/[a-zA-Z]/) || loan_amount.to_f < 0
  end

  apr = ''
  loop do
    prompt("What is your APR (in decimal e.g. For 4.75%, enter 0.0475 or .0475):")
    apr = gets.chomp
    break unless apr.empty? || apr.match(/[a-zA-Z]/) || loan_amount.to_f < 0 
  end

  duration = ''
  loop do
    prompt("What is the loan duration (in months):")
    duration = gets.chomp
    break unless duration.empty? || duration.match(/[a-zA-Z]/) || loan_amount.to_i < 0 
  end

  loan_amount = float_it(loan_amount)
  apr = float_it(apr)
  duration = float_it(duration)

  prompt("Calculating fixed monthly payment based on entered info...")

  monthly_rate = apr / 12

  pre_result = monthly_calc(loan_amount, monthly_rate, duration)

  result = format_result(pre_result)

  prompt("Your estimated monthly payment is $#{result}")

  prompt("Would you like to conduct another calculation? Click Y or N")
  response = gets.chomp.downcase
  break if response == "n"
end

prompt("Nice working with you.  Good luck on your home purchase!")
