my_var = "success"

MyClass = Class.new do
    puts "クラス定義の中にスコープを超えて変数を渡す#{my_var}"

    define_method :my_method do
      puts  "メソッド定義の中も#{my_var}"
    end
end

MyClass.new.my_method