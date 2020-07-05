# require 'calculator'
# require 'rock_paper_scissors'

games = { 1 => 'calculator', 2 => 'rps'}

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_num?(num)
  num.to_i == 1 || num.to_i == 2
end

prompt("Welcome to the CLI-GAMES!")

prompt("Choose 1 for calculator; 2 for rps")

loop do
  play = Kernel.gets().chomp().to_i

  if valid_num?(play)
    puts "You chose: #{games[play]} game!"

    break
  else
    prompt("Must choose 1 or 2")
  end
end
