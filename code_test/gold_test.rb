
# # class C
# # end

# # module M
# #   refine C do # cの拡張
# #     def m1 #=> #C.new.m1というメソッドを定義
# #       100
# #     end
# #   end
# # end

# # class C
# #   def m1 #=> C.new.m1というメソッドをオーバーライド
# #     400
# #   end

# #   using M
# #   def self.using_m
# #   end
# # end


# # C.using_m

# # puts C.new.m1


# # class S
# #   @@val = 0
# #   def initialize
# #     @@val += 1
# #   end
# # end

# # class C < S
# #   class << C
# #     @@val += 1
# #   end

# #   def initialize
# #     @@val += 1
# #     super
# #   end
# # end

# # C.new #=> 1 + 1 + 1
# # C.new #=> 1 + 1
# # S.new #=> + 1
# # S.new #=> + 1

# # p C.class_variable_get(:@@val)

# # class C
# #     def m1(value)
# #       100 + value
# #     end
# #   end

# #   module R1
# #     refine C do
# #       def m1 #=> C.new.m1 = 150
# #         super 50
# #       end
# #     end
# #   end

# #   module R2
# #     refine C do
# #       def m1 #=> C.new.m1 = 200
# #         super 100
# #       end
# #     end
# #   end
  
# #   using R1 #=> 150
# #   using R2 #=> 200
  
# #   puts C.new.m1

# # class C
# #     CONST = "Hello, world"
# #   end
  
# #   $c = C.new
  
# #   class D
# #     class << $c
# #       def say
# #         CONST
# #       end
# #     end
# #   end
  
# #   p $c.say
# #   p $c #=> C objec

#   # def foo(arg1:100, arg2:200)
#   #   puts arg1
#   #   puts arg2
#   # end
  
#   # option = {arg2: 900}
  
#   # foo arg1: 200, **option

#   # enum_char = Enumerator.new do |yielder|
#   #   "apple".each_char do |chr|
#   #     yielder << chr
#   #   end
#   # end
#   # p enum_char
#   # p enum_char.inspect
#   # array = enum_char.map do |chr|
#   #   chr.ord
#   #   p chr
#   # end

#   # p array #=> [97, 112, 112, 108, 101]

#   # class Object
#   #   CONST = "1"
#   #   def const_succ
#   #     CONST.succ!
#   #   end
#   # end
  
#   # class Child1
#   #   const_succ
#   #   class << self
#   #     const_succ
#   #   end
#   # end
  
#   # class Child2
#   #   const_succ
#   #   def initialize
#   #     const_succ
#   #   end
#   # end
  
#   # Child1.new
#   # Child2.new
  
#   # p Object::CONST

# # class S
# #   def initialize
# #     puts "S#initialize"
# #   end
# # end

# # class C < S
# #   def initialize(*args)
# #     super()
# #     puts "C#initialize"
# #   end
# # end

# # C.new(1,2,3,4,5)

# # p "Matz is my tEacher"[/[J-P]\w+[^ ]/]

# # class Ca
# #   CONST = "001"
# # end

# # class Cb
# #   CONST = "010"
# # end

# # class Cc
# #   CONST = "011"
# # end

# # class Cd
# #   CONST = "100"
# # end

# # module M1
# #   class C0 < Ca
# #     class C1 < Cc
# #       class C2 < Cd
# #         p CONST

# #         class C2 < Cb
# #         end
# #       end
# #     end
# #   end
# # end

# # module A
# #   B = 42

# #   def f
# #     21
# #   end
# # end

# # A.module_eval do
# #   def self.f
# #     p B
# #   end
# # end

# # B = 15

# # A.f

# # def hoge(*args, &block)
# #   block.call(args)
# # end

# # hoge(1,2,3,4,5) do |*args|
# #   p args.length < 0 ? "hello" : args
# # end

# # test = ["a","b","c"]
# # test.each do |*ary|
# #   p ary
# # end

# # def display_value
# #   puts yield
# # end

# # display_value do
# #   next 4423
# # end

# # def with_current_time
# #   yield Time.now
# # end

# # with_current_time do |now, something|
# #   puts now.year
# # end


# # def default_argument_for_block
# #   yield #not path argument
# # end

# # default_argument_for_block do |val = "Hi"|
# #   puts val
# # end

# # def flexible_arguments_for_block
# #   yield 1,2,3
# # end

# # flexible_arguments_for_block do |*params|
# #   puts params.inspect
# # end

# def block_sample(&block)
#   puts 'stand up'

#   block.call if block

#   puts 'sit down'
# end

# block_sample do
#   puts 'walk'
# end


# def hoge(*args, &block)
#   block.call(args)
# end

# hoge(1,2,3,4,5) do |*args|
#   p args.length < 0 ? "hello" : args
# end


# # def greeting
# #     puts 'good morning'
# #     yield
# #     puts 'good evening'
# # end

# # greeting do
# #   puts 'hello'
# # end

# # def greeting
# #   puts 'good morning'
# #   text = yield 'hello' # ブロックに引数を渡す
# #   puts text
# # end

# # greeting do |text| #受け取った引数 |text|
# #   text * 2
# # end

# # def greeting2
# #   puts 'good morning'
# #   text = yield 'hello'
# #   puts text
# #   puts 'good evening'
# # end

# # greeting2 do |text, other|
# #   puts text * 2
# #   puts other.inspect
# # end


# def greeting3(&block) #②ブロックを受け取る
#   puts 'good morning'
#   unless block.nil?
#     text = block.call('hello')#③ブロックを実行する
#     puts text
#   end
#   puts 'good evening'
# end

# greeting3 do |text| #①do endまでを引数として渡す
#   text * 2
# end



# # module M
# #   def foo
# #     super
# #     puts "M#foo"
# #   end
# # end

# # class C2
# #   def foo
# #     puts "C2#foo"
# #   end
# # end

# # class C < C2
# #   def foo
# #     super
# #     puts "C#foo"
# #   end
# #   prepend M
# # end

# # C.new.foo
# # p C.ancestors

# # class C
# #   def self.m1
# #     200
# #   end
# # end

# # module R
# #   refine C.singleton_class do
# #     def m1
# #       100
# #     end
# #   end
# # end

# # using R

# # puts C.m1

# # module M
# #   def method_missing(id, *args)
# #     puts "M#method_missing"
# #   end
# # end
# # class A
# #   include M
# #   def method_missing(id, *args)
# #     puts "A#method_missing"
# #   end
# # end
# # class B < A
# #   class << self
# #     def method_missing(id, *args)
# #       puts "B.method_missing"
# #     end
# #   end
# # end

# # B.new.dummy_method

# # module M1
# # end

# # module M2
# # end

# # class C
# #   include M1, M2
# # end

# # p C.ancestors

# # class C
# # end

# # module M
# #   refine C do
# #     def m1
# #       100
# #     end
# #   end
# # end

# # class C
# #   def m1
# #     400
# #   end

# #   def self.using_m
# #     using M
# #   end
# # end

# # C.using_m

# # puts C.new.m1

# # module M
# #   def method_missing(id, *args)
# #     puts "M#method_missing"
# #   end
# # end
# # class A
# #   include M
# #   def method_missing(id, *args)
# #     puts "A#method_missing"
# #   end
# # end
# # class B < A
# #   def method_missing(id, *args)
# #     puts "B#method_missing"
# #   end
# # end

# # obj = B.new
# # obj.dummy_method

# # module M
# #   CONST = "Hello, world"
# # end

# # module M
# #   def self.say
# #     CONST
# #   end
# # end

# # p M::say

# # module M
# #   CONST = "Hello, world"
# # end

# # M.instance_eval(<<-CODE)
# #   def say
# #     CONST
# #   end
# # CODE

# # p M::say

# # module M
# #   CONST = "Hello, world"
# # end

# # class << M
# #   def say
# #     CONST
# #   end
# # end


# # p M::say


# # module M
# #   CONST = "Hello, world"
# # end

# # M.module_eval(<<-CODE)
# #   def self.say
# #     CONST
# #   end
# # # CODE

# # # p M::say

# # # def hoge(*args, &block)
# # #   block.call(*args)
# # # end

# # # hoge(1,2,3,4) do |*args|
# # #   p args.length > 0 ? "hello" : args
# # # end

# # # concat "aaaaaa"


# # require "date"

# # d = Date.new(2015, 1, 5)
# # puts d.strftime("%M/%-d/%Y")

# # hoge = 0


# # class Hoge
# #   def self.hoge
# #     hoge = 1
# #   end
# # end

# # puts Hoge.hoge

# # $val = 0

# # class Count
# #   def self.up
# #     $val = $val + 1
# #     $val == 3 ? true : false
# #   end
# # end

# # [*1..10].any? do
# #   Count.up
# # end

# # p $val

# # p [*1..10]
# # p [1..10]


# # $val = 0

# # class Count
# #   def self.up
# #     $val = $val + 1
# #     $val == 3 ? true : false
# #   end
# # end

# # [*1..10].any? do 
# #   Count.up
# # end

# p $val
# array = ["apple","aaaa","bbbb"]
# array.delete("aaaa")
# p array


# numbers = [1,2,3,4,5,6,7,8,9,10]

# # p numbers.delete_if{ |num| num % 2 == 0 } #=>[1, 3, 5, 7, 9]
# # p numbers #=> [1, 3, 5, 7, 9]


# # p numbers.reject { |num| num % 2 == 0} #=> [1, 3, 5, 7, 9]
# # p numbers #=>[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

# str = "1;2:3;4"
# p str.split(";|:") #=> ["1;2:3;4"]

# p str.split(/;|:/) #=> ["1", "2", "3", "4"]

# a = [1,2,3,4]
# p a[1..2] #=>1 から2番目

# p a[1,2]

# str = "string"
# p str[1,5]

# h = {a: 100, b: 200}
# h.each {|p|
#   puts p.class
# }

# campaign = ["life100","love100"]
# present = ["life100present", "love100present"]

# # campaign.each_with_index do |c,i|
# #   puts c
# #   print present[i]
# # end
# p campaign.zip(present) #=> [["life100", "life100present"], ["love100", "love100present"]]
# campaign.zip(present).each do |menu|
#   menu.each do |m|
#     puts m
#   end
# end



# p "Hello" % 5 #=> Hello


# str = "aaaa\naaaaa\naaaaa"

# puts str.chomp
# puts str.strip
# puts str.conca


# def my_method(&block)
#     x = "goodBye"
#     p block.call("cruel")
# end

# x="Hello"
# my_method{ |y| "#{x},#{y} World" }

# def just_yeild
#     yield
# end

# top_level_variable = 1

# just_yeild do
#     top_level_variable += 1
#     local_to_block = 1
# end

# p top_level_variable


# v1 = 1
# class MyClass
#     v2 = 2
#     local_variables
#     def my_method
#         v3 = 3
#         local_variables
#     end
#     local_variables
# end

# obj = MyClass.new
# p obj.my_method
# p local_variables
# p MyClass.class_variables

# def define_methods
#     shared = 0

#     Kernel.send :define_method, :counter do
#         shared
#     end

#     Kernel.send :define_method, :inc do |x|
#         shared += x
#     end
# end

# define_methods

# counter #=> 0
# inc(4) 
# counter #=> 4


# class MyClass
#     def initialize
#         @v = 1
#     end

#     obj = MyClass.new

#     obj.instance_eval do
#         self
#         @v #=> 1
#     end
# end


# def my_method(*args)

#     p args
# end

# my_method("aaa","bbb","ccc")


# class C
#     def initialize
#         @x = 1
#     end
# end

# class D
#     def twisted_method
#         @y = 2
#         C.new.instance_eval { "@x: #{@x}, @y: #{@y}"}
#     end
# end

# p D.new.twisted_method

# module M1
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

#   class C
#     def m1
#       400
#     end
#   end
  
#   module M
#     refine C do
#       def m1
#         100
#       end
#     end
#   end
  
#   class C
#     using M

#     def m2s
#         m1
#     end
#   end
  
#   puts C.new.m1
#   puts C.new.m2s

# class C
# CONST = "Hello, world"
# end

#   $c = C.new

#   class D
#     CONST = "good night"
#     class << $c
#       def say
#         CONST
#       end

#       def hello
#         puts "hello"
#       end
#     end
#   end
  
#   p $c.say
#   p $c.hello

#   puts
#   class C
#   CONST = "Hello, world"
# end

# $c = C.new

# class D
#   class << $c
#     def say
#       CONST
#     end
#   end
# end

# p $c.say
# p %r/apple banana orange/
# p %w/apple banana orange/
# p %/apple banana orange/


# require "date"
# d = Date.today - Date.new(2015,10,1)
# p d.class


# if 1 + 1 == 2 && ( 1-1 == 0 || 1-1 == 1)
#     puts "OK"
# end


# concat "AAAAAAAA"

# class C
#     def self.m1
#       200
#     end
#   end
  
#   module R
#     refine C do
#     extend self
#       def m1
#         100
#       end
#     end
#   end
  
#   using R
  
#   puts C.m1
#   puts C.new.m1

# class C
#     def self.m1
#       200
#     end
#   end
  
#   module R
#     refine C.singleton_class do
#       def m1
#         100
#       end
#     end
#   end
  
#   using R
  
#   puts C.m1



#   a = (1..5).partition(&:odd?)
#   p a
#   b = [2,3,4,5,6,7].partition{ |num| num % 2 == 0}
#   p b


# class C
#     def m1
#       200
#     end
#   end
  
#   module R
#     refine C do
#       def m1
#         300
#       end
#     end
#   end
  
#   using R
  
#   class C
#     def m1
#       100
#     end
#   end
  
#   puts C.new.m1

# # Refinment -> prepend -> class -> include -> superclass


# module A
#     B = 42
  
#     def f
#       21
#     end

#     def self.b
#         p B
#     end
#   end
  
#   A.module_eval do
#     def self.f
#       p B
#     end
#   end
  
#   B = 15
  
#   A.f
#   A.b


# m = Module.new

# m.instance_eval do
#   m.instance_variable_set :@block, Module.nesting
# end

# m.instance_eval(<<-EVAL)
#   m.instance_variable_set :@eval,  Module.nesting
# EVAL

# block = m.instance_variable_get :@block
# _eval =  m.instance_variable_get :@eval

# # puts block.size
# # puts _eval.size

# n = Module.new
# n.instance_eval do
#     def test_method
#         puts Module.nesting
#     end
#     def tttt
#         puts 'tttt'
#     end
# end

# n.instance_eval(<<-EVAL)
#     def test_method_string
#         p Module.nesting
#     end
# EVAL

# n.tttt
# n.test_method
# n.test_method_string.inspect

# class Test
#     CONST = "const1"

#     class Test2 < Test
#         CONST = "const2"

#         def test_method1
#             p CONST
#         end
#     end
# end


# module M1
#     # CONST = "111"
#     class C1
#       CONST = "001"
#     end
  
#     class C2 < C1
#     #   CONST = "010"
  
#       module M2
#         # CONST = "011"
  
#         class Ca
#         #   CONST = "100"
#         end
  
#         class Cb < Ca
#           p CONST
#         end
#       end
#     end
#   end


# a = ["a","b","c","d"].partition{ |str| str == "a"}
# p a


# class S
#     @@val = 0
#     def initialize
#       @@val += 1
#     end
# end

# class C < S
#     class << C
#         @@val += 1
#     end

#     def initialize
#         @@val += 1
#         super
#     end
# end

#   C.new #=>3
#   C.new #=>5
#   S.new #=>6
#   S.new #=>7

#   p C.class_variable_get(:@@val)


# v1 = 1 / 2 == 0
# v2 = !!v1 or raise RuntimeError
# puts v2 and false 

# fiber = Fiber.new{
#     puts "Hello world"
#     Fiber.yield
#     puts 'Hello (again)'
#  }

#  fiber.resume
#  fiber.resume
#  fiber.resume

#  fiber2 = Fiber.new{ |first|
#     puts first

#     second = Fiber.yield('goodbye')

#     puts second

#     'goodbye( again )'
#  }


#  puts fiber2.resume("hello")
#  puts fiber2.resume("hello ( again )")

if defined? testetetet
   puts defined? testetet
else
   puts 'false'
end




# # enum = "apple".each_char
# # enum = "apple".to_enum(:each)
# enum = "a p p l e".split(' ').enum_for(:each) #=> to_enumはeachなのでレシーバは配列でなければならない
# # enum = "apple".enum_for(:each_char)
# # enum = "a p p l e".split(' ').enum_for #=> enum_forに引数を与えないとto_enumと同じ挙動になる
# # #=> each_char　文字列の各文字に対して繰り返し処理を行う

# p enum
# p enum.next
# # p enum.next #=> a
# # p enum.next #=> p
# # p enum.next #=> p
# # p enum.next #=> l
# # p enum.next #=> e


p "Matz is my tEacher"[/[a-z][A-Z].*/]


m = Module.new

CONST = "Constant in Toplevel"

_proc = Proc.new do
  CONST = "Constant in Proc"
end

m.module_eval(<<-EOS)
  CONST = "Constant in Module instance"

  def const
    CONST
  end
  module_function :const
EOS

m.module_eval(&_proc)

p m.const

class EvalTarget
   def initialize
      @instance_val = "instance valiable"
   end

   def instance_binding
      local_val = 'local valiable'
      binding
   end

   private
   def private_method
      'Private method'
   end
end

e1 = EvalTarget.new
binding_obj = e1.instance_binding

p eval "@instance_val", binding_obj
p eval 'local_val',binding_obj
p eval 'private_method',binding_obj