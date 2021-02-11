module Loggable
    # 特異メソッドとしてメソッドを定義する
    def self.log(text)
        puts "[LOG] #{text}"
    end
end

#他のクラスにミックスインしなくてもメソッドを呼び出せる
Loggable.log('Hello.') #=> [LOG] Hello.

 
module Loggable
    class << self #上と同様。selfが無いから書くのが楽
        def log(text)
            puts "[LOG] #{text}"
        end

        # 以下他の特異メソッドを定義
    end
end
Loggable.log('Hello') #=> [LOG]Hello

#module_function_method
#mix-inとしても、特異メソッドとしても使える

module Loggable
    def log(text)
        puts "[LOG] #{text}"
    end
    #logメソッドをミックスインとしても、モジュールの特異メソッドとしても使えるようにする
    module_function :log
end

#特異メソッドとしての呼び出し
Loggable.log('Hello') #=> [Log]Hello.

# Loggableモジュールをincludeしたクラスを定義する
class Product
    include Loggable

    def  title
        # includeした Loggableモジュールのlogメソッドを呼び出す
        log 'title is called'
        "A great .movie"
    end
end

#ミックスインとしてlogメソッドを呼び出す
product = Product.new
product.title
#=> [LOG] title is called.
# 'A great movie'

product = Product.new
product.log 'Hello' #=> NoMethodError: private method 'log'
#module_functionしたメソッドを他のクラスにミックスインすると自動的にPrivateメソッドになる

module Loggable
    #ここから下のメソッドは全てモジュール関数
    module_function

    def log(text)
        puts "[LOG] #{text}"
    end
end

#モジュールに定数を定義する
module Loggable
    #定数を定義する
    PREFIX = "[LOG]".freeze

    def log(text)
        puts "#{PREFIX} #{text}"
    end
end

Loggable::PREFIX #=> "[LOG]"


#Mathモジュール
#モジュール関数や定数を持つ

#モジュールの特異メソッドとしてsqrt(平方根)メソッドを利用する
Math.sqrt(2) #=> 1.41421356

class Calculator
    include Math

    def calc_sqrt(n)
        # ミックスインとしてMathモジュールのsqrtメソッドを使う
        sqrt(n)
    end
end

calculator = Calculator.new
calculator.calc_sqrt(2) #=> 1.41421356

#定数として、自然対数の底を表すEと円周率を表すPIという定数が定義されている’

Math::E #=> 2.7182281....
Math::PI #=> 3.14115.....

#Kernelモジュールのメソッドもモジュール関数になっているため、特異メソッドして呼び出すことができる
Kernel.puts "Hello." #=> Hello
Kernal.p [1,2,3] #=> [1,2,3]

