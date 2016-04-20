require "yaml"
MESSAGES = YAML.load_file('calculator_messages.yml')

def prompt(message)
  puts "=> #{message}"
end

def valid_num?(num)
  return true if num[0] == "0" || num.to_i != 0
end

def operation_to_msg(ops)
  case ops
  when '1'
    "Adding"
  when '2'
    "Subtracting"
  when '3'
    "Multiplying"
  when '4'
    "Dividing"
  end
end

def choose_ops(ops, num1, num2)
  case ops
  when '1'
    num1.to_i + num2.to_i
  when '2'
    num1.to_i - num2.to_i
  when '3'
    num1.to_i * num2.to_i
  else
    num1.to_f / num2.to_f
  end
end

# asks for two numbers
puts "***Welcome to the Calculator***"

name = ''
loop do
  prompt(MESSAGES['name'])
  print ">"
  name = gets.chomp

  break unless name.empty?
  prompt(MESSAGES['missing_name'])
end

prompt("Hi, Nice to meet you, #{name}")

loop do
  num1 = ''
  loop do
    prompt("Enter your first number:")
    print ">"
    num1 = gets.chomp

    break if valid_num?(num1)
    prompt("Hmmm...that doesn't look like a valid number. Let's try again.")
  end

  num2 = ''
  loop do
    prompt("Enter your second number:")
    print ">"
    num2 = gets.chomp

    break if valid_num?(num2)
    prompt("Hmmm...that doesn't look like a valid number. Let's try again")
  end

  # asks for the type of operation to perform: add, subtract, multiply or divide

  operator_prompt = <<-MSG
  Choose your operation:
  1) add
  2) subtract
  3) multiply
  4) divide
  MSG

  prompt(operator_prompt)
  print ">"
  ops = gets.chomp.downcase

  ops_array = %w(1 2 3 4)

  until ops_array.include?(ops)
    prompt("The program does not recognize the operation. Please try again:")
    print ">"
    ops = gets.chomp.downcase
  end

  result = choose_ops(ops, num1, num2)

  prompt("#{operation_to_msg(ops)} the two numbers...")

  puts "-------------------------------------------------------------"

  # display the result
  prompt("Based on your choice, the calculated answer is >>> #{result}")

  prompt("Do you want to perform another calculation? If so, please press \"Y\". Otherwise, press any other key to quit")
  response = gets.chomp.downcase
  break unless response == "y"
end

prompt("Thank you for using the calculator. Goodbye")
