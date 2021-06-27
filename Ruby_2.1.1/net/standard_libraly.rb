# # class C
# #     A = 1
# #     def method
# #         puts A
# #     end
# # end

# # C.new.method

# # class C
# #     def method
# #         A = 1 #=> SyntaxError 呼び出していなくてもエラーになる
# #     end
# # end


# module M
#     A = 1
#     class B
#         A = 2

#         def const_output
#             p A
#         end
#     end


#     class C < B
#         def const_output
#             p A
#         end
#     end
# end

# # mod = M::C.new.const_output


# module M
#     A = 1
#     class << self
#         A = 3
#         p self
#     end
# end

# class C
#     A = 2
#     extend M
# end

# class B < C
#     p A
#     class << self
#         p A
#         p self
#     end
# end

# B.new

# def hoge(*args)
#     p *args
#     p args
# end

# hoge([1,2,3],"a")


#  def display(*args)
#     p args
#  end

#  def non_deployment(*args)
#     display(args)
#  end

#  def deployment(*args)
#     display(*args)
#  end

#  non_deployment(1,2,3)
#  deployment(1,2,3)

# def foo(a,*b)
#     puts "a:#{a.inspect}, b:#{b.inspect}"
# end

# foo(1,2,3,4)


# def my_method(a = 1,b = a + 1)
#     p [a,b]
# end

# my_method(5,6)
# my_method()

# class C
#     def foo
#         "foo"
#     end

#     def test(str = foo)
#         p str
#     end

# end

# C.new.test
# C.new.test("bar")


class Cat
    attr_accessor :name
    def initialize(name)
        @name = name
    end

end

original = Cat.new("Tama")
copied = original.clone

puts copied.equal?(original)
puts copied.eql?(original)
puts copied.name

copied.name.replace("Mike")
puts original.name

class Object
public
    def my_method
        puts "my_method"
    end
end

class C
    def c_method
        my_method
    end

end


Object.new.my_method

C.new.c_method