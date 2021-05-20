my_var = "success"

MyClass = Class.new do
    puts "クラス定義の中にスコープを超えて変数を渡す#{my_var}"

    define_method :my_method do
      puts  "メソッド定義の中も#{my_var}"
    end
end

MyClass.new.my_method

klass_object = nil

ThirdClass = Class.new do |klass|
    klass_object = klass
    puts klass
    puts klass.new
    puts self
end
