# p "Hello Ruby"
# p ARGV[0]
# p ENV["PATH"]

# 1.upto 5 do |x| p x.class end
# 1.upto(5) do |x| p x.class end
# 1.upto(5){ |x| p x.class}

# # puts Integer.superclass #=> Numeric
# # puts Fixnum.superclass #=> Integer
# # puts 
# # puts Fixnum.instance_methods.grep(/-/)
# # puts Integer.methods.grep(/-/)
# # puts Fixnum.methods


# def tag(name)
#     puts "<#{name}>#{yield}</#{name}>"
# end

# tag(:p){"Hello World"}

# # def tag(name)
# #     puts "<#{name}>#{yield.call}</#{name}>"
# # end

# tag(:p){"Hello World"}

# def hoge(*args) #=> *の宣言によりArrayで受け取る。つまり二重Arrayになる
#     p args
# end

# hoge [1,2,3]

# def hoge(*args)
#     p *args #=> 配列が展開される
# end

# hoge [1,2,3]

# def hoge(args)
#     puts "Hello"
# end

# # hoge 1,2,3


# a,b = catch :exit do
#     for x in 1..10
#         for y in 1..10
#             throw :exit,[x,y] if x + y == 10
#         end
#     end
# end

# puts a,b

# class Cls1
#     def Cls1.foo
#         puts "cls1"
#         puts self
#     end

#     def self.hoge
#         puts "hoge"
#     end
# end

# class Cls2 < Cls1
#     def foo
#         puts "Cls2"
#     end
# end

# Cls2.foo
# Cls1.hoge

# module Mod1; end
# module Mod2; end

# class Cls1
#     prepend Mod1
# end

# class Cls2 < Cls1
#     prepend Mod2
# end

# p Cls2.ancestors

# module M1
# end

# module M2
# end

# class Cls1
#     include M1
# end

# class Cls2 < Cls1
#     p self.ancestors
#     include M2
# end


# class Object
#     X = "X"

#     def self.const_missing a
#         p "#{a}"
#     end
# end
# Y

# class C
#     def hoge
#         puts "A"
#     end
# end

# module M
#     refine C do
#         def hoge
#             puts "B"
#         end
#     end
# end

# c = C.new
# c.hoge
# using M

# c.hoge


# %r|(http://www(\.)(.*)/)| =~ "http://www.abc.com/"
# p $0
# p $1
# p $2
# p $3

# require "date"

# date = Date.new(2000,10,10)
# p date
# puts date

# p date << 3
# p date >> 3


# [1,2,3].each do |i|
#     num = i
# end

# puts num

# a = 1.0 + 1
# print a
# p a.class #=> Float
# a = a + (1/2r)
# print a
# puts a.class #=> Froat
# a = a + (1 + 2i)
# print a
# puts a.class #=> Comprex
# p Integer.superclass #=> Numeric
# p Complex.superclass #=> Numerics
# p Rational.superclass #=> Numeric
# p Float.superclass #=> Numeric
# p Fixnum.superclass #=> Integer
# p Numeric.superclass #=> Object

# p 1.class #=> Fixnum
# p 2r.class #=> Rational
# p (1/2r).class #=> Rational


# class A
#     private
#     def hoge
#         puts "A"
#     end
# end

# class B < A
#     public :hoge

#     # def hoge
#     #     puts "B"
#     # end
# end

# B.new.hoge #=> A

# ary = Array.new(3,"a")
# p ary
# ary.map{ |num| p num.object_id}
# ary[0].next!
# p ary #=> [b,b,b]


# Thread.fork do
# end

# class Hoge
#     def fuga(o = nil)
#         hoge
#     end

#     private
#     def hoge
#         puts "Hoge"
#     end
# end

# Hoge.new.fuga(Hoge.new)


# begin
#     "cat".narrow
# rescue NameError
#     raise
# end


# while DATA.gets
#     puts $_ if $_ =~ /Ruby/
# end

# __END__
# java programming
# Ruby programming
# C programming

# def method
#     puts "Hello World"
# end

# alias :old_method :method

# def method
#     old_method
#     puts "Hello Ruby"
# end


# method


# class A
#     @@x = 0
#     class << self
#         @@x = 1

#         def x
#             @@x
#         end

#     end

#     def x
#         @@x = 2
#     end
# end

# class B < A
#     @@x = 3
# end


# p A.x
# p B.x

# module M
#     def hoge
#         puts "hoge"
#     end

# end

# class A
#     extend M
# end


# A.hoge

# class A
#     $a = self

#     def hoge
#         $b = self
#     end

# end

# a = A.new
# a.hoge
# p A == $a
# p A.new == $b
# puts $b

# require 'date'

# d1 = DateTime.new
# d2 = DateTime.new

# # p (d2-d1).class #=> Rational

# require 'active_support/core_ext/class/subclasses'

# p Integer.subclass


class Class
	def subclasses
		subclasses = []
		ObjectSpace.each_object(singleton_class) do |k|
			subclasses << k if k.superclass == self
		end
		subclasses
	end
end

p Integer.subclasses #=> [Bignum, Fixnum]
p Rational.subclasses