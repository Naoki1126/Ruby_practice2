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
#         p self.ancestors
#       end
#     end
#   end
# end



# test_array = "aaaaa"
# test_array.instance_eval{
#   def text
#     p self
#     p "bbbbbb"
#   end
# }


# p test_array.text

# val = 1 + 1/2r #=> 2/2 + 2/1
# puts val.class #=> Rational 分数
# puts val　#=> 3/2

# def hoge(*args, &block)
#   block.call(*args)
# end

# hoge(1,2,3,4) do |*args|
#   p args.length > 0 ? "hello" : args #=> hello
# end


# def m1(*)
#   str = yield if block_given?
#   p "m1 #{str}"
# end

# def m2(*)
#   str = yield if block_given?
#   p "m2 #{str}"
# end

# m1 m2 do
#   "hello"
# end


# m1の引数としてm2 が呼び出される。do end よりもm2メソッドの実行の方が早い
# m2 "
# "m1 hello"

# module M
#   def class_m
#     "class_m"
#   end
# end

# module S
#   def class_s
#     "class_s"
#   end
# end

# class C
#   extend M # extend はモジュールをクラスの特異メソッドとして追加する
#   include S # インスタンスのメソッドとして追加する
# end

# p C.methods.include? :class_m #=> true
# p C.new.methods.include? :class_m #=> false

# p C.methods.include? :class_s #=> false
# p C.new.methods.include? :class_s #=> true

# class C
#   def m1
#     400
#   end
# end

# module M
#   refine C do
#     def m1
#       100
#     end
#   end
# end

# class C
#   using M
# end

# puts C.new.m1 #=> 400
# p C.ancestors #=> [C, Object, Kernel, BasicObject]


# class C
#   def self.m1
#     200
#   end
# end

# module R
#   refine C.singleton_class do #=> クラスメソッドの再定義にはsingleton_classを使用する
#     def m1 #=> selfは無名のモジュールになる。
#       100
#     end
#   end
# end

# using R

# puts C.m1

# module M1
# end

# module M2
# end

# class C
#   include M1, M2
# end

# p C.ancestors #=> [C, M1, M2, Object, Kernel, BasicObject]

# class C
#   def m1(value)
#     100 + value
#   end
# end

# module R1
#   refine C do
#     def m1
#       super 50
#     end
#   end
# end

# module R2
#   refine C do
#     def m1
#       super 100
#     end
#   end
# end

# using R1
# using R2

# puts C.new.m1 #=> 200


# class A

#   def m1
#     p'A::m1'
#   end
# end

# module B
#   refine A do
#     def m1
#       super() #=> 親メソッドの処理をおこなう
#       p "B::A::m1 " #=> インスタンスメソッドであればオーバーライドされる
# #     end
# #   end
# # end

# # using B

# # a = A.new
# # a.m1

# class C

#   def self.m1
#     "C::m1"
#   end
# end


# p C.m1 #=> C::m1

# module M
#   refine C do
#     def self.m1
#       puts self
#       'M::C::m1'
#     end
#   end
# end

# using M

# p C.m1 #=> C::m1


# module MM
#   refine C.singleton_class do
#     def m1
#       "MM::C::m1"
#     end
#   end
# end

# using MM

# p C.m1 #=> "MM::C::m1"

# p [1,2,3,4].map(&self.method(:*)) #=> error

# class Base
#   CONST = "Hello, world"
# end

# class C < Base
# end

# module P
#   CONST = "Good, night"
# end

# class Base
#   prepend P
# end

# module M
#   class C
#     CONST = "Good, evening"
#   end
# end

# module M
#   class ::C
#     def greet
#       CONST
#     end
#   end
# end

# p C.new.greet #=> Hello World

# class S
#   def initialize
#     puts "S#initialize"
#   end
# end

# class C < S
#   def initialize(*args)
#     super()
#     puts "C#initialize"
#   end
# end

# C.new(1,2,3,4,5)

# class Ca
#   CONST = "001"
# end

# class Cb
#   CONST = "010"
# end

# class Cc
#   CONST = "011"
# end

# class Cd
#   CONST = "100"
# end

# module M1
#   class C0 < Ca
#     class C1 < Cc
#       class C2 < Cd
#         p CONST

#         class C2 < Cb
#         end
#       end
#     end
#   end
# end

#=> 100

# val = 100

# def method(val)
#   yield(15 + val)
# end

# _proc = Proc.new{|arg| val + arg }

# p method(val,&_proc) #=> 215

# def hoge(*args, &block)
#   block.call(args)
# end

# hoge(1,2,3,4) do |*args|
#   p args.length < 0 ? "hello" : args
# end

# #=> [[1,2,3,4]]


# begin
#   print "liberty" + :fish.to_s
# rescue TypeError
#   print "TypeError."
# rescue
#   print "Error."
# else
#   print "Else."
# ensure
#   print "Ensure."
# end

#=> lebertyfishElse.Ensure

# def foo(n)
#   n ** n
# end

# foo = Proc.new { |n|
#   n * 3
# }

# puts foo[2] * 2 #=> 12

#メソッドの探索より、変数の探索の方が先のため、ブロックが実行される。


# v1 = 1 / 2 == 0
# v2 = !!v1 or raise RuntimeError
# puts v2 and false

#=> true

# class C
#   class << C
#     def hoge
#       'Hi'
#     end
#   end

#   def hoge
#     'Goodbye'
#   end
# end

# p C.hoge #=> Hi

# 10.times{|d| print d < 2...d > 5 ? "O" : "X" }
#=> OOOOOOOXXX