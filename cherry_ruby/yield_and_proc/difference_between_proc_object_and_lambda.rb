#how to create a proc object
Proc.new{ |a,b| a + b }
proc { |a,b| a + b }

->(a,b){a + b}
lambda{ |a,b| a + b }

# lambda literal

->(a,b){a + b}
-> a,b {a + b}
-> { 'Hello!' }
-> (a,b) do
    a + b
end

-> (a = 0, b = 0) {a + b}

# create and run proc.new
add_proc = Proc.new{ |a,b| a + b}
add_proc.call(10,20) #=> 30

# create and run lambda
add_lambda = ->(a,b){ a + b }
add_lambda.call(10,20) #=> 30

# case proc.new
add_proc = Proc.new { |a,b| a.to_i + b.to_i }
#any number of arguments can be executed
add_proc.call(10) #=> 10
add_proc.calss(10,20,30) #=> 30

#case lambda
add_lambda = ->(a,b) { a.to_i + b.to_i }

#if the number of arguments dose not match, an error will occur
add_lambda.call(10)
#=> ArgumentError: wrong number of arguments (given 1, expected 2)

add_lambda.call(10,20,30)
#=> ArgumentError: wrong number of arguments (given 3, expected 2)

# case Proc.new
add_proc = Proc.new{ |a,b| a + b}
add_proc.class #=> Proc
add_proc.lambda? #=> false

#case lambda
add_lambda = ->(a,b) { a + b}
add_lambda.class #=> Proc
add_lambda.lambda? #=> true