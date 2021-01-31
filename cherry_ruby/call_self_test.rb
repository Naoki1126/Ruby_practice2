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

Foo.bar #=> NoMethod

user = User.new
user.to_s
user.nil? # objectクラスを継承しているため、メソッドが使える。
User.superclass #=> Object

user.methods.sort #=> [:!, :!=, :!~, :<=>, :==, (省略) :untrust, :untrasted?]


user.instance_of?(User) #=> true

user.instance_of?(String) #=> false

#instance_of?はクラスがまったく同じでないとtrueにならない
user.instance_of(Object) #=> false

#is_a? メソッド 継承関係にあるかどうか

 user.is_a(User)  #=> true
 user.is_a(Object) #=> true
 user.is_a??(BasicObject) #=> true

 #is_a関係にない場合はfalse
 user.is_a?(String) #=> false
 

