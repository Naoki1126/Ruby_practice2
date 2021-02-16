class Greeting
    def initialize(text)
        @text = text
    end

    def welcome
        @text
    end
end

my_object = Greeting.new('Hello')

my_object.class #=> Greeting

puts my_object.class.instance_methods(false) #=> [:welcome]
# puts my_object.class.instance_methods #=> 全て返す
# false は自クラスのメソッドのみ、継承元クラスのメソッドは返さない


puts my_object.instance_variables #=>定義されているインスタンス変数を返す