# require "rational"
# require "complex"

# a = 1.0 + 1
# p a
# p a.class

# a = a + Rational(1,2)
# p Rational(2,3)
# p a
# p a.class

# a = a + Complex(1,2)
# p a
# p a.class

# require "Date"

# d1 = DateTime.new
# d2 = DateTime.new

# p d1.class
# p (d2 - d1).class

# d3 = Date.new(2020,01,01)
# p d3.strftime("%m/%d")

# d3+=1
# p d3.strftime("%m/%d")

# p Date.new.to_s

# p (Date.new - Date.new).class

# p (Time.now - Time.now).class


hash = {"a" => 1,"b" => 2}
hash.freeze
hash = "a"
p hash

# hash["c"] = 3
