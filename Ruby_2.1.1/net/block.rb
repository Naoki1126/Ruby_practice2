# def my_method(who, greeting, count)
#     who + yield(greeting, count)
# end

# my_method("Bob", "hello",2) { |greet,count| p greet * count}


# # my_method("Bob", "hello",2)


def my_method
    yield
end


var = "a"
my_method do
    var = "b"
    block_var = "c"
end

# p var
# p @var
# p block_varc

class MyClass
    v1 = 1
    CONST = 110

    private
    def my_method
        puts "My_method"
    end
end


c = MyClass.new

c.instance_eval do
    def const_output
        CONST
    end

    v1 = 2
end

# puts c.const_output
