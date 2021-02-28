# module M
#     def class_m
#         "class_m"
#     end
# end

# class C
#     include M
#     def self.test
#         "test"
#     end
# end

# p C.methods.include? :class_m #=> false
# p C.methods.include? :test #=> true
# #include Moduleのインスタンスメソッドをミックスインする
# c.methodは　特異メソッドを表示する

# class C
#     def initialize
#       p self.class
#     end
#   end
#   class C2 < C
#   end
  
#  a = C2.new
#  p a #=> C2

#  class C
#     class << C
#       def hoge
#         'Hi'
#       end
#     end
  
#     def hoge
#       'Goodbye'
#     end
#   end
  
#   p C.new.hoge #=> goobye (インスタンスメソッド)
#   p C.hoge #=> Hi クラスメソッド（特異メソッド）


# # 5
#   class S
#     @@val = 0
#     def initialize
#       @@val += 1
#     end
#   end
  
#   class C < S
#     class << C
#       @@val += 1
#     end
  
#     def initialize
#     end
#   end
  
#  # class << C end;の処理は定義の段階で実行される
#   C.new #=> オーバーライドにより、@@val += 1 は実行されない
#   p C.class_variable_get(:@@val) #=> 1
#   C.new #=> オーバーライドにより、@@val += 1 は実行されない
#   p C.class_variable_get(:@@val) #=> 1
#   S.new
#   p C.class_variable_get(:@@val) #=> 2
#   S.new
#   p C.class_variable_get(:@@val) #=> 3
#   p C.class_variable_get(:@@val) #=> 3

# class Object
#     CONST = "100"
# end

# class C
#     CONST = "010"
#     class << self
#         CONST = "001"

#         def constants
#             CONST
#         end
#     end
# end

# p C::CONST #=> 010
# p Object::CONST #=> 100

# p C.constants #=> 001

# def hoge(*args, &block)
#     block.call(*args)
#   end
  
#   hoge(1,2,3,4) do |*args|
#     p args.length > 0 ? "hello" : args
#   end

#   def m1(*)
#     str = yield if block_given?
#     p "m1 #{str}"
#   end
  
#   def m2(*)
#     str = yield if block_given?
#     p "m2 #{str}"
#   end
  
#   m1 m2 do
#     "hello"
#   end

# "m2 "
# "m1 hello"


# class C
#     def m1
#       200
#     end
#   end
  
#   module R
#     refine C do
#       def m1
#         100
#       end
#     end
#   end

#   class C
#     using R

#     def price
#         puts m1
#     end
#   end
#   c = C.new                
#   puts c.m1 #=> 200
#   puts c.price

# module M
#     def method_missing(id, *args)
#         puts "M#method_missing"
#     end
# end
# class A
#     include M
#     def method_missing(id, *args)
#         puts "A#method_missing"
#     end
# end
# class B < A
#     class << self
#         def method_missing(id, *args)
#         puts "B.method_missing"
#         end
#     end
# end

# #method_missingは最後に呼び出されるメソッド
# B.new.dummy_method #=> A#method_missing インスタンスメソッドの呼び出し
# B.dummy_method #=> B.method_missing 特異メソッドの呼び出し


# class C
#     def self.m1
#       200
#     end
#   end
  
#   module R
#     refine C do
#       def self.m1
#         100
#       end
#     end
#   end

#   using R
#   puts C.m1 #=> 200

# class C
#     def self.m1
#         'C.m1'
#     end

#     def self.m3
#         'C.m3'
#     end
# end

# module M
#     refine C.singleton_class do
#         def m1
#         'C.m1 in M'
#         end

#         def m2
#         'C.m2 in M'
#         end

#         def m3
#             'C.m3 in M'
#         end
#     end
# end

# using M
  
# puts C.m1 # C.mi in M
# puts C.m2
# puts C.m3

# #クラスメソッドを再定義するためにはsingleton_classを使用。selfは無名モジュールを指す

# class Human
#     NAME = "Unknown"

#     def self.name
#       const_get(:NAME)
#     end
#   end
#   class Fukuzawa < Human
#     NAME = "Yukichi"
#   end
  

#   class MARUYAMA < Human
#   end
#   puts Fukuzawa.name #=> Yukichi

#   puts Human.name #=> Unknown

#   puts MARUYAMA.name #=> Unknown

  #const_get引数の定数をself から探索する。自クラスに定義がない場合はメソッド同様探索を行う


# class C
#   public
#     def initialize
#     end
#   end
  
#   p C.new.private_methods.include? :initialize
#   p C.private_methods
#   p C.new.private_methods == C.private_methods #=> false クラスメソッドとインスタンスメソッドはやはり違う

#=> initializeはprivateメソッド


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
#     @@val += 1
#     super
#   end
# end

# C.new
# p C.class_variable_get(:@@val)　#=> 3 特異メソッド・C.intialize・superのS.initialize
# C.new
# p C.class_variable_get(:@@val) #=> 5 C.initialize and S.initialize
# S.new
# p C.class_variable_get(:@@val) #=> 6 S.iniitialize
# S.new
# p C.class_variable_get(:@@val) #=> 7 S.initialize


# def hoge(*args, &block)
#   block.call(*args)
# end

# hoge(1,2,3,4) do |*args|
#   p args.length > 0 ? "hello" : args
# end
 
# #=> hello


class C
  def m1(value)
    100 + value
  end
end

module R1
  refine C do
    def m1
      super 50
    end
  end
end

module R2
  refine C do
    def m1
      super 100
    end
  end
end

using R1
using R2

puts C.new.m1 #=> 200