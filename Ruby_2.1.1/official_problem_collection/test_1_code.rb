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


%r|(http://www(\.)(.*)/)| =~ "http://www.abc.com/"
p $0
p $1
p $2
p $3

require "date"

date = Date.new(2000,10,10)
p date
puts date

p date << 3
p date >> 3