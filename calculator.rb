def choose_ops(ops, num1, num2)
  case ops
  when "add"
    result = num1 + num2
  when "subtract"
    result = num1 - num2
  when "multiply"
    result = num1 * num2
  else
    result = num1 / num2
  end
end

#asks for two numbers

puts "Enter your first number:"
print ">"
num1 = gets.chomp.to_i
puts "Great, you've entered #{num1}"

puts "Enter your second number:"
print ">"
num2 = gets.chomp.to_i
puts "Done, you've entered #{num2}"

#asks for the type of operation to perform: add, subtract, multiply or divide
puts "Now, choose your operation - add, subtract, multiply or divide:"
print ">"
ops = gets.chomp.downcase

ops_array = ['add', 'subtract', 'multiply', 'divide']

until ops_array.include?(ops) do
  puts "The program does not recognize the operation. Please try again:"
  print ">"
  ops = gets.chomp.downcase
end

result = choose_ops(ops, num1, num2)

puts "------------------------------------------------"

#display the result
puts "Based on your choice, the calculated answer is >>> #{result}"