
def prompt(message)
  puts "=> #{message}"
end

prompt ("Input your name to know your status:")

name = gets.chomp
  if name == "shamim"
    puts "Yeee! I'm big named - #{name.upcase}"
  else
    puts "#{name.downcase}: sina maana!!"
  end
