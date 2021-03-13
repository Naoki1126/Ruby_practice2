# class Base
#   def name
#     p 'Base#name'
#   end
# end

#   module Scope
#     class Base
#       def name
#         p 'Scope::Base#name'
#       end
#     end

#     class Inherited < Base # クラスScope::Baseとして解釈される
#       def name
#         p 'Scope::Inherited#name'
#         super
#       end
#     end
#   end

# inherited = Scope::Inherited.new
# inherited.name


# class C
#   @val = 3 #=> クラスインスタンス変数 # 特異メソッドからアクセスすることができる。
#   attr_accessor :val
#   class << self
#     @val = 10
#   end
#   def initialize
#     @val *= 2 if val
#   end
# end

# c = C.new
# c.val += 10

# p c.val #=> nil

# module M
#   CONST = "Hello, world"
# end

# class M::C
#   def awesome_method
#     CONST
#   end
# end

# p M::C.new.awesome_method　#例外が発生

# class C
# end

# module M
#   CONST = "Hello, world"

#   C.class_eval do
#     def awesome_method
#       CONST
#     end
#   end
# end

# p C.new.awesome_method

# module M
#   def class_m
#     "class_m"
#   end
# end

# class C
#   include M
# end

# p C.methods.include? :class_m　#=> false
# p C.new.methods.include? :class_m #=> true


# class S
#   @@val = 0
#   def initialize
#     @@val += 1
#   end

# end

# class C < S
#   class << C
#     @@val += 1
#   end

#   def initialize
#   end
# end

# C.new
# C.new
# S.new
# S.new

# p C.class_variable_get(:@@val) #=> 3

# module M1

#   def outputhello
#     @val = 4

#     puts "hello"
#   end

# end


# module M2
# end

# class C
#   include M1
#   include M2
# end

# p C.ancestors #=> [C, M2, M1, Object, Kernel, BasicObject]

# module M1
#   class C1
#     CONST = "001"
#   end

#   class C2 < C1
#     CONST = "010"

#     module M2
#       CONST = "011"

#       class Ca
#         CONST = "100"
#       end

#       class Cb < Ca
#         p CONST
#       end
#     end
#   end
# end
