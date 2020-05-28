# ask user for two numbers
# ask user for an operation to perform
# perform the operation on the two numbers
# out the results

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  num.to_i() != 0
end

prompt("Welcome to Calculator program!")

loop do
  number1 = ''
  loop do
    prompt("What's the first number")
    number1 = Kernel.gets().chomp().to_i

    if valid_number?(number1)
      break
    else
      prompt("Hmm...that doesn't look like a valid number")
    end
  end

  number2 = ''
  loop do
    prompt("What's the second number")
    number2 = Kernel.gets().chomp().to_i

      if valid_number?(number2)
        break
      else
        prompt("Hmm...that doesn't look like a valid number")
      end
  end

  prompt("Wants to perform operation? 1) add 2) subtract 3) multiply 4) divide")
  operator = Kernel.gets().chomp()

  result = case operator
           when '1'
             number1 + number2
           when '2'
             number1 - number2
           when '3'
             number1 * number2
           when '4'
             number1.to_f / number2.to_f
  end
  prompt("The result is: #{result}")

  prompt("Would you like perform another calculation? (Y to calculate again)")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thanks for using the calculator. Good bye!")
