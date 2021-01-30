class User
    attr_accessor: name

    def initialize(name)
        @name = name
    end

    def rename_to_bob
        name = "Bob" #ローカル変数への代入として見られる。
    end

    def rename_to_carol
        self.name = "Carol"
    end

    def rename_to_dave
        @name = "Dave"
    end
end

user = User.new("Alice")
user.rename_to_bob
user.name #=> "Alice"

user.rename_to_carol
user.name #=> "Carol"

user.rename_to_dave
user.name #=> "Dave"

#name= のようなセッターメソッドを呼び出す場合はselfを必ずつける。

class Foo
    #このputs はクラス定義の読み込み時に呼び出される
    puts "クラス構文の直下のself: #{self}"

    def self.bar
        puts "クラスメソッド内のself: #{self}"
    end

    def baz
        self.bar
    end
end

