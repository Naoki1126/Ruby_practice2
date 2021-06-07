# # class_eval #module_eval
# # モジュールにて定義。
# #クラスやモジュールに使用できるが、インスタンスには使用できない
# p String.respond_to?(:class_eval) #=> true
# p Enumerable.respond_to?(:module_eval) #=> true
# p 'xxx'.respond_to?(:class_eval) #=> true

# #instance_eval
# #Objectにて定義。クラスにもオブジェクトにも使用できる。
# p String.respond_to?(:instance_eval) #=> true
# p "xxxx".respond_to?(:instance_eval) #=> true


# class Hoge
# end

# h = Hoge.new

# Hoge.class_eval do
#   define_method :class_eval_define_method do #=> インスタンスメソッドの定義
#     1
#   end
# end

# p h.class_eval_define_method # => 1

# Hoge.instance_eval do
#   define_method :instance_eval_define_method do #=> インスタンスメソッドの定義
#     2
#   end
# end

# p h.instance_eval_define_method # => 2

# Hoge.class_eval do #defの場合もインスタンスメソッドの定義になる
#   def class_eval_def
#     3
#   end
# end

# p h.class_eval_def # => 3

# Hoge.instance_eval do #=> #defの場合はクラスメソッドの定義になる
#   def instance_eval_def
#     4
#   end
# end

# h.class.instance_eval_def # => 4
# # h.instance_eval_def # => 
# p Hoge.instance_eval_def #=> 4



# class EvalTarget
#   @class_class_instance = 10
#   class << self
#     def class_class_instance
#       @class_class_instance
#     end
#   end
# end




# EvalTarget.class_class_instance #=> 10

# # class_evalを使用してクラスインスタンス変数を変更
# EvalTarget.class_eval do
#   @class_class_instance = 5
# end

# p EvalTarget.class_class_instance

# # test_val = 1

# # class DifineClass
# #   @class_class_instance = test_val #=> undefined local variables 'test_val'
# # end

# # class EvalTarget; end

# # val = 1

# # EvalTarget.class_eval do #=> class_evalの使用によりローカル変数を持ち込むことができる。
# #   @class_class_instance  = val
# # end

# # # p EvalTarget.class_class_instance

# class EvalTarget
#   attr_reader :instance_val

#   def initialize
#     @instance_val = 0
#   end

# end

# e1 = EvalTarget.new

# puts e1.instance_val #=> 0

# e1.instance_eval do
#   @instance_val = 10
# end

# puts e1.instance_val



# class EvalTarget
#   private

#   def private_method
#     @instance_val = 100
#   end
# end

# e1.instance_eval do
#   private_method
# end

# p e1.instance_val


# class EvalTarget
# end

# t1 = EvalTarget.new
# t2 = EvalTarget.new

# EvalTarget.class_eval do
#   def class_method
#     :class_method
#   end
# end


# puts t1.class_method #=> :class_method
# puts t2.class_method #=> :class_method

# t1.instance_eval do #=> レシーバーとなるオブジェクトに特異メソッドを定義する
#   def unique_method
#     :unique_method
#   end
# end

# p t1.unique_method #=> unique_method
# p t2.unique_method #=> No Method Error

class EvalTarget
  CONST_VAL = "EvalTarget::CONST"
  attr_accessor :instance_val
end

CONST_VAL = "CONST"


e1 = EvalTarget.new
e1.instance_eval{ @instance_val = CONST_VAL}
puts e1.instance_val

e1.instance_exec(CONST_VAL) {|const_val| @instance_val = const_val }
puts e1.instance_val