

# produce = {
#   'apple' => 'Fruit',
#   'carrot' => 'Vegetable',
#   'pear' => 'Fruit',
#   'broccoli' => 'Vegetable'
# }
#
# def select_fruit(produce_list)
# produce_list.select { |k, v| v == "Fruit" }
# end
#
# select_fruit(produce)

# do..end
# produce_list.select do |k, v|
#   v == "Fruit"
# end


arr = [1, 2, 3, 4, 5]

counter = 0

loop do
  arr[counter] += 1
  counter += 1
  break if counter == arr.size

end

p arr

#Essentially same but below solved elegantly
new_arr = arr.map { |counter| counter += 1 }

p new_arr

color = [ 'green', 'blues', 'purple', 'orange']

# Iteration using Enumarable methods - elegantly solved
color.each { |element| puts "I'm the color #{element}!"}

# Manually
color = [ 'green', 'blues', 'purple', 'orange']

counter = 0

loop do
  break if counter == color.size
  puts "I'm the color #{color[counter]}!"
  counter += 1
end
