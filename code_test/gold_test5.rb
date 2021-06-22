# # class Foo
# #     def bar(obj=nil)
# #         obj.foo
# #     end
# #     protected
# #     def foo
# #         puts "foo"
# #     end
# # end
# # Foo.new.bar(Foo.new)
 


# # class Error1 < StandardError
# # end
# # class Error2 < Error1
# # end
# # begin
# #     raise Error2
# # rescue Error1 => ex
# #     puts ex.class
# #     puts ex
# # end

# #  class Foo
# #    def Foo.foo
# #     puts "foo"
# #   end
# #  end
# #  Foo.foo


# # v1 = 1
# # MyModule = Module.new do
# #   define_method :my_modu_method do
# #     puts "#{v1}をモジュール定義内から参照"
# #   end
# # end
# # MyClass = Class.new do
# #   puts "#{v1} をクラス定義内から参照"
# #   include MyModule
# #   define_method :my_cla_method do
# #       puts "#{v1} をメソッド定義内から参照"
# #   end
# # end
# # MyClass.new.my_modu_method
# # MyClass.new.my_cla_method

# # # 1をモジュール定義内から参照
# # # 1をクラス定義内から参照

# # class MyClass
# #     v1 = 1
    
# #     private
# #     def my_method
# #       puts "マイメソッド"
# #     end
# #   end
  
# #   c = MyClass.new
# #   # ブロック内部処理を実行
# #   c.instance_eval do
# #     # 内部を書き換える
# #     v1 = 2
# #     # obj指定なしで内部コンテキストでメソッド呼び出し可能
# #     puts v1 # => 2
# #     my_method # => マイメソッド
# #   end


# # p *[1,2,34]

# # x, *y = *[0,1,3]
# # # p x,y

# # def tag(name)
# #   puts "<#{name}> #{yield}</#{name}>"
# # end

# # tag(:p) {'Hello,World.'}

# # tag(:p) {'Hello,World.'}

# # def tag(name, &block)
# #   puts "<#{name}> #{yield}</#{name}>"
# # end

# # tag(:p) {'Hello,World.'}

# # def tag(name, &block)
# #   puts "<#{name}> #{block.call}</#{name}>"
# # end

# # tag(:p) {'Hello,World.'}

# # def hoge(*args)
# #   p *args
# # end

# # hoge [1,2,3]


# # def hoge(x:,y:2,**params)
# #   puts "#{x},#{y},#{params[:z]}"
# # end

# # hoge x:1, z:3

# # hi = ->(x){ puts "Hello, #{x}"}
# # hi.call("world")

# a,b = catch :exit do
#     for x in 1..10
#       for y in 1..10
#         throw :exit, [x,y] if x + y == 10
#       end
#     end
#   end

#   puts a,b


# module M
#   def foo
#     self.class
#   end
# end

# class C
#   include M
# end

# p C.new.foo


# class Cls1
#   def Cls1.foo
#     puts "cls1"
#   end

# end

# class Cls2 < Cls1
# #   def self.foo
# #     puts 'foo'
# #   end

# # end

# # Cls2.foo


# module M1
# end

# module M2
# end

# class Cls1
#   include M1
# end

# class Cls2 < Cls1
#   p self.ancestors

#   def self.ances
#     p self.ancestors
#   end

#   include M2
# end

# Cls2.ances


# class Object
#   X = "X"

#   def self.const_missing a
#     p "#{a}"
#   end
# end

# Y

module M
  def class_m
    "M.class_m"
  end
end

class C
  extend M
end

p C.methods.include?(:class_m)
p C.methods.grep(/class_m/)
p C.instance_methods.grep(/class_m/)
p C.singleton_class
p Class.nesting


class Array
  def succ_each(step = 1)
    return to_enum(:succ_each, step) unless block_given?

    each do |int|
      p int
      p step
      yield int + step
    end
  end
end

p [98, 99, 100].succ_each(2).map {|succ_chr| succ_chr.chr}
p [100,101,102].succ_each(3)

[101, 102, 103].succ_each(5) do |succ_chr|
  p succ_chr.chr
end