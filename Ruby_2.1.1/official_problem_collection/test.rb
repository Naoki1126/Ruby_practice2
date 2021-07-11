# # # # module M
# # # #     def method_missing(id, *args)
# # # #         p "MOdule"
# # # #     end
# # # # end

# # # # class A
# # # # end

# # # # # p A.dummy

# # # # module Mod

# # # #     CONST = 111
# # # #     class << self
# # # #         def output
# # # #             p "output"
# # # #             p CONST
# # # #         end
# # # #     end

# # # #     def self.input
# # # #         p "input"
# # # #         p CONST
# # # #     end
# # # # end

# # # # Mod::output
# # # # Mod.input

# # # # class D
# # # #     include Mod
# # # #     extend Mod
# # # # end

# # # # # D.output
# # # # # D.input


# # # # # D.output

# # # # # p D.input

# # # # # class F < Mod
# # # # # end

# # # # module X
# # # #     # p self.superclass

# # # #     def greet
# # # #        p "hello"
# # # #         super()
# # # #     end
# # # # end

# # # # class Y
# # # #     p self.superclass
# # # #     def greet
# # # #         p "HelloY"
# # # #     end
# # # # end





# # # # class Z < Y
# # # #     include X
# # # #     p self.superclass
# # # #     def greet
# # # #         p "HelloZ"
# # # #         super()
# # # #     end
# # # # end



# # # # Z.new.greet













# # # class D
# # #     CONST =2
# # #     @@x = 2
# # # end


# # # module M
# # #     CONST = 1
# # #     @@x = 1

# # #     def get_const
# # #         p CONST
# # #     end
# # # end
# # # class C < D
# # #     include M
# # #     def output
# # #         p CONST
# # #         p @@x
# # #     end


# # #     def get_const
# # #         p CONST
# # #     end

# # #     def get_class_valiable
# # #         p @@x
# # #     end

# # #     @x = 100

# # #     def self.get_instance
# # #         p @x
# # #     end

# # #     class << self
# # #         @x = 10000
# # #         def get_instance
# # #             p @x
# # #             p "aaaa"
# # #         end
# # #     end
# # # end

# # # C.new.get_const
# # # C.new.get_class_valiable
# # # C.get_instance

# # array = [1,23]
# # array.freeze
# # array 
# # p array


# # class A

# #     def initialize( *rest )

# #         p "*rest2=#{rest}"

# #         p rest

# #     end

# # end



# # class B < A

# #     def initialize( first, *rest )

# #         p "first1=#{first}"

# #         puts "rest1=#{rest}"

# #         super

# #         super()

# #     end

# # end


# # obj1 = B.new("A", "B", "C", "D", "E")


# # class D

# #     def initialize(*args)
# #         p args
# #         p "args=#{args}"
# #         puts args
# #         puts "#{args}"
# #     end
# # end

# # D.new(1,2,3,4,5,6)

# class C


#     def output
#         puts "out"
#         C.foo
#     end
#     protected

#     def self.foo
#         p "foo"
#     end
# end

# # C.new.output

# # class Foo
# #     def foo
# #      "foo"
# #     end
# #    end
  
  
# #    class Bar < Foo
# #     def foo
# #      super + "bar"
# #     end
# #     undef foo
# #     alias bar foo
# #    end
# #    puts Bar.new.bar


# #    class Foo
# #     def initialize(obj)
# #      obj.foo
# #     end
# #     def foo
# #      puts "foofoofoo"
# #     end
# #    end
# #    class Bar
# #     def foo
# #      puts "barbarbar"
# #     end
# #    end
# #    Foo.new(Bar.new)


# class Bar
#     def foo
#      puts "barbarbar"
#     end
# end

# class Foo < Bar
#     def initialize(obj)
#         obj.foo
#     end

#     def foo
#      puts "foofoofoo"
#     end
# end
#    Foo.new(Foo.new)

module M
    CONST = 100
    @@x = 10000
end


class C
    @x = 1000000

    def it
        p @x
    end
    class << self
        CONST = 100
        @x =200
        @@x = 2
        def out
            p @@x
            p CONST
            p @x
        end
    end

    def self.get
       p @x
    end

end

# C.out
# C.get
# C.new.it

# a = 1.0 + 2.0
# b = 3.0
# p a == b

# c = 0.1 + 0.2
# d = 0.3
# p c == d
# p 0.2 == 0.2



module M
    CONST = 1000
end


class C
    extend M
    def get_const
        p CONST
    end
end

C.new.get_const
class X
    @x = 100
    class << self
        @x = 200

        def get_class_instance
            p @x
        end
    end
end

X.get_class_instance