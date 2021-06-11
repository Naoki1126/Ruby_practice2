# class Foo
#     def bar(obj=nil)
#         obj.foo
#     end
#     protected
#     def foo
#         puts "foo"
#     end
# end
# Foo.new.bar(Foo.new)
 


# class Error1 < StandardError
# end
# class Error2 < Error1
# end
# begin
#     raise Error2
# rescue Error1 => ex
#     puts ex.class
#     puts ex
# end

#  class Foo
#    def Foo.foo
#     puts "foo"
#   end
#  end
#  Foo.foo


# v1 = 1
# MyModule = Module.new do
#   define_method :my_modu_method do
#     puts "#{v1}をモジュール定義内から参照"
#   end
# end
# MyClass = Class.new do
#   puts "#{v1} をクラス定義内から参照"
#   include MyModule
#   define_method :my_cla_method do
#       puts "#{v1} をメソッド定義内から参照"
#   end
# end
# MyClass.new.my_modu_method
# MyClass.new.my_cla_method

# # 1をモジュール定義内から参照
# # 1をクラス定義内から参照

class MyClass
    v1 = 1
    
    private
    def my_method
      puts "マイメソッド"
    end
  end
  
  c = MyClass.new
  # ブロック内部処理を実行
  c.instance_eval do
    # 内部を書き換える
    v1 = 2
    # obj指定なしで内部コンテキストでメソッド呼び出し可能
    puts v1 # => 2
    my_method # => マイメソッド
  end