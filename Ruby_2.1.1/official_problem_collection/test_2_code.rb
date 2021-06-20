# require 'date'

# date = Date.new(2000,1,1)
# puts date << 1
# puts date >> 1
# # puts Date.instance_methods
# p [1,2,3,4,5].inject(0,&:+)

# %r|(http://www(\.)(.*)/)| =~ "http://www.abc.com/"
# p $0
# p $1
# p $2
# p $3

# ENV["path"] = "path"

# arr = [1,2,3,4,5].freeze
# arr += [1,2,3]
# arr = [1]
# p arr.map!{ |ar| ar.next}


# def method
#     begin
#         "a"
#     rescue
#         "b"
#     else
#         "C"
#     ensure
#         "e"
#     end
# end


# p method #=> C


# def method2
#     begin
#         p "a"
#     rescue
#         p "b"
#     else
#         p "C"
#     ensure
#         p "e"
#     end
# end

# method2

# def test_method
#     a, b = catch :exit do
#         for x in 1..10
#             for y in 1..10
#                 return [x, y] if x + y == 10
#             end
#         end
#     end
#     p a
#     p b
# end


# a, b = catch :exit do
#     for x in 1..10
#       for y in 1..10
#         break [x, y] if x + y == 10
#       end
#     end
#   end
# puts a
# puts b

# a, b = catch :exit do
#     for x in 1..10
#       for y in 1..10
#         next [x, y] if x + y == 10
#       end
#     end
#   end

# puts a
# puts b


# a, b = catch :exit do
#     for x in 1..10
#       for y in 1..10
#         throw :exit, [x, y] if x + y == 10
#       end
#     end
#   end
#   puts a, b


#   p test_method


# def func(arg, *args)
#     p arg
#     p args
#     p *args
#   end
  
#   func [1, 2, 3]
  
#   # 実行結果
#   1
#   [2, 3]
#   2
#   3

#   puts *[1,2,3].class
#   p [1,2,3]
#   p *[1,2,3]


# class C
#     def method_missing(name)
#        puts  "メソッド #{name} は存在しません"
#        super
#     end

#     def self.method_missing(name)
#         puts "クラスメソッド#{name}は存在しません"
#     end

# end

# C.new.new_method
# C.new_method

# var1 = "aaaa".freeze
# var1 = "bbbb"
# p var1

# p var1.replace("var")
# var1.freeze
# p var1.replace("var2")
# p var1

# module M
#     def self.foo
#         puts "foo"
#     end

#     def foo
#         puts "foo2"
#     end

# end

# class C
#     # extend M
#     # include M
# end

# obj = C.new
# obj.extend(M)
# obj.foo



# module M
#     def self.append_features(include_class_name)
#       puts "append_features"
#       super # このsuperを書かないとエラー発生
#     end
#     def func
#       p "Hello World"
#     end
#   end
  
#   class C
#     include M
#   end
  
# #   C.new.func
  


# class C
#     def func
#         puts "hello"
#     end


#     def hoge
#         puts "hoge"
#     end
# end

# C.class_eval do
#     remove_method :func,:hoge
# end

# C.new.func

a = [1,2,3,4,5,6].lazy.select{ |e| e % 2 == 0}
b = a.map { |e| e*2 }
c = a.take(3)


puts a,b,c
puts c.force
puts c.first

arr = [1,2].freeze
arr = 3