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

# def foo(arg1:100, arg2:200)
#   puts arg1
#   puts arg2
# end

# option = {arg2: 900}

# foo arg1: 200, **option

# #=> 200
# #=> 900

# class Integer
#   def +(other)
#     self.-(other)
#   end
# end

# p 1 + 1 #=> 2

# p 1.class.ancestors #=> [Fixnum, Integer, Numeric, Comparable, Object, Kernel, BasicObject]
# p Numeric.method_defined?(:+) #=> false
# p Integer.method_defined?(:+) #=> false
# p Fixnum.method_defined?(:+)  #=> true

# class Fixnum
#   def +(other)
#     self.-(other)
#   end
# end

# p 1 + 1 #=> 0

# module M
#   @@val = 75

#   class Parent
#     @@val = 100
#   end

#   class Child < Parent
#     @@val += 50
#   end

#   if Child < Parent
#     @@val += 25
#   else
#     @@val += 30
#   end
# end

# p M::Child.class_variable_get(:@@val) #=> 150

# val = 1i * 1i
# puts val.class #=> complex

# def bar(&block)
#   block.yield
# end

# bar do
#   puts "hello, world"
# end

# def bar(&block)
#   block.call
# end

# bar do
#   puts "hello, world"
# end

# def bar(n, &block)
#   block.call
# end

# bar(5) {
#   puts "hello, world"
# }

# def bar(&block, n) #=> 引数の順が逆のためエラーが出る。
#   block.call
# end

# bar(5) {
#   puts "hello, world"
# }


# class Class
#   def method_missing(id, *args)
#     puts "Class#method_missing"
#   end
# end
# class A
#   def method_missing(id, *args)
#     puts "A#method_missing"
#   end
# end
# class B < A
#   def method_missing(id, *args)
#     puts "B#method_missing"
#   end
# end

# B.dummy_method #=> "Class#method_mission"
# # 継承チェーンをたどる。class B < class A < class Class

# class Human
#   NAME = "Unknown"

#   def name
#     NAME
#   end
# end

# class Noguchi < Human
#   NAME = "Hideyo"
# end

# puts Noguchi.new.name #=> Unknown

# begin
#   raise
# rescue => e
#   puts e.class #=> Runtime Error
# end

# module K
#   CONST = "Good, night"
#   class P
#   end
# end

# module K::P::M
#   class C
#     CONST = "Good, evening"
#   end
# end

# module M
#   class C
#     CONST = "Hello, world"
#   end
# end

# class K::P
#   class M::C
#     p CONST #=> Good evening
#   end
# end


# val = 100

# def method(val)
#   p val #=> 100
#   ## blockの戻り値が115  
#   yield(15+ val)
# end

# _proc = Proc.new{|arg| val + arg } #=> 115 val = 100 arg =15

# p method(val, &_proc)

# fiber = Fiber.new do
#   Fiber.yield 'Hi, there!'
# end

# p fiber.resume #=> Hi, there


# m = Module.new

# CONST = "Constant in Toplevel"

# _proc = Proc.new do
#   CONST = "Constant in Proc"
# end

# m.instance_eval(<<-EOS)
#   CONST = "Constant in Module instance"

#   def const
#     CONST
#   end
# EOS

# m.module_eval(&_proc)

# p m.const

# module M
#   def self.a
#     100
#   end
# end

# p M.a #=> 100

# # module M
# #   include self
# #   def a
# #     100
# #   end
# # end

# # p M.a

# module M
#   extend self
#   def a
#     100
#   end
# end

# p M.a #=> 100

# module M
#   class << self
#     def a
#       100
#     end
#   end
# end

# p M.a #=> 100

# mod = Module.new

# mod.module_eval do
#   EVAL_CONST = 100
# end

# puts "EVAL_CONST is defined? #{mod.const_defined?(:EVAL_CONST, false)}" #=> false
# puts "EVAL_CONST is defined? #{Object.const_defined?(:EVAL_CONST, false)}" #=> true

# class C
#   def self._singleton
#     class << C
#       self
#     end
#   end
# end

# p C._singleton

# # class C
# #   def self._singleton
# #     class << C
# #       val = self
# #     end
# #     val
# #   end
# # end

# # p C._singleton

# class C
# end

# def C._singleton
#   self
# end

# p C._singleton

# class C
# end

# class << C
#   def _singleton
#     self
#   end
# end

# p C._singleton

# class C
# end
# p C.singleton_class

# class Base
#   def name
#     p 'Base#name'
#   end
# end

# module Scope
#   class Base
#     def name
#       p 'Scope::Base#name'
#     end
#   end

#   class Inherited < Base
#     def name
#       p 'Scope::Inherited#name'
#       super()
#     end
#   end
# end

# inherited = Scope::Inherited.new
# inherited.name
# #=> Scope::Inherited#name
# #=> Base#name

# array = ["a", "b", "c"].map(&:freeze)
# array = array.freeze

# array.each do |chr|
#   chr.upcase!
# end

# p array

# characters = ["a", "b", "c"]

# characters.each do |chr|
#   chr.freeze
# end

# upcased = characters.map do |chr|
#   chr.upcase
# end

# p upcased #=> [A,B,C]
# #=> 破壊的変更ではないため


# class MyClass

#   def hello
#     hello
#   end
# end


# MyClass.class_eval do

# end


# class A
#   CONST = 100

#   class B
#     CONST = 10
#   end

#   class C < B

#     def const
#       p CONST
#     end
#   end

# end

# c = C.new
# c.const
