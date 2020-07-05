# local variable vs Constants behaviour

CONSTANT = {r: 'rock', p: 'paper', sc: 'scissors',
                 l: 'lizard', sp: 'spock'}

def choice(input)
  puts "You Picked => '#{input}' for #{CONSTANT[input]}"
end

def prompt(message)
  puts " =>#{message}"
end

op = ''
loop do
  prompt " Enter the key?"

  op = gets.chomp.to_sym

  if CONSTANT.has_key?(op)
    choice(op)  #hash accessible via the method/contant
    break
  else
    prompt "Choose the right key: r, p, sc, l or sp"
  end
end
