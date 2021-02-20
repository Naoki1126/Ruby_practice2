class MyClass
    def my_mehod; 'y_mehod()'; end
end

class MySubclass < MyClass
end

obj = MySubclass.new
obj.my_method() #=> "my_mehod()"

MySubclass.ancestors #=> [MySubclass, MyClass, Object, Kernek, BasicObject]
