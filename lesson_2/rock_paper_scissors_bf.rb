
# Hash case *************************

hash_choices = {r: 'rock', p: 'paper', sc: 'scissors',
                 l: 'lizard', sp: 'spock'}


def prompt(message)
  puts " =>#{message}"
end

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'scissors' && second == 'paper') ||
    (first == 'lizard' && second == 'spock') ||
    (first == 'spock' && second == 'lizard')
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

puts "Choose one of the following keys:"

hash_choices.each do |key, val|
  puts " =>'#{key}' for #{val}"
end

loop do  # Main Execution Loop
  op = ''
  loop do
    prompt " Enter the key?"
    op = gets.chomp.to_sym

    if hash_choices.has_key?(op)
      puts "You chose: '#{op}' for #{hash_choices[op]}"
      break
    else
      prompt "Choose the right key: r, p, sc, l or sp"
    end
  end

  computer_choice = hash_choices.values.sample

  puts("You chose: #{hash_choices[op]}; Computer chose: #{computer_choice}")

  display_results(op, computer_choice)

  prompt "Wants to continue playing?"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
  end

prompt "Thanks for playing. Good bye!"
