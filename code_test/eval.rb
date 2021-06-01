# class_eval #module_eval
# モジュールにて定義。
#クラスやモジュールに使用できるが、インスタンスには使用できない
p String.respond_to?(:class_eval) #=> true
p Enumerable.respond_to?(:module_eval) #=> true
p 'xxx'.respond_to?(:class_eval) #=> true

#instance_eval
#Objectにて定義。クラスにもオブジェクトにも使用できる。
p String.respond_to?(:instance_eval) #=> true
p "xxxx".respond_to?(:instance_eval) #=> true


class Hoge
end

h = Hoge.new

Hoge.class_eval do
  define_method :class_eval_define_method do #=> インスタンスメソッドの定義
    1
  end
end

p h.class_eval_define_method # => 1

Hoge.instance_eval do
  define_method :instance_eval_define_method do #=> インスタンスメソッドの定義
    2
  end
end

p h.instance_eval_define_method # => 2

Hoge.class_eval do #defの場合もインスタンスメソッドの定義になる
  def class_eval_def
    3
  end
end

p h.class_eval_def # => 3

Hoge.instance_eval do #=> #defの場合はクラスメソッドの定義になる
  def instance_eval_def
    4
  end
end

h.class.instance_eval_def # => 4
# h.instance_eval_def # => 
p Hoge.instance_eval_def #=> 4

