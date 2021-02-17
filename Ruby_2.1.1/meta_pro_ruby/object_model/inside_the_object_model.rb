class MyClass
    def my_method
        @v = 1
    end
end

obj = MyClass.new
obj.my_method #=> 1

obj.instance_variables #=> @v

#obj.my_methodを呼び出さなれければインスタンス変数は存在しない

obj.methods #=> objが持つメソッド一覧
#Objectクラスから継承を受けているため数多くのメソッドがある
obj.methods.grep(/my/) #=> [:my_method]

# メソッドはオブジェクトにあるのではなく、クラスに存在している

#オブジェクトのインスタンス変数はオブジェクトに住んでいる。　
#オブジェクトのメソッドはオブジェクトのクラスに住んでいる。

#クラスはオブジェクト
"hello".class #=> String
String.class #=> Class

#オブジェクトのメソッドはそのクラスのインスタンスメソッド
# クラスのメソッドはClassクラスのインスタンスメソッド

Class.instance_methods(false) #=> [:allocate, :new, :superclass]
#falseは継承元のメソッドは無視するという意味

Array.superclass #=> Object
Object.superclass #=> BasicObject
BasicObject.superclass #=> nil

#ArrayクラスはObjectクラスを継承している。配列はオブジェクトである。

 Class.superclass #=> module

#全てのクラスはモジュール（クラスはnew,allocate,superclassを追加したモジュールと言える）