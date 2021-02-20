class MyClass
    def testing_self
        @var = 10 # selfのインスタンス変数
        my_method # self.my_methodと同じ
        self
    end

    def my_method
        @var = @var + 1
        puts @var
    end
end

obj = MyClass.new
puts obj.testing_self #=> #<MyClass:0x007fb2789330a0 @var = 11>