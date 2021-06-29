f = Proc.new{ puts "Ok"}

f.call
f.yield

f = Proc.new{ |str| puts str }

p f.arity

f.call("NF")

f = Proc.new { |i| puts i}
p 3.times(&f)


f = Proc.new{ |a,b,c| p a,b,c}
f.call(1,9)


f = lambda{|a,b,c| p a,b,c}

f.call(1,2,3)

c = ->(x){ p x}

c.call("a")


def method_proc_next
    proc = Proc.new{ next p "next"}
    proc.call
    p "method_proc"
end

method_proc_next


def method_proc_break
    proc = Proc.new{ break p "break"}
    proc.call
    p "method_proc"
end

# method_proc_break


def method_proc_return
    proc = Proc.new{ return p "return" }
    proc.call
    p "method_proc"
end

method_proc_return


def method_lambda_next
    proc = lambda{ next p "next"}
    proc.call
    p "method_lambda"
end

method_lambda_next


def method_lambda_break
    proc = lambda.new{ break p "break"}
    proc.call
    p "method_lambda"
end


def method_lambda_return
    proc = lambda{ return p "return" }
    proc.call
    p "method_lambda"
end

method_lambda_return