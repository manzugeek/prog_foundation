
# Practice Problem 5 - personal solution
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
arr = []
munsters.each_value do |details|
  arr << details["age"] if details["gender"] == "male"
end

puts arr.reduce(:+)
#.....................................
