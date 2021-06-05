# class C
# end

# module M
#   CONST = "Hello, world"

#   C.class_eval do #=> インスタンスメソッドの定義、ブロックを渡した場合、ネストはそのネストになる
#     def awesome_method
#       CONST
#     end

#     def module_nesting
#         Module.nesting
#     end
#   end

#   C.class_eval(<<-code) #=>インスタンスメソッドの定義、文字列の場合ネストはCになる

#     def module_nest
#         Module.nesting
#     end

#     code
# end

# p C.new.awesome_method
# p C.new.module_nesting #=> [M]
# p C.new.module_nest #=> [C,M]


# class C
#     def self.m1
#       200
#     end
# end
  
# module R
#     refine C.singleton_class do #=> refineにてクラスメソッドを再定義する場合はsingleton_class を使う
#         def m1
#             100
#         end
#     end
# end
  
#   using R
  
#   puts C.m1


#   module M1
#     class C1
#       CONST = "001"
#     end
  
#     class C2 < C1
#       CONST = "010"
  
#       module M2
#         CONST = "011"
  
#         class Ca
#           CONST = "100"
#         end
  
#         class Cb < Ca
#           p CONST
#         end
#       end
#     end
#   end


# class Object
#     CONST = "100"
# end
  
# class C
#     CONST = "010"
#     class << self
#         CONST = "001"

#         def const_get
#           CONST
#         end
#     end
# end
  
#   p C::CONST #=> 010
#   p Object::CONST #=> 100

# m = Module.new

# CONST = "Constant in Toplevel"

# _proc = Proc.new do
#   CONST = "Constant in Proc"
# end

# m.instance_eval do
#   CONST = "Constant in Module instance"

#   def const
#     CONST
#   end

#   def nesting
#     Module.nesting
#   end
# end

# m.module_eval(&_proc)

# p m.const

module A
    B = 42

    def f
      21
    end
end

A.module_eval do
    def self.f
        p B
    end
end

  B = 15
  A.f

  10.times{|d| print d < 2...d > 5 ? "O" : "X" }
  